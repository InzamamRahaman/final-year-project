--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package encoder_state_pkg is
	
	type encoder_state is (READ_DATA, GET_ENCODING, SEND_ENCODING, 
	INFORM_USER, DONE);
	
end encoder_state_pkg;

package body encoder_state_pkg is

end encoder_state_pkg;
