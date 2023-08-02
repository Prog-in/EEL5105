library ieee;
use ieee.std_logic_1164.all;

entity ROM2a is
    port (
    	address : in std_logic_vector(3 downto 0);
    	output  : out std_logic_vector(14 downto 0)
    );
end entity;

architecture circuito of ROM2a is
    begin
        output <= "100000001100011" when address = "0000" else
                  "111001010000000" when address = "0001" else
                  "110100100000001" when address = "0010" else
                  "010001110010000" when address = "0011" else
                  "001001101000001" when address = "0100" else
                  "100000100100011" when address = "0101" else
                  "000010010101010" when address = "0110" else
                  "000101100011000" when address = "0111" else
                  "110000000011010" when address = "1000" else
                  "011101010000000" when address = "1001" else
                  "101000000011010" when address = "1010" else
                  "011110010000000" when address = "1011" else
                  "100100010001010" when address = "1100" else
                  "110100000000110" when address = "1101" else
                  "011110000100000" when address = "1110" else
                  "001101000001100";
end circuito;
