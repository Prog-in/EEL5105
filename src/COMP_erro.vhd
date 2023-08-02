library ieee;
use ieee.std_logic_1164.all;

entity COMP_erro is
    port (
    	E0, E1    : in std_logic_vector(14 downto 0);
    	diferente : out std_logic
    );
end entity;

architecture circuito of COMP_erro is
    begin
        diferente <= '0' when (E0 = E1) else '1';
end circuito;