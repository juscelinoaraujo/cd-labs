-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY tri_states_driver IS
	PORT(
		in_data : IN STD_LOGIC;
        enable : IN STD_LOGIC;
		out_data : OUT STD_LOGIC
	);
END ENTITY tri_states_driver;

-- Arquitetura
ARCHITECTURE behav OF tri_states_driver IS

-- Comportamento
BEGIN
    PROCESS(enable)
	 BEGIN
        IF (enable = '1') THEN
            out_data <= in_data;
        ELSE 
            out_data <= 'Z'; -- alta impedância equivale a um circuito aberto
        END IF;
	 END PROCESS;
END ARCHITECTURE behav;