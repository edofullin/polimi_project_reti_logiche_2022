----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2022 10:20:57 PM
-- Design Name: 
-- Module Name: state_machine - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity state_machine is
    port ( i_input : in std_logic;
           i_clk : in std_logic;
           i_ena : in std_logic;
           i_rst : in std_logic;
           o_output : out std_logic_vector(1 downto 0);
           o_out_ok : out std_logic);
end state_machine;

architecture Behavioral of state_machine is

type STATE is (s0, s1, s2, s3);

signal r_curr_state : STATE;

signal r_output_ok : std_logic := '0';

begin

STATE_UPDATE : process (i_clk)
begin

if rising_edge(i_clk) and i_ena = '1' then
    
    if i_rst = '1' then
        r_curr_state <= s0;
    else
        case r_curr_state is
            when s0 =>
                if i_input = '1' then
                    r_curr_state <= s2;
                    o_output <= "11";
                else
                    r_curr_state <= s0;
                    o_output <= "00";
                end if;
            when s1 =>
                if i_input = '1' then
                    r_curr_state <= s2;
                    o_output <= "00";
                else
                    r_curr_state <= s0;
                    o_output <= "11";
                end if;
            when s2 =>
                if i_input = '1' then
                    r_curr_state <= s3;
                    o_output <= "10";
                else
                    r_curr_state <= s1;
                    o_output <= "01";
                end if;
            when s3 =>
                if i_input = '1' then
                    r_curr_state <= s3;
                    o_output <= "01";
                else
                    r_curr_state <= s1;
                    o_output <= "10";
                end if;    
        end case;
    end if;


end if;

end process STATE_UPDATE;

o_out_ok <= r_output_ok;


end Behavioral;
