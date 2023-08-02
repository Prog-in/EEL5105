library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtracao_testbench is
end entity;

architecture bench of subtracao_testbench is
    signal E0 : std_logic_vector(3 downto 0) := "1000";
    signal resultado : std_logic_vector(3 downto 0);
    signal E1 : std_logic := '0';

    component subtracao is port (
    	E0        : in std_logic_vector(3 downto 0);
    	E1        : in std_logic;
    	resultado : out std_logic_vector(3 downto 0)
    );
    end component;

    begin
    
        DUT : subtracao port map (
            E0        => E0,
            E1        => E1,
            resultado => resultado
        );
    
        process
            constant period : time := 10 ns;
            begin
                wait for period;
                
                
                E1 <= '1';
                wait for period;
                
                
                wait;
        end process;
end bench;