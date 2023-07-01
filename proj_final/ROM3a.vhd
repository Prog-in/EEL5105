library ieee;
use ieee.std_logic_1164.all;

entity ROM3a is
    port (
    	address : in std_logic_vector(3 downto 0);
    	output  : out std_logic_vector(14 downto 0)
    );
end entity;

architecture circuito of ROM3a is
    begin
        output <= "000001110110010" when address = "0000" else
                  "010000110101010" when address = "0001" else
                  "011000111000100" when address = "0010" else
                  "010000100011110" when address = "0011" else
                  "001000110011100" when address = "0100" else
                  "001011011100000" when address = "0101" else
                  "010111001000100" when address = "0110" else
                  "011110000001001" when address = "0111" else
                  "101010010000101" when address = "1000" else
                  "100001110110000" when address = "1001" else
                  "011000100110100" when address = "1010" else
                  "101000101011000" when address = "1011" else
                  "101001000110010" when address = "1100" else
                  "001110010000101" when address = "1101" else
                  "100001011001010" when address = "1110" else
                  "001101011100000";
end circuito;
