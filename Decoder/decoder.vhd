----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:37:27 04/01/2015 
-- Design Name: 
-- Module Name:    decoder - decoder_arch 
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

entity decoder is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  bit_in : in std_logic;
			  need_more_data_out : std_logic;
           finished_out : out  STD_LOGIC;
           sending_bit_out : out  STD_LOGIC;
           bit_out : out  STD_LOGIC;
			  vq_index_out : std_logic_vector(
					MAX_NUMBER_OF_BITS_FOR_VQ - 1 downto 0);
			  sending_vq_index_out : std_logic);
end decoder;

architecture decoder_arch of decoder is

begin


end decoder_arch;

