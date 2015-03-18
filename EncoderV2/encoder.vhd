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
use IEEE.NUMERIC_STD.ALL;

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
			  send_more : out std_logic;
           entry : out  STD_LOGIC_VECTOR(1 to MAX_BUFFER_SIZE);
			  entry_len : out STD_LOGIC_VECTOR(3 downto 0);
			  finished : out std_logic
			  );
end encoder;

architecture Behavioral of encoder is
	signal current_state : encoder_state;
	signal next_state : encoder_state;
	signal li : list_index;
begin

	-- self orgnaizing list
	
	list_unit : entity work.list(Behavioral) port
		map (
			vq => vq,
			index => li
		);
	
	transition_pr : process(clk, rst)
	begin
		if rst = '1' then
			current_state <= READING_DATA;
		elsif rising_edge(clk) then
			current_state <= next_state;
		end if;
	end process;
	
	
	
	encoding_pr : process(current_state, vq, li, secret_bit)
		variable output_buffer : std_logic_vector(1 to MAX_BUFFER_SIZE) := (others => '0');
		variable buffer_size : buffer_index := 0;
	begin
		case current_state is
			when INFORM_USER =>
				next_state <= READING_DATA;
				send_more <= '1';
				output_buffer := (others => '0');
				entry <= (others => '0');
				entry_len <= (others => '0');
				buffer_size := 0;
				finished <= '0';
			when READING_DATA =>
				if vq = 0 then
					next_state <= DONE;
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					finished <= '0';
				elsif li = 0 then
					next_state <= INDEX_CONTAINED_FALSE;
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					finished <= '0';
				else
					next_state <= INDEX_CONTAINED_TRUE;
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					finished <= '0';
				end if;
			when INDEX_CONTAINED_FALSE =>
				send_more <= '0';
				entry <= (others => '0');
				entry_len <= (others => '0');
				buffer_size := 10;
				output_buffer(1 to 10) := "00" 
					& std_logic_vector(to_unsigned(vq, 8));
				next_state <= SEND_ENCODING;
				finished <= '0';
			when SEND_ENCODING =>
				send_more <= '0';
				entry <= output_buffer;
				entry_len <= std_logic_vector(to_unsigned(buffer_size, 4));
				next_state <= INFORM_USER;
				finished <= '0';
			when INDEX_CONTAINED_TRUE =>
				if secret_bit = '0' then
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					next_state <= ALL_SECRET_ZERO_TRUE;
					finished <= '0';
				else
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					next_state <= ALL_SECRET_ZERO_FALSE;
					finished <= '0';
				end if;
			when ALL_SECRET_ZERO_TRUE =>
				if li = 1 then
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					next_state <= CASE_2;
					finished <= '0';
				else
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					next_state <= CASE_3;
					finished <= '0';
				end if;
			when ALL_SECRET_ZERO_FALSE =>
				if li = 1 then
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					next_state <= CASE_4;
					finished <= '0';
				else
					send_more <= '0';
					output_buffer := (others => '0');
					entry <= (others => '0');
					entry_len <= (others => '0');
					buffer_size := 0;
					next_state <= CASE_5;
					finished <= '0';
				end if;
			when CASE_2 =>
				send_more <= '0';
				entry <= (others => '0');
				entry_len <= (others => '0');
				output_buffer(1) := secret_bit;
				output_buffer(2 to 3) := "11";
				buffer_size := 3;
				next_state <= SEND_ENCODING;
				finished <= '0';
			when CASE_4 =>
				send_more <= '0';
				entry <= (others => '0');
				entry_len <= (others => '0');
				output_buffer(1) := secret_bit;
				output_buffer(2) := '1';
				buffer_size := 2;
				next_state <= SEND_ENCODING;
				finished <= '0';
			when CASE_3 => 
				send_more <= '0';
				output_buffer := (others => '0');
				entry <= (others => '0');
				entry_len <= (others => '0');
				buffer_size := 0;
				finished <= '0';
			when CASE_5 => 
				send_more <= '0';
				output_buffer := (others => '0');
				entry <= (others => '0');
				entry_len <= (others => '0');
				buffer_size := 0;
				finished <= '0';
			when DONE => 
				send_more <= '0';
				output_buffer := (others => '0');
				entry <= (others => '0');
				entry_len <= (others => '0');
				buffer_size := 0;
				finished <= '1';
				next_state <= DONE;
			end case;
	end process;
	


end Behavioral;

