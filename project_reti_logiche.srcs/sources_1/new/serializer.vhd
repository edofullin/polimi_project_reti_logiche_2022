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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mem_reader is
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;
        i_ena : in std_logic;
        i_data : in std_logic_vector(7 downto 0);
        o_address : out std_logic_vector(15 downto 0);
        o_input_bit : out std_logic;
        o_bit_ok : out std_logic;
        o_seq_end : out std_logic
    );
end mem_reader;

architecture Behavioral of mem_reader is

signal r_read_num_bytes : std_logic := '0';
signal r_serial_ena : std_logic := '0';

signal r_remaining_bytes : integer range 0 to 255;
 
signal r_curr_addr : std_logic_vector(15 downto 0);
signal r_curr_bit_index : integer range 0 to 7 := 0;

signal r_curr_bit : std_logic;

begin

READ_DATA : process(i_clk)
begin

if rising_edge(i_clk) and i_ena = '1' then

    if i_rst = '1' then
        
        r_curr_addr <= "0000000000000000";
        r_curr_bit_index <= 0;
        r_read_num_bytes <= '0';
        o_bit_ok <= '0';
        
    else    
    
        if r_read_num_bytes = '1' then
        

            o_bit_ok <= '1';
            r_curr_bit <= i_data(r_curr_bit_index);
            r_curr_bit_index <= r_curr_bit_index + 1;
            
            if r_curr_bit_index = 7 then
                
                r_curr_addr <= std_logic_vector(unsigned(r_curr_addr) + 1);
                r_curr_bit_index <= 0;
                r_remaining_bytes <= r_remaining_bytes - 1;
                o_bit_ok <= '0';
                
            end if;
        else
            
            r_remaining_bytes <= to_integer(unsigned(i_data));
            r_read_num_bytes <= '1';
            r_curr_addr <= "0000000000000001";
            r_curr_bit_index <= 0;
            
        end if;
    end if;
    
end if;

end process READ_DATA;

o_address <= r_curr_addr;

end Behavioral;
