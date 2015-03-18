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
           stream_segment_len : out  std_logic_vector(3 downto 0));
end top;

architecture Behavioral of top is

begin
	
	main_pr : process(clk)
		signal stream_segment_len_pre : buffer_size;		
		signal sending : std_logic;
		signal vq_pre : std_logic_vector(7 downto 0);
		signal vq : vq_index;
		signal secret_bit_pre : std_logic_vector(0 downto 0);
		signal secret_bit : std_logic;
		signal send_more : std_logic;
		signal image_address : std_logic_vector(14 downto 0);
		signal secret_address : std_logic_vector(16 downto 0);
	begin
	
		-- used to compute the newest addresses for the
		-- image RAM and secret RAM
		address_calculator_unit : entity work.address_calculator map
			port (
				image_address => image_address;
				secert_address => secret_address;
				compute_now => send_more
			);
	
		-- at clock cycle for data reading
		-- extracts the current vq index from RAM
		image_unit : entity work.IMAGE_RAM map port (
			
		);
		
		-- at clock cycle for data reading
		-- extracts the current secert bit from RAM
		secret_unit : entity work.SECRET_RAM map port (
		
		);
	
		-- initializes and maps ports on the converted module 
		-- to convert the data from RAMS into more 
		-- suitable formats
		convert_unit : entity work.converter(Behavioral) port
			map (
				vq_pre => vq_pre,
				secret_bit_pre => secret_bit_pre,
				vq => vq,
				secret_bit => std_logic
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

