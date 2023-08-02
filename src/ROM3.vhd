library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is
    port (
    	address : in std_logic_vector(3 downto 0);
    	output  : out std_logic_vector(31 downto 0)
    );
end entity;

architecture circuito of ROM3 is
    begin
        --         HEX7     HEX6     HEX5     HEX4     HEX3     HEX2     HEX1     HEX0                 round
        output <= "1111" & "0001" & "1000" & "0101" & "0100" & "1111" & "0111" & "1001" when address = "0000" else
                  --des      1      8      5      4      des      7      9
                
                  "1000" & "1101" & "0111" & "0001" & "0101" & "1111" & "1111" & "0011" when address = "0001" else
                  --8      D      7      1      5      des      des      3
                
                  "1111" & "1101" & "0111" & "1100" & "1000" & "0110" & "1111" & "0010" when address = "0010" else
                  --des      D      7      C      8      6      des      2
                
                  "1111" & "1111" & "0010" & "1101" & "0001" & "0100" & "1000" & "0011" when address = "0011" else
                  --des      des      2      D      1      4      8      3
                
                  "1000" & "0011" & "1111" & "0111" & "1111" & "1100" & "0010" & "0100" when address = "0100" else
                  --8      3      des      7      des      C      2      4
                
                  "0110" & "1111" & "1010" & "1100" & "0111" & "1001" & "0101" & "1111" when address = "0101" else
                  --6      des      A      C      7      9      5      des
                
                  "0010" & "0110" & "1111" & "1011" & "1111" & "1001" & "1101" & "1010" when address = "0110" else
                  --2      6      des      B      des      9      D      A
                
                  "1100" & "1101" & "0011" & "1111" & "0000" & "1111" & "1010" & "1011" when address = "0111" else
                  --C      D      3      des      0      des      A      B
                
                  "1010" & "1111" & "0111" & "1100" & "1110" & "0000" & "0010" & "1111" when address = "1000" else
                  --A      des      7      C      E      0      2      des
                
                  "1111" & "1001" & "0111" & "0100" & "0101" & "1110" & "1111" & "1000" when address = "1001" else
                  --des      9      7      4      5      E      des      8
                
                  "1000" & "0100" & "0010" & "1101" & "1111" & "1100" & "1111" & "0101" when address = "1010" else
                  --8      4      2      D      des      C      des      5
                
                  "0110" & "1000" & "1111" & "1111" & "0100" & "1110" & "1100" & "0011" when address = "1011" else
                  --6      8      des      des      4      E      C      3
                
                  "0101" & "0100" & "0001" & "1111" & "1001" & "1110" & "1111" & "1100" when address = "1100" else
                  --5      4      1      des      9      E      des      C
                
                  "0111" & "1010" & "1111" & "0010" & "0000" & "1111" & "1100" & "1011" when address = "1101" else
                  --7      A      des      2      0      des      C      B
                
                  "1111" & "1001" & "0110" & "1111" & "1110" & "0001" & "0011" & "0111" when address = "1110" else
                  --des      9      6      des      E      1      3      7
                
                  "0111" & "1001" & "1100" & "1011" & "1111" & "1111" & "0110" & "0101";
                  --7      9      C      B      des      des      6      5
end circuito;
