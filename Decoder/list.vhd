----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:21:15 03/28/2015 
-- Design Name: 
-- Module Name:    list - Behavioral 
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

entity list is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable_insert : in  STD_LOGIC;
           to_insert : in vq_index;
           index : in  list_index;
			  enable_read : in std_logic;
           at_index_one : out  vq_index;
           value_at_index : out  vq_index);
end list;

architecture list_arch of list is
	signal contents : vq_index_list;
	signal last_index : list_index;
begin

	main_pr : process(clk, rst)
		variable temp_index : vq_index;
	begin
		if rst = '1' then
			for idx in 1 to MAX_LIST_SIZE loop
				contents(idx) <= -1;
			end loop;
			last_index <= 1;
		elsif rising_edge(clk) then
			at_index_one <= contents(1);
			value_at_index <= 0;
			if index = 0 then
				value_at_index <= 0;
			end if;
			if enable_insert = '1' then
			   if last_index = 1 then
					contents(last_index) <= to_insert;
					at_index_one <= to_insert;
				elsif last_index <= 4 then
					contents(last_index) <= to_insert;
					last_index <= last_index + 1;
				else
					contents(last_index) <= to_insert;
				end if;
			elsif enable_read = '1' then
				temp_index := contents(index);
				value_at_index <= temp_index;
				for idx in MAX_LIST_SIZE downto 2 loop
					if idx <= index then
						contents(idx) <= contents(idx - 1);
					else
						contents(idx) <= contents(idx);
					end if;
				end loop;
				contents(1) <= temp_index;
			end if;
		end if;
	end process;

end list_arch;

