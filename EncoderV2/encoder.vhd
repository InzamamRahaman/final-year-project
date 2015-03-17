----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:17:52 03/17/2015 
-- Design Name: 
-- Module Name:    encoder - Behavioral 
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

use work.size_data_pkg.all;
use work.encoder_state_pkg.all;


entity encoder is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  vq : in vq_index;
			  secret_bit : in std_logic;
			  more_secret : in std_logic;
			  send_more : out std_logic;
           entry : out  STD_LOGIC);
end encoder;

architecture Behavioral of encoder is
	signal current_state : encoder_state;
	signal next_state : encoder_state;
	signal li : list_index;
begin

	-- self orgnaizing list
	
	list_unit : entity work.list(Behavioral) port
		map (
			vq => vq;
			index => li;
		);
	
	transition_pr : process(clk, rst)
		if rst = '1' then
			current_state <= READING_DATA;
		elsif rising_edge(clk) then
			current_state <= next_state;
		end if;
	end process;
	
	encoding_pr : process(vq, secret_bit)
		variable output_buffer : std_logic_vector(1 to MAX_BUFFER_SIZE);
		variable current : buffer_index;
		variable buffer_size : buffer_index;
	begin
		case current_state is
			when INFORM_USER =>
				send_more <= '1';
				next_state <= READING_DATA;
				output_buffer := (others => '0');
				buffer_size := 0;
			when READING_DATA =>
				send_more <= '0';
				if vq = 0 then
					next_state <= DONE;
				elsif li = 0 then
					next_state <= INDEX_CONTAINED_FALSE;
				else
					next_state <= INDEX_CONTAINED_TRUE;
				end if;
			when INDEX_CONTAINED_FALSE =>
				current := 0;
				buffer_size := 10;
				output_buffer(1 to 10) := "00" 
					& std_logic_vector(to_unsigned(vq, 8));
				next_state <= SEND_ENCODING;
			when SEND_ENCODING =>
				if buffer_index = 0 then
					next_state <= READING_DATA;
				else
					entry <= output_buffer(current);
					current := current + 1;
					buffer_size := buffer_index - 1;
				end if;
	end process;
	


end Behavioral;

