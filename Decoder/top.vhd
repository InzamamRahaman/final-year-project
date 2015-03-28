----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:18:44 03/28/2015 
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

use work.size_constraints_pkg.all;

entity top is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           secret_bit : out  STD_LOGIC;
           sending_secret : out  STD_LOGIC;
           finished_secret : out  STD_LOGIC;
           vq : out  std_logic_vector(0 to 8);
           sending_vq_idex : out  STD_LOGIC;
           finished_vq_indicies : out  STD_LOGIC);
end top;

architecture Behavioral of top is
	-- control signals for the list
	signal enable_insert : std_logic;
	signal enable_read : std_logic; 
	
	signal index_to_read_from : list_index;
	signal vq_to_insert : vq_index;
	signal vq_read : vq_index;
	signal vq_at_top : vq_index;
begin
	
	list_unit : entity work.list(list_arch) port map
	(clk => clk, rst => rst,
		enable_insert => enable_insert, enable_read => enable_read,
		to_insert => vq_to_insert, index => index_to_read_from,
		at_index_one => vq_at_top, value_at_index => vq_read);

end Behavioral;

