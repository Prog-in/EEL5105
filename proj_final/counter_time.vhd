library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- counter time (-1)
-- R: set (R1)
-- E: enable (E3)
-- Q: tempo (4 bits) -> enviar para HEX(5..4)
-- tc: saida end_time

entity counter_time is
    port(
        R, E, clock : in std_logic;
	    Q           : out std_logic_vector(3 downto 0);
	    tc          : out std_logic := '0'
    );
end entity;

architecture circuito of counter_time is 
    signal contador : std_logic_vector(3 downto 0) := "1010";
    
    begin
        Q <= contador;
        
        process (R, E, contador, clock)
        begin
            if (R = '1') then
                tc <= '0';
                contador <= "1010";
            elsif (contador = "0000") then
                tc <= '1';
            elsif (clock'event and clock = '1') then
                if (E = '1') then
                    contador <= std_logic_vector(unsigned(contador) - 1);
                end if;
            end if;
        end process;
        
end circuito;