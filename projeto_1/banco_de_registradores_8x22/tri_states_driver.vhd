-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY tri_states_driver IS
	PORT(
		in_data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
        enable : IN STD_LOGIC;
		out_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
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
            out_data <= (others => 'Z'); -- alta impedância equivale a um circuito aberto
        END IF;
	 END PROCESS;
END ARCHITECTURE behav;