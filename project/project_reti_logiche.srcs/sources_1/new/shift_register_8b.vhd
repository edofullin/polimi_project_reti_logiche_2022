library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity shift_register_8b is
    Port ( i_load : in std_logic;
           i_data : in std_logic_vector(7 downto 0);
           i_ena : in std_logic;
           i_clk : in std_logic;
           o_srout : out std_logic);
end shift_register_8b;

architecture Behavioral of shift_register_8b is

signal r_mem : std_logic_vector(7 downto 0);

begin

process(i_clk) begin

if rising_edge(i_clk) then

    if i_load = '1' then
    
        r_mem <= i_data;
    
    elsif i_ena = '1' then
        
        o_srout <= r_mem(7); 
        r_mem <= std_logic_vector(shift_left(unsigned(r_mem), 1));
        
       
    end if;

end if;


end process;


end Behavioral;
