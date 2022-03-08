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

signal r_curr_byte : std_logic_vector(7 downto 0) := "00000000";
signal r_curr_byte_ok :std_logic := '0';

signal r_curr_bit_index : integer range 0 to 7 := 0;

signal r_curr_bit : std_logic;

signal r_wait_cycles : integer range 0 to 15 := 0;

begin

READ_DATA : process(i_clk)
begin

if rising_edge(i_clk) and i_ena = '1' then

    if i_rst = '1' then -- reset
        
        r_curr_addr <= "0000000000000000";
        r_curr_bit_index <= 0;
        r_read_num_bytes <= '0';
        r_curr_byte_ok <= '0';
        r_wait_cycles <= 0;
        o_bit_ok <= '0';
        o_seq_end <= '0';
        
        
    else -- no reset
          
        if r_wait_cycles > 0 then -- cicli di attesa
           r_wait_cycles <=  r_wait_cycles - 1;
        else -- no attesa
            
            if r_read_num_bytes = '1' then -- ho già letto il numero di byte rimanenti
            
                if r_remaining_bytes = 0 then
                    o_seq_end <= '1';
                end if;
                
                if r_curr_byte_ok = '0' then -- non ho memorizzato il nuovo byte in locale
            
                    r_curr_byte <= i_data;
                    r_curr_byte_ok <= '1';
                    --r_wait_cycles <= 1; -- wait for propagation
                    
                else -- byte pronto
                
                    o_bit_ok <= '1';
                    r_curr_bit <= r_curr_byte(7 - r_curr_bit_index);
                    r_curr_bit_index <= r_curr_bit_index + 1;
                    
                    if r_curr_bit_index = 7 then -- finito il byte corrente, passo al nuovo
                        
                        r_curr_addr <= std_logic_vector(unsigned(r_curr_addr) + 1);
                        r_wait_cycles <= 1; -- wait for propagation
                        r_curr_byte_ok <= '0';
                        r_curr_bit_index <= 0;
                        r_remaining_bytes <= r_remaining_bytes - 1;
                        o_bit_ok <= '0';
                        
                    end if;
                      
                end if;
                        
            else -- need to read nbytes
                
                r_remaining_bytes <= to_integer(unsigned(i_data));
                r_read_num_bytes <= '1';
                r_curr_addr <= "0000000000000001";
                r_wait_cycles <= 1; -- wait for propagation
                r_curr_bit_index <= 0;
                
            end if;
        end if;
    end if;
    
end if;

end process READ_DATA;

o_address <= r_curr_addr;

end Behavioral;
