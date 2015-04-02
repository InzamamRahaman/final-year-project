----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:37:27 04/01/2015 
-- Design Name: 
-- Module Name:    decoder - decoder_arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.size_constraints_pkg.all;
use work.decoder_state_pkg.all;

entity decoder is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  bit_in : in std_logic;
			  data_finished : in std_logic;
			  need_more_data_out : out std_logic;
           finished_out : out  STD_LOGIC;
           sending_bit_out : out  STD_LOGIC;
           bit_out : out  STD_LOGIC;
			  vq_index_out : out std_logic_vector(
					MAX_NUMBER_OF_BITS_FOR_VQ - 1 downto 0);
			  sending_vq_index_out : out std_logic);
end decoder;

architecture decoder_arch of decoder is
	signal data_buffer : std_logic_vector(MAX_BUFFER_SIZE - 1 downto 0);
	signal buffer_len : buffer_index ;
	signal current_state : decoder_state;
	
	-- signals for managing lists
	signal enable_insert : std_logic;
	signal to_insert : vq_index;
	signal index : list_index;
	signal enable_read : std_logic;
	signal at_index_one : vq_index;
	signal value_at_index : vq_index;
	signal vq_acc : vq_index;
	signal list_index_acc : list_index;
	signal counter : counter_int;
	-- component for list
	component list
		Port (
			clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         enable_insert : in  STD_LOGIC; -- enable the insertion of a vq index
         to_insert : in vq_index; -- the vq index to be inserted
         index : in  list_index; -- the position of the item we want to retrieve
			enable_read : in std_logic; -- enable the reading of the list at param index
         at_index_one : out  vq_index; -- the value in the first position of the list
         value_at_index : out  vq_index
		);
	end component;
	
begin

	list_unit : list port map (
		clk => clk, rst => rst,
		enable_insert => enable_insert,
		to_insert => to_insert,
		index => index,
		enable_read => enable_read,
		at_index_one => at_index_one,
		value_at_index => value_at_index
	);

	main_pr : process(clk, rst)
	begin
		if rst = '1' then
			data_buffer <= (others => '0');
			buffer_len <= 0;
			current_state <= START;
		elsif rising_edge(clk) then
			-- set all output ports to 0
			finished_out <= '0';
			sending_bit_out <= '0';
			bit_out <= '0';
			vq_index_out <= (others => '0');
			sending_vq_index_out <= '0';
			need_more_data_out <= '0';
			-- flush all list inputs
			enable_insert <= '0';
			enable_read <= '0';
			to_insert <= 0;
			index <= 1;
			
			case current_state is
				when START =>
					current_state <= START_DECODING;
				when START_DECODING =>
					if data_finished = '0' then
						need_more_data_out <= '1';
						if bit_in = '1' then
							current_state <= START_WITH_ONE;
						else
							current_state <= START_WITH_ZERO;
						end if;
					else
						finished_out <= '1';
						current_state <= DONE;
					end if;
				when START_WITH_ZERO =>
					need_more_data_out <= '1';
					if bit_in = '0' then
						current_state <= EXTRACT_VQ_INDEX;
						vq_acc <= 0;
						counter <= 8;
					else
						current_state <= CHECK_NEXT_BIT;
					end if;
				when INSERT_INTO_LIST =>
					to_insert <= vq_acc;
					enable_insert <= '1';
					current_state <= START_DECODING;
				when EXTRACT_VQ_INDEX =>
					if counter = 0 then
						need_more_data_out <= '0';
						current_state <= INSERT_INTO_LIST;
						sending_vq_index_out <= '1';
						vq_index_out <= std_logic_vector(to_unsigned(vq_acc, MAX_NUMBER_OF_BITS_FOR_VQ));
					else
						need_more_data_out <= '1';
					   if bit_in = '1' then
							vq_acc <= vq_acc * 2 + 1;
						else
							vq_acc <= vq_acc + 0;
						end if;
						counter <= counter - 1;
					end if;
				when START_WITH_ONE =>
					need_more_data_out <= '1';
					if bit_in = '0' then
					   counter <= 1;
						current_state <= COMPUTE_LIST_INDEX;
					else
						--current_state <= SEND_FIRST_OF_LIST;
						current_state <= START_DECODING;
						sending_vq_index_out <= '1';
						vq_index_out <= std_logic_vector(to_unsigned(at_index_one, MAX_NUMBER_OF_BITS_FOR_VQ));
					end if;
				when CHECK_NEXT_BIT =>
					need_more_data_out <= '1';
					if bit_in = '1' then
						sending_vq_index_out <= '1';
						vq_index_out <= std_logic_vector(to_unsigned(at_index_one, MAX_NUMBER_OF_BITS_FOR_VQ));
						current_state <= START_DECODING;
					else
						counter <= 1;
						current_state <= COMPUTE_LIST_INDEX;
					end if;
				when COMPUTE_LIST_INDEX =>
					need_more_data_out <= '1';
					if bit_in = '0' then
						counter <= counter + 1;
						current_state <= COMPUTE_LIST_INDEX;
					else
						counter <= counter + 2;
						list_index_acc <= 1;
						current_state <= EXTRACT_LIST_INDEX;
					end if;
				when EXTRACT_LIST_INDEX =>
					if counter = 0 then
						current_state <= AWAIT_LIST_PROCESSING;
						enable_read <= '1';
						index <= list_index_acc;
					else
					   need_more_data_out <= '1';
					   counter <= counter - 1;
						need_more_data_out <= '1';
						if bit_in = '1' then
							list_index_acc <= list_index_acc * 2 + 1;
						else
							list_index_acc <= list_index_acc + 0;
						end if;
					end if;
				when AWAIT_LIST_PROCESSING =>
					current_state <= READ_LIST_RESPONSE;
				when READ_LIST_RESPONSE =>
					sending_vq_index_out <= '1';
					vq_index_out <= std_logic_vector(to_unsigned(value_at_index, MAX_NUMBER_OF_BITS_FOR_VQ));
				when DONE =>
					finished_out <= '1';
					current_state <= DONE;
			end case;
		end if;
	end process;


end decoder_arch;

