library ieee;
use ieee.std_logic_1164.all;

entity COMP_end_testbench is
end entity;

architecture bench of COMP_end_testbench is
    signal E0      : std_logic_vector(3 downto 0) := "0010";
    signal endgame : std_logic;
    
    component COMP_end is port (
    	E0      : in std_logic_vector(3 downto 0);
    	endgame : out std_logic
    );
    end component;
    
    begin
        DUT : COMP_end port map (
            E0      => E0,
            endgame => endgame
        );
        
        process
            constant period : time := 5 ns;
            begin
                wait for period;
                
                E0 <= "0001";
                wait for period;
            
                E0 <= "0000";
                wait for period;
                
                wait for period;
                
                E0 <= "0001";
                wait for period;
                
                E0 <= "0000";
                wait for period;
                
                E0 <= "0001";
                wait for period;
                wait;
        end process;
    
end bench;