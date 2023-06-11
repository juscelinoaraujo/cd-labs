-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY regfile_8x22 IS
	PORT(
		w_data: IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		w_addr, r_addr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		w_en, r_en : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		r_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END ENTITY regfile_8x22;

-- Arquitetura
ARCHITECTURE RTL OF regfile_8x22 IS

	-- Fios
	SIGNAL dcd_3x8_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg0_22bit_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL reg1_22bit_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL reg2_22bit_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL reg3_22bit_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL reg4_22bit_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL reg5_22bit_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL reg6_22bit_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL reg7_22bit_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL driver_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);

	-- Componentes
	-- 1) Decodificador
	COMPONENT dcd_3x8 IS
		PORT(
			i0, i1, i2, en : IN STD_LOGIC;
			d : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT dcd_3x8;

	-- 2) Registrador ffd
	COMPONENT reg_22bit IS
		PORT(
			d_data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
			load : IN STD_LOGIC;
			clk : IN STD_LOGIC;
			q_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
		);
	END COMPONENT reg_22bit;

	-- 3) Driver de 3 estados
	COMPONENT tri_states_driver IS
		PORT(
			in_data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
        	enable : IN STD_LOGIC;
			out_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
		);
	END COMPONENT tri_states_driver;

-- Comportamento
BEGIN

	-- Decodificador 1
	dcd1: dcd_3x8
		PORT MAP(
			i0 => w_addr(0),
			i1 => w_addr(1),
			i2 => w_addr(2),
			en => w_en,
			d => dcd_3x8_wires
	);

	-- Registradores
	reg0_22bit : reg_22bit
		PORT MAP(
			d_data => w_data,
			load => dcd_3x8_wires(0),
			clk => clk,
			q_data => reg0_22bit_wires
	);

	reg1_22bit : reg_22bit
		PORT MAP(
			d_data => w_data,
			load => dcd_3x8_wires(1),
			clk => clk,
			q_data => reg1_22bit_wires
	);

	reg2_22bit : reg_22bit
		PORT MAP(
			d_data => w_data,
			load => dcd_3x8_wires(2),
			clk => clk,
			q_data => reg2_22bit_wires
	);

	reg3_22bit : reg_22bit
		PORT MAP(
			d_data => w_data,
			load => dcd_3x8_wires(3),
			clk => clk,
			q_data => reg3_22bit_wires
	);
	
	reg4_22bit : reg_22bit
		PORT MAP(
			d_data => w_data,
			load => dcd_3x8_wires(4),
			clk => clk,
			q_data => reg4_22bit_wires
	);
	
	reg5_22bit : reg_22bit
		PORT MAP(
			d_data => w_data,
			load => dcd_3x8_wires(5),
			clk => clk,
			q_data => reg5_22bit_wires
	);
	
	reg6_22bit : reg_22bit
		PORT MAP(
			d_data => w_data,
			load => dcd_3x8_wires(6),
			clk => clk,
			q_data => reg6_22bit_wires
	);
	
	reg7_22bit : reg_22bit
		PORT MAP(
			d_data => w_data,
			load => dcd_3x8_wires(7),
			clk => clk,
			q_data => reg7_22bit_wires
	);

	-- Decodificador 2
	dcd2: dcd_3x8
		PORT MAP(
			i0 => r_addr(0),
			i1 => r_addr(1),
			i2 => r_addr(2),
			en => r_en,
			d(0) => driver_wires(0),
			d(1) => driver_wires(1),
			d(2) => driver_wires(2),
			d(3) => driver_wires(3),
			d(4) => driver_wires(4),
			d(5) => driver_wires(5),
			d(6) => driver_wires(6),
			d(7) => driver_wires(7)
	);

	-- Driver de 3 estados
	driver0 : tri_states_driver
		PORT MAP(
			in_data => reg0_22bit_wires,
			enable => driver_wires(0),
			out_data => r_data
	);

	driver1 : tri_states_driver
		PORT MAP(
			in_data => reg1_22bit_wires,
			enable => driver_wires(1),
			out_data => r_data
	);

	driver2 : tri_states_driver
		PORT MAP(
			in_data => reg2_22bit_wires,
			enable => driver_wires(2),
			out_data => r_data
	);

	driver3 : tri_states_driver
		PORT MAP(
			in_data => reg3_22bit_wires,
			enable => driver_wires(3),
			out_data => r_data
	);
	
	driver4 : tri_states_driver
		PORT MAP(
			in_data => reg4_22bit_wires,
			enable => driver_wires(4),
			out_data => r_data
	);
	
	driver5 : tri_states_driver
		PORT MAP(
			in_data => reg5_22bit_wires,
			enable => driver_wires(5),
			out_data => r_data
	);
	
	driver6 : tri_states_driver
		PORT MAP(
			in_data => reg6_22bit_wires,
			enable => driver_wires(6),
			out_data => r_data
	);
	
	driver7 : tri_states_driver
		PORT MAP(
			in_data => reg7_22bit_wires,
			enable => driver_wires(7),
			out_data => r_data
	);

END ARCHITECTURE RTL;