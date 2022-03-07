----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 05:18:39 PM
-- Design Name: 
-- Module Name: serializer - Behavioral
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


library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE ieee.std_logic_arith.all;


entity serializer is
    port (
        i_clk : in std_logic;
        i_data : in std_logic_vector(7 downto 0);
        i_rst : in std_logic;
        i_ena : in std_logic;
        o_res : out std_logic;
        o_res_ena : out std_logic;
        o_done : out std_logic
    );
end serializer;

architecture Behavioral of serializer is

signal r_count : integer range 0 to 7 := 0;
signal r_res_ena : std_logic := '0';
signal r_done : std_logic := '0';
signal r_first : std_logic := '1';

begin

process(i_clk)
begin

if rising_edge(i_clk) then
    
    if i_rst = '1' then
        r_count <= 0;
        o_res_ena <= '0';
        r_done <= '0';
        r_first <= '1';
    else
    
        if i_ena = '1' then
        
            if r_count = 7 then 
                r_count <= 0;
            else
                if r_first = '0' then
                    r_count <= r_count + 1;
                end if;
            end if;
            
        end if;

    end if;

end if;

if falling_edge(i_clk) and i_rst = '0' and i_ena = '1' then
    o_res <= i_data(r_count);
    o_res_ena <= '1';
    r_first <= '0';
    
    if r_count = 7 then
        r_done <= '1';
    end if;
    
end if;

end process;

o_done <= r_done;

end Behavioral;
