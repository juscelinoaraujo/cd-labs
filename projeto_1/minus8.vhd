library ieee;
use ieee.std_logic_1164.all;

entity minus8 is
    port(a: in bit_vector(4 downto 0); 
         ci: in bit;
	 s: out bit_vector(4 downto 0);
	 co: out bit);
end minus8;

architecture arc of minus8 is

signal u: bit_vector(4 downto 0);

component sub5b is
    port(a, b: in bit_vector(4 downto 0); 
         ci: in bit;
	 s: out bit_vector(4 downto 0);
	 co: out bit);
end component;

begin    
    u <= "01000";
    sub0 : sub5b port map(a => a, b => u, ci => ci, 
                          co => co, s => s);
end arc;
