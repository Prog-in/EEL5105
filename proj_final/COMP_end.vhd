library ieee;
use ieee.std_logic_1164.all;

entity COMP_end is
    port (
    	E0      : in std_logic_vector(3 downto 0);
    	endgame : out std_logic
    );
end entity;

architecture circuito of COMP_end is
    begin
        with E0 select endgame <= '1' when "0000",
                                  '0' when others;
end circuito;