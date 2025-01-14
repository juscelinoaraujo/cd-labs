library ieee;
use ieee.std_logic_1164.all;

entity add_min_seg is
    port(a, b: in bit_vector(5 downto 0);
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end add_min_seg;

architecture arc of add_min_seg is

signal u0, u1, u2: bit_vector(5 downto 0);
signal v0, v1, v2, v3: bit;

component adder6b is
    port(a, b: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end component;

component plus4 is
    port(a: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end component;

component minus60 is
    port(a: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end component;

component mux3x1_6b is
    port(a, b, c: in bit_vector(5 downto 0);
         k0, k1: in bit;
	 s: out bit_vector(5 downto 0));
end component;

begin

    add0 : adder6b port map(a => a, b => b, ci => ci, s => u1, co => v0);			   
    p4 : plus4 port map(a => u1, ci => '0', s => u0, co => v1);
    m60 : minus60 port map(a => u1, ci => '0', s => u2, co => v2);
			   
    v3 <= not v2;
    
    mux0 : mux3x1_6b port map(a => u0, b => u1, c => u2,
                              k0 => v0, k1 => v3,
			      s => s);
    co <= v0 or v3;
    
end arc;
