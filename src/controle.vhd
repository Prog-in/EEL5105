-- implementar a lógica de status do jogo. Usado na ligacao entre
-- datapath e bloco de controle: o arquivo topo.vhd

library ieee;
use ieee.std_logic_1164.all;

entity controle is port (
        -- Entradas de controle
	    enter, reset, CLOCK: in std_logic;
        -- Entradas de status
    	end_game, end_time, end_round, end_FPGA: in std_logic;
        -- Saídas de comandos
    	R1, R2, E1, E2, E3, E4, E5: out std_logic
        
    );
end entity;

architecture circuito of controle is
    type STATES is (INIT, SETUP, PLAY_FPGA, PLAY_USER, COUNT_ROUND, CHECK, W4IT, RESULT);
    
    signal Eatual : STATES := INIT;
    signal Eprox  : STATES;
    
    begin
        process(CLOCK, reset)
        begin
            if (reset = '1') then
                Eatual <= INIT;
            elsif (CLOCK'event and CLOCK = '1') then
                Eatual <= Eprox;
            end if;
        end process;
        
        process (Eatual, enter, end_game, end_time, end_round, end_FPGA)
        begin
            case Eatual is 
                when INIT =>
                    R1 <= '1';
                    R2 <= '1';
                    E1 <= '0';
                    E2 <= '0';
                    E3 <= '0';
                    E4 <= '0';
                    E5 <= '0';
                    Eprox <= SETUP;
                when SETUP =>
                    R1 <= '0';
                    R2 <= '0';
                    E1 <= '1';
                    E2 <= '0';
                    E3 <= '0';
                    E4 <= '0';
                    E5 <= '0';
                    if (enter = '1') then
                        Eprox <= PLAY_FPGA;
                    else
                        Eprox <= SETUP;
                    end if;
                when PLAY_FPGA =>
                    R1 <= '0';
                    R2 <= '0';
                    E1 <= '0';
                    E2 <= '1';
                    E3 <= '0';
                    E4 <= '0';
                    E5 <= '0';
                    if (end_FPGA = '1') then
                        Eprox <= PLAY_USER;
                    else
                        Eprox <= PLAY_FPGA;
                    end if;
                when PLAY_USER =>
                    R1 <= '0';
                    R2 <= '0';
                    E1 <= '0';
                    E2 <= '0';
                    E3 <= '1';
                    E4 <= '0';
                    E5 <= '0';
                    if (end_time = '1') then
                        Eprox <= RESULT;
                    elsif (enter = '1') then
                        Eprox <= COUNT_ROUND;
                    else
                        Eprox <= PLAY_USER;
                    end if;
                when COUNT_ROUND =>
                    R1 <= '0';
                    R2 <= '0';
                    E1 <= '0';
                    E2 <= '0';
                    E3 <= '0';
                    E4 <= '1';
                    E5 <= '0';
                    Eprox <= CHECK;
                when CHECK =>
                    R1 <= '0';
                    R2 <= '0';
                    E1 <= '0';
                    E2 <= '0';
                    E3 <= '0';
                    E4 <= '0';
                    E5 <= '0';
                    if ((end_game = '1') or (end_round='1')) then
                        Eprox <= RESULT;
                    elsif ((end_game = '0') and (end_round = '0')) then
                        Eprox <= W4IT;
                    end if;
                when W4IT =>
                    R1 <= '1';
                    R2 <= '0';
                    E1 <= '0';
                    E2 <= '0';
                    E3 <= '0';
                    E4 <= '0';
                    E5 <= '0';
                    if (enter = '1') then
                        Eprox <= PLAY_FPGA;
                    else
                        Eprox <= W4IT;
                    end if;
                when RESULT =>
                    R1 <= '0';
                    R2 <= '0';
                    E1 <= '0';
                    E2 <= '0';
                    E3 <= '0';
                    E4 <= '0';
                    E5 <= '1';
                    if (enter = '1') then
                        Eprox <= INIT;
                    else
                        Eprox <= RESULT;
                    end if;
            end case;
        end process;
        
end circuito;
