library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is
    port (
    	address : in std_logic_vector(3 downto 0);
    	output  : out std_logic_vector(31 downto 0)
    );
end entity;

architecture circuito of ROM1 is
    begin
        --         HEX7     HEX6     HEX5     HEX4     HEX3     HEX2     HEX1     HEX0                 round
        output <= "1001" & "0101" & "1111" & "0110" & "1111" & "1111" & "1111" & "0111" when address = "0000" else
                  --9        5        des      6        des      des      des      7
                
                "1100" & "1001" & "1111" & "1111" & "1111" & "1010" & "1111" & "0100" when address = "0001" else
                --C        9        des     des       des      A        des      4
                
                "0101" & "1001" & "1111" & "0100" & "1111" & "1010" & "1111" & "1111" when address = "0010" else
                --5        9        des      4        des      A        des      des
                
                "1111" & "0010" & "1110" & "1000" & "1111" & "1111" & "0000" & "1111" when address = "0011" else
                --des      2        E        8        des      des      0        des
                
                "1111" & "1010" & "0110" & "1111" & "1111" & "1011" & "1111" & "1100" when address = "0100" else
                --des      A        6        des      des      B        des      C
                
                "0000" & "1111" & "0001" & "1111" & "1111" & "1111" & "1101" & "1001" when address = "0101" else
                --0        des      1        des      des      des      D        9
                
                "1111" & "1111" & "0000" & "1111" & "1011" & "0101" & "0111" & "1111" when address = "0110" else
                --des      des      0        des      B        5        7        des
                
                "1111" & "1111" & "1111" & "1111" & "0010" & "0001" & "1011" & "0111" when address = "0111" else
                --des      des      des      des      2        1        B        7
                
                "1000" & "1100" & "1111" & "0010" & "1111" & "1111" & "1111" & "0000" when address = "1000" else
                --8        C        des      2        des      des      des      0
                
                "1111" & "1101" & "1111" & "0100" & "1111" & "0001" & "1111" & "1000" when address = "1001" else
                --des      D        des      4        des      1        des      8
                
                "1111" & "1111" & "0110" & "1000" & "0101" & "0010" & "1111" & "1111" when address = "1010" else
                --des      des      6        8        5        2        des      des
                
                "0111" & "0010" & "1111" & "1111" & "0011" & "1111" & "1111" & "1100" when address = "1011" else
                --7        2        des      des      3        des      des      C
                
                "1111" & "0010" & "1111" & "1011" & "0110" & "1111" & "1100" & "1111" when address = "1100" else
                --des      2        des      B        6        des      C        des
                
                "1111" & "1111" & "1111" & "1111" & "1010" & "0111" & "0001" & "0101" when address = "1101" else
                --des      des      des      des      A        7        1        5
                
                "0101" & "1111" & "0010" & "1100" & "1111" & "1111" & "0011" & "1111" when address = "1110" else
                --5        des      2        C        des      des      3        des
                
                "1100" & "1101" & "1111" & "1010" & "0100" & "1111" & "1111" & "1111";
                --C        D        des      A        4        des      des      des
end circuito;