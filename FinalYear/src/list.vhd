library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- call in our globals file


-- use all of the contents of our globals package
use work.globals.all;

entity list is
	port (
		clk : in std_logic;
		rst : in std_logic;
		vq_index : in int_vq_index;
		list_index : out int_list_index
	);
end entity list;

architecture SELF_ORGANIZING_LIST of list is
	signal vq_indicies : vq_index_list;
begin
	-- describes the process to be invoked when
	-- we are trying to insert an element into the list
	insertion_process: process(vq_indicies, vq_index)
	begin
		get_list_index(vq_indicies, vq_index, list_index);
	end process;
end architecture SELF_ORGANIZING_LIST;
