library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;
use ieee.math_real.all;

entity main is
	port (
		clk : in std_logic;
		rst : in std_logic
	);
end entity main;

architecture My_Main of main is
	signal vq_index : int_vq_index;
	signal list_index : int_list_index;
	signal to_stream : std_logic;
	signal stream: code_stream;
	signal stream_len : codestream_index;
begin

	-- read in the input file for the image
	-- read in the secret message
	
	-- instantiate entity for list
	list_unit: entity work.list(SELF_ORGANIZING_LIST)
		port map(rst        => rst,
			     vq_index   => vq_index,
			     list_index => list_index);
			     
	-- instantiate code stream
	code_stream_unit: entity work.codestream
		port map(inbit  => to_stream,
			     stream => stream, 
			     len => stream_len);
	

end architecture My_Main;