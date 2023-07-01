library ieee;
use ieee.std_logic_1164.all;

entity ROM2 is
    port (
    	address : in std_logic_vector(3 downto 0);
    	output  : out std_logic_vector(31 downto 0)
    );
end entity;

architecture circuito of ROM2 is
    begin
        --         HEX7     HEX6     HEX5     HEX4     HEX3     HEX2     HEX1     HEX0                 round
        output <= "1111" & "1111" & "0101" & "0001" & "1111" & "0110" & "1110" & "0000" when address = "0000" else
                  --des      des      5      1      des      6      E      0
                
                  "1111" & "1001" & "1111" & "1111" & "1101" & "1110" & "1100" & "0111" when address = "0001" else
                  --des      9      des      des      D      E      C      7
                
                  "1111" & "1110" & "1101" & "1011" & "1111" & "1000" & "0000" & "1111" when address = "0010" else
                  --des      E      D      B      des      8      0      des
                
                  "1111" & "0111" & "1111" & "1111" & "1101" & "1001" & "0100" & "1000" when address = "0011" else
                  --des      7      des      des      D      9      4      8
                
                  "1100" & "0000" & "1001" & "1111" & "1111" & "1000" & "0110" & "1111" when address = "0100" else
                  --C      0      9      des      des      8      6      des
                
                  "1111" & "1110" & "0001" & "0000" & "0101" & "1000" & "1111" & "1111" when address = "0101" else
                  --des      E      1      0      5      8      des      des
                
                  "1111" & "0111" & "0001" & "0101" & "1010" & "1111" & "1111" & "0011" when address = "0110" else
                  --des      7      1      5      A      des      des      3
                
                  "1011" & "1000" & "1111" & "1111" & "1001" & "1111" & "0011" & "0100" when address = "0111" else
                  --B      8      des      des      9      des      3      4
                
                  "0011" & "1110" & "1101" & "1111" & "0001" & "1111" & "0100" & "1111" when address = "1000" else
                  --3      E      D      des      1      des      4      des
                
                  "0111" & "1111" & "1001" & "1111" & "1100" & "1101" & "1011" & "1111" when address = "1001" else
                  --7      des      9      des      C      D      B      des
                
                  "0011" & "1111" & "0001" & "1111" & "1110" & "1100" & "0100" & "1111" when address = "1010" else
                  --3      des      1      des      E      C      4      des
                
                  "1010" & "0111" & "1100" & "1111" & "1101" & "1011" & "1111" & "1111" when address = "1011" else
                  --A      7      C      des      D      B      des      des
                
                  "1111" & "1111" & "1111" & "0011" & "0001" & "1110" & "0111" & "1011" when address = "1100" else
                  --des      des      des      3      1      E      7      B
                
                  "0001" & "1101" & "1111" & "1111" & "0010" & "1110" & "1111" & "1011" when address = "1101" else
                  --1      D      des      des      2      E      des      B
                
                  "1010" & "0101" & "1111" & "1100" & "1011" & "1101" & "1111" & "1111" when address = "1110" else
                  --A      5      des      C      B      D      des      des
                
                  "1011" & "0011" & "1100" & "1001" & "1111" & "1111" & "1111" & "0010";
                  --B      3      C      9      des      des      des      2

end circuito;
