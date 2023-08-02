library ieee;
use ieee.std_logic_1164.all;

entity COMP_erro_testbench is
end entity;

architecture bench of COMP_erro_testbench is
    signal E0        : std_logic_vector(14 downto 0) := "000000000000000";
    signal E1        : std_logic_vector(14 downto 0) := "000000000000000";
    signal diferente : std_logic;
    
    component COMP_erro is port (
    	E0, E1    : in std_logic_vector(14 downto 0);
    	diferente : out std_logic
    );
    end component;
    
    begin
        DUT : COMP_erro port map (
        E0        => E0,
        E1        => E1,
        diferente => diferente
        );
    
    process
        constant period : time := 5 ns;
        begin
            wait for period;
            
            E0 <= "000000000000001";
            wait for period;
            
            E1 <= "000000000000001";
            wait for period;
            
            E1 <= "000000000000010";
            wait for period;
            
            E0 <= "000000000000010";
            wait for period;
            
            wait;
    end process;
    
end bench;