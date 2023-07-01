library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- R: reset
-- E: enable
-- Q: rodada atual em 4 bits (1 a 16) -> LEDR(0) a LEDR(15)
-- tc: 1 se contador = 15 (end_round);

entity counter_round is
    port (
    	R, E, clock : in std_logic;
    	Q           : out std_logic_vector(3 downto 0);
    	tc          : out std_logic
    );
end entity;

architecture circuito of counter_round is
    signal contador : std_logic_vector(3 downto 0) := "0000";
    
    begin
        Q <= contador;
        
        process (R, E, contador, clock)
        begin
            if (R = '1') then
                tc <= '0';
                contador <= "0000";
            elsif (contador = "1111") then
                tc <= '1';
            elsif (clock'event and clock = '1') then
                if (E = '1') then
                    contador <= std_logic_vector(unsigned(contador) + 1);
                end if;
            end if;
        end process;
end circuito;