library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--            A     +        B         +       C
-- final = 32*nivel + 4*floor(bonus/2) + floor(round/4)

-- max(A) = 32*(11) = 32*3 = 96                           -> 7 bits (64 = 1100000)
-- max(B) = 4*floor(1111/2) = 4*floor(15/2) = 4*7 = 28    -> 5 bits (28 = 11100)
-- max(C) = floor(1111/4) = floor(15/4) = floor(3,75) = 3 -> 2 bits (3 = 11)

entity logica is
    port (
    	round, bonus : in std_logic_vector(3 downto 0);
    	nivel        : in std_logic_vector(1 downto 0);
    	points       : out std_logic_vector(7 downto 0)
    );
end entity;

architecture circuito of logica is
    signal A: std_logic_vector(7 downto 0);
    signal B: std_logic_vector(7 downto 0);
    signal C: std_logic_vector(7 downto 0);

    begin
        A <= "0" & nivel & "00000"; -- 32*nivel
        B <= "000" & bonus(3 downto 1) & "00"; -- 4*floor(bonus/2)
        C <= "000000" & round(3 downto 2);
        points <= std_logic_vector(unsigned(A) + unsigned(B) + unsigned(C));
    
end circuito;
