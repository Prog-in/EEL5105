library ieee;
use ieee.std_logic_1164.all;

entity registrador_bonus_testbench is
end entity;

architecture bench of registrador_bonus_testbench is
    signal S   : std_logic := '0';
    signal E   : std_logic := '0';
    signal clk : std_logic := '0';
    signal D   : std_logic_vector(3 downto 0) := "0000";
    signal Q   : std_logic_vector(3 downto 0);
    
    component registrador_bonus is port (
    	S, E, clock : in std_logic;
    	D           : in std_logic_vector(3 downto 0);
    	Q           : out std_logic_vector(3 downto 0) 
    );
    end component;
    
    begin
        DUT : registrador_bonus port map (
            S     => S,
            E     => E,
            clock => clk,
            D     => D,
            Q     => Q
        );
        
        process
            constant period : time := 5 ns;
            begin
                wait for period;
                
                S <= '1';
                clk <= not clk;
                wait for period;
                
                S <= '0'; E <= '1';
                clk <= not clk;
                wait for period;
                
                clk <= not clk;
                wait for period;
                
                E <= '0'; 
                clk <= not clk;
                wait for period;
                
                D <= "1111";
                clk <= not clk;
                wait for period;
                
                E <= '1';
                clk <= not clk;
                wait for period;
                
                S <= '1';
                clk <= not clk;
                wait for period;
                
                wait;
        end process;
end bench;