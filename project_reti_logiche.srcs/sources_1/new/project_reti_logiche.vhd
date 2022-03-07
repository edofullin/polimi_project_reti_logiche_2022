----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 05:14:14 PM
-- Design Name: 
-- Module Name: project_reti_logiche - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity project_reti_logiche is
port (
    i_clk : in std_logic;
    i_rst : in std_logic;
    i_start : in std_logic;
    i_data : in std_logic_vector(7 downto 0);
    o_address : out std_logic_vector(15 downto 0);
    o_done : out std_logic;
    o_en : out std_logic;
    o_we : out std_logic;
    o_data : out std_logic_vector (7 downto 0)
);
end project_reti_logiche;

architecture Behavioral of project_reti_logiche is

component mem_reader is
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;
        i_ena : in std_logic;
        i_data : in std_logic_vector(7 downto 0);
        o_address : out std_logic_vector(15 downto 0);
        o_input_bit : out std_logic;
        o_bit_ok : out std_logic
    );
end component mem_reader;

signal r_sr_ena : std_logic := '1';
signal r_fsm_input : std_logic;
signal r_fsm_bitok : std_logic;


begin

MEMR : mem_reader port map(
    i_clk => i_clk,
    i_data => i_data,
    i_rst => i_rst,
    i_ena => r_sr_ena,
    o_address => o_address,
    o_input_bit => r_fsm_input,
    o_bit_ok => r_fsm_bitok
);

o_en <= '1';
o_we <= '0';
r_sr_ena <= '1';


end Behavioral;
