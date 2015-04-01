----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:09:17 04/01/2015 
-- Design Name: 
-- Module Name:    data_controller - Behavioral 
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

entity data_controller is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           send_in : in  STD_LOGIC;
           bit_out : out  STD_LOGIC);
end data_controller;

architecture data_controller_arch of data_controller is
	signal current_address : std_logic_vector(0 to RAM_ADDRESS_SIZE - 1);
	signal current_data : std_logic_vector(0 to 0);
	
	-- interface for component responsible for data
	-- conversion
	component data_converter
		port (
			bit_in : in std_logic;
			bit_out : out std_logic;
		);
	end component;
	
	COMPONENT data_ram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;
	
begin

	-- insert Ram component here
	
	-- insert component for data conversion here
	converter_unit : data_converter port map (
		bit_in => current_data,
		bit_out => bit_out,
	);
	
	ram_unit : data_ram
  PORT MAP (
    clka => clka,
    wea => wea,
    addra => addra,
    dina => dina,
    douta => douta
  );
	
	main_pr : process(clk, rst)
		if rst = '1' then
			current_address <= (others => '0');
			bit_out <= '0';
		elsif rising_edge(clk) then
			if send_in = '1' then
				current_address <= current_address + 1;
			else
				current_address <= current_address + 0;
		end if;
	end process;

end data_controller_arch;

