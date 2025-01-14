-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY ff_d IS
  PORT(
       D, clk : IN STD_LOGIC;
       Q, Q_bar : OUT STD_LOGIC);
END entITY ff_d;

-- Arquitetura
ARCHITECTURE behav OF ff_d IS
BEGIN
  PROCESS (D, clk)
  BEGIN
    IF (clk'event and clk = '1' AND D = '1') THEN
        Q <= '1';
	    Q_bar <= '0';
    ELSIF (rising_edge(clk) AND D = '0') THEN
        Q <= '0';
		Q_bar <= '1'; 
    END IF; -- " clk'EVENT AND clk = '1' " equivale a "rising_edge(clk)"
  END PROCESS ;
END ARCHITECTURE behav;