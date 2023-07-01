library ieee;
use ieee.std_logic_1164.all;

entity registrador_user_testbench is
end entity;

architecture bench of registrador_user_testbench is
    signal R   : std_logic := '0';
    signal E   : std_logic := '0';
    signal clk : std_logic := '0';
    signal D   : std_logic_vector(3 downto 0) := "0000";
    signal Q   : std_logic_vector(3 downto 0);
    
    component registrador_user is port (
    	R, E, clock : in std_logic;
    	D           : in std_logic_vector(3 downto 0);
    	Q           : out std_logic_vector(3 downto 0) 
    );
    end component;
    
    begin
        DUT : registrador_user port map (
            R     => R,
            E     => E,
            clock => clk,
            D     => D,
            Q     => Q
        );
        
        process
            constant period : time := 5 ns;
            begin
                wait for period;
                
                R <= '1';
                clk <= not clk;
                wait for period;
                
                R <= '0'; E <= '1';
                clk <= not clk;
                wait for period;
                
                D <= "0001";
                clk <= not clk;
                wait for period;
                
                E <= '0'; 
                clk <= not clk;
                wait for period;
                
                D <= "0010";
                clk <= not clk;
                wait for period;
                
                E <= '1';
                clk <= not clk;
                wait for period;
                
                R <= '1';
                clk <= not clk;
                wait for period;
                
                wait;
        end process;
end bench;