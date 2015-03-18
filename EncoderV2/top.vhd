----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:04 03/18/2015 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           stream_segment : out  std_logic_vector(1 to MAX_BUFFER_SIZE);
           stream_segment_len : out  std_logic_vector(0 to 3));
end top;

architecture Behavioral of top is

begin
	
	main_pr : process(clk)
		signal stream_segment_len_pre : buffer_size;		
		signal sending : std_logic;
		signal vq_pre : std_logic_vector();
		signal vq : vq_index;
		signal secret_bit_pre : std_logic;
		signal secret_bit : std_logic;
		signal send_more : std_logic;
		signal image_address : std_logic_vector();
		signal secret_address : std_logic_vector();
	begin
	
		image_unit : entity work.IMAGE_RAM map port ();
	
		convert_unit : entity work.converter port
			map (
			
			);
		
		encoder_unit: entity work.encoder port
			map(
				clk => clk,
				rst => rst,
				vq => vq,
				secert_bit => secret_bit,
				sending => sending,
				send_more => send_more,
				entry => stream_segment,
				entry_len => stream_segment_len,
			);
		
	end;

end Behavioral;

