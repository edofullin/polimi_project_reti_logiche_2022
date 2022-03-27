library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Registro che prende in input anche una posizione e restituisce il bit in quella posizione da sinistra

entity serializer_register_8b is
    Port ( i_clk : in STD_LOGIC;
           i_in : in STD_LOGIC_VECTOR (7 downto 0);
           i_load : in std_logic;
           i_sel : in STD_LOGIC_VECTOR (2 downto 0);
           o_out : out STD_LOGIC);
end serializer_register_8b;

architecture Behavioral of serializer_register_8b is

signal curr_byte : std_logic_vector(7 downto 0); -- registro

begin

process(i_clk, i_load)
begin
    
    if rising_edge(i_clk) and i_load = '1' then
       curr_byte <= i_in;
    end if;

end process;

o_out <= curr_byte(to_integer(7 - unsigned(i_sel))); -- bit di output

end Behavioral;
