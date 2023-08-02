library ieee;
use ieee.std_logic_1164.all;

entity ROM1a is
    port (
    	address : in std_logic_vector(3 downto 0);
    	output  : out std_logic_vector(14 downto 0)
    );
end entity;

architecture circuito of ROM1a is
    begin
        output <= "000001011100000" when address = "0000" else
                  "001011000010000" when address = "0001" else
                  "000011000110000" when address = "0010" else
                  "100000100000101" when address = "0011" else
                  "001110001000000" when address = "0100" else
                  "010001000000011" when address = "0101" else
                  "000100010100001" when address = "0110" else
                  "000100010000110" when address = "0111" else
                  "001000100000101" when address = "1000" else
                  "010000100010010" when address = "1001" else
                  "000000101100100" when address = "1010" else
                  "001000010001100" when address = "1011" else
                  "001100001000100" when address = "1100" else
                  "000010010100010" when address = "1101" else
                  "001000000101100" when address = "1110" else
                  "011010000010000";

end circuito;
