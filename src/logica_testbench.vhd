library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity logica_testbench is
end entity;

--            A     +        B         +       C
-- final = 32*nivel + 4*floor(bonus/2) + floor(round/4)

-- max(A) = 32*(11) = 32*3 = 96                           -> 7 bits (64 = 1100000)
-- max(B) = 4*floor(1111/2) = 4*floor(15/2) = 4*7 = 28    -> 5 bits (28 = 11100)
-- max(C) = floor(1111/4) = floor(15/4) = floor(3,75) = 3 -> 2 bits (3 = 11)

architecture bench of logica_testbench is
    signal to_round, to_bonus : std_logic_vector(3 downto 0);
    signal to_nivel           : std_logic_vector(1 downto 0);
    signal from_points        : std_logic_vector(7 downto 0);
    signal resultado          : std_logic_vector(7 downto 0);

    component logica port (
        	round, bonus : in std_logic_vector(3 downto 0);
        	nivel        : in std_logic_vector(1 downto 0);
        	points       : out std_logic_vector(7 downto 0)
        );
    end component;

    begin
        DUT : logica port map (
            round  => to_round,
            bonus  => to_bonus,
            nivel  => to_nivel,
            points => from_points
        );
    
        process
            constant period : time := 1 ns;
            begin
                for Tround in 0 to 15 loop
                    to_round <= std_logic_vector(to_unsigned(Tround, to_round'length));
                    for Tbonus in 0 to 15 loop
                        to_bonus <= std_logic_vector(to_unsigned(Tbonus, to_bonus'length));
                        for Tnivel in 0 to 3 loop
                            to_nivel <= std_logic_vector(to_unsigned(Tnivel, to_nivel'length));
                            resultado <= std_logic_vector(to_unsigned(32*Tnivel + 4*(Tbonus/2) + Tround/4, resultado'length)
                            );
                            
                            assert (resultado = from_points)
                            report "resultados errados" severity error;
                            --assert (resultado = from_points)
                            --report "resultado != from_points in "
                            --       & integer'Image(Tround) & " "
                            --       & integer'Image(Tbonus) & " "
                            --       & integer'Image(Tnivel)
                            --severity error;
                            
                            wait for period;
                            
                        end loop;
                    end loop;
                end loop;
            wait;
        end process;
end bench;
