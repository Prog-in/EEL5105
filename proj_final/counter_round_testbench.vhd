library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_round_testbench is
end entity;

architecture bench of counter_round_testbench is
    signal R     : std_logic := '0';
    signal E     : std_logic := '0';
    signal clock : std_logic := '0';
    signal Q     : std_logic_vector(3 downto 0);
    signal tc    : std_logic;
    
    component counter_round is port (
    	R, E, clock : in std_logic;
    	Q           : out std_logic_vector(3 downto 0);
    	tc          : out std_logic  
    );
    end component;
    
    begin
        DUT : counter_round port map (
            R     => R,
            E     => E,
            clock => clock,
            Q     => Q,
            tc    => tc
        );
    
        process
            constant period : time := 5 ns;
            begin
            
            wait for period;
            
            clock <= not clock;
            wait for period;
            
            R <= '1';
            clock <= not clock;
            wait for period;
            
            R <= '0';
            E <= '1';
            clock <= not clock;
            wait for period;
            
            for k in 0 to 33 loop
                clock <= not clock;
                wait for period;
            end loop;
            
            R <= '1';
            clock <= not clock;
            wait for period;
            
            clock <= not clock;
            wait for period;
            
            wait;
            end process;
end bench;