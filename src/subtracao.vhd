library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity subtracao is 
	port
	(	
		E0: in std_logic_vector(3 downto 0);
		E1: in std_logic;
		resultado: out std_logic_vector(3 downto 0)
	);
end subtracao;

architecture circuito of subtracao is
    signal erro: std_logic_vector(3 downto 0);
    
    begin
	    erro <= E1&E1&E1&E1;
	    resultado <= E0 + erro;
	
end circuito;