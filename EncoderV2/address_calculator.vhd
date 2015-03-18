----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:24 03/18/2015 
-- Design Name: 
-- Module Name:    address_calculator - Behavioral 
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

entity address_calculator is
    Port ( image_address : inout  STD_LOGIC_VECTOR(14 downto 0);
           secret_address : inout  STD_LOGIC(16 downto 0);
           compute_now : in  STD_LOGIC);
end address_calculator;

architecture Behavioral of address_calculator is
	if compute_now = '1' then
		image_address <= image_address+ 1;
		secret_addreess <= secret_address + 1;
	end if;
begin


end Behavioral;

