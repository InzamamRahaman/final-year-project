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
--use IEEE.NUMERIC_STD.ALL;

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
			  need_more_data_out : std_logic;
           finished_out : out  STD_LOGIC;
           sending_bit_out : out  STD_LOGIC;
           bit_out : out  STD_LOGIC;
			  vq_index_out : std_logic_vector(
					MAX_NUMBER_OF_BITS_FOR_VQ - 1 downto 0);
			  sending_vq_index_out : std_logic);
end decoder;

architecture decoder_arch of decoder is
	signal data_buffer : std_logic_vector(MAX_BUFFER_SIZE - 1 downto 0);
	signal buffer_len : buffer_index ;
	signal current_state : decoder_state;
begin

	main_pr : process(clk, rst)
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
			case current_state is
				when START =>
					current_state <= START_DECODING;
				when START_DECODING =>
					need_more_data_out <= '1';
					if bit_in = '1' then
						current_state <= START_WITH_ONE;
					else
						current_state <= START_WITH_ZERO;
					end if;
				when DONE =>
					finished_out <= '1';
					current_state <= DONE;
			end case;
		end if;
	end process;


end decoder_arch;

