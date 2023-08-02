library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_16bits is
    port (
    	E0, E1 : in std_logic_vector(15 downto 0);
    	sel    : in std_logic;
    	saida  : out std_logic_vector(15 downto 0)
    );
end entity;

architecture circuito of mux2x1_16bits is
    begin
        with sel select saida <= E0 when '0',
	                             E1 when others;
end circuito;