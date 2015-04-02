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

package decoder_state_pkg is

	type decoder_state is (START,
		START_DECODING, START_WITH_ZERO, START_WITH_ONE, 
		EXTRACT_VQ_INDEX, CHECK_NEXT_BIT, INSERT_INTO_LIST,
		COMPUTE_LIST_INDEX, EXTRACT_LIST_INDEX, AWAITING_LIST_INDEX,
		DONE, READ_LIST_PROCESSING);

end decoder_state_pkg;

package body decoder_state_pkg is


 
end decoder_state_pkg;
