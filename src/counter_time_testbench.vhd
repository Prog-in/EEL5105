library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_time_testbench is
end entity;

architecture bench of counter_time_testbench is
    signal R     : std_logic := '0';
    signal E     : std_logic := '0';
    signal clock : std_logic := '0';
    signal tc    : std_logic;
    signal Q     : std_logic_vector(3 downto 0);
    
    component counter_time port(
            R, E, clock : in std_logic;
    	    Q           : out std_logic_vector(3 downto 0);
    	    tc          : out std_logic
        );
    end component;
    
    begin
        DUT : counter_time port map (
                R     => R,
                E     => E,
                clock => clock,
                Q     => Q,
                tc    => tc
            );
        
        process
            constant period : time := 5 ns;
            begin
                for k in 0 to 21 loop
                    wait for period;
                    clock <= not clock;
                end loop;
                
                R <= '1'; E <= '1';
                wait for period;
                R <= '0';
                for k in 0 to 21 loop
                    wait for period;
                    clock <= not clock;
                end loop;
                
                wait;
        end process;
end bench;