library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity codestream is
	port (
		clk : in std_logic;
		rst : in std_logic;
		inbit : in std_logic;
		stream : out code_stream
	);
end entity codestream;

architecture RTL of codestream is
	signal len : codestream_index;
begin
	
	-- process to initialize the codestream
	setup_process : process(clk, rst) 
	begin
		if rising_edge(clk) and rst = '1' then
			stream <= (others => '0');
			len <= 0;
		end if;
	end process;
	
	-- process to insert a bit into a code stream
	insertion_process : process(clk, inbit) 
	begin
		if rising_edge(clk) then
			len <= len + 1;
			stream(len) <= inbit;
		end if;
	end process;
	

end architecture RTL;
