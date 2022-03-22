----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2022 06:48:20 PM
-- Design Name: 
-- Module Name: serializer_register_8b - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity serializer_register_8b is
    Port ( i_clk : in STD_LOGIC;
           i_in : in STD_LOGIC_VECTOR (7 downto 0);
           i_load : in std_logic;
           i_sel : in STD_LOGIC_VECTOR (2 downto 0);
           o_out : out STD_LOGIC);
end serializer_register_8b;

architecture Behavioral of serializer_register_8b is

signal curr_byte : std_logic_vector(7 downto 0);

begin

process(i_clk)
begin
    
    if rising_edge(i_clk) and i_load = '1' then
       curr_byte <= i_in;
    end if;

end process;

o_out <= curr_byte(to_integer(unsigned(i_sel)));

end Behavioral;
