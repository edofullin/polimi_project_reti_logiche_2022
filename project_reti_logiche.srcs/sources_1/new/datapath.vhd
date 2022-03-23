----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2022 08:55:54 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
    Port ( i_data : in STD_LOGIC_VECTOR (7 downto 0);
           i_clk : in STD_LOGIC;
           o_outbyte : out STD_LOGIC_VECTOR(7 downto 0);
           cbyte_load : in STD_LOGIC;
           sm_ena : in STD_LOGIC;
           sm_rst : in STD_LOGIC;
           sm_w_sel : in STD_LOGIC;
           curr_mux : in STD_LOGIC_VECTOR(1 downto 0);
           sr_byte_load : in STD_LOGIC;
           sr_ena : in STD_LOGIC;
           nbytes_load : in STD_LOGIC;
           outbuff_rst : in std_logic;
           outbuff_load : in std_logic;
           seq_end : out STD_LOGIC;
           cbit_end : out std_logic;
           outbuff_full : out std_logic;
           writesel : in std_logic;
           o_addr : out STD_LOGIC_VECTOR(15 downto 0));
end datapath;

architecture Behavioral of datapath is

component state_machine is     
    Port ( i_ena : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_clk : in STD_LOGIC;
           i_in : in STD_LOGIC;
           o_out : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component shift_register_8b is
    Port ( i_load : in std_logic;
           i_data : in std_logic_vector(7 downto 0);
           i_ena : in std_logic;
           i_clk : in std_logic;
           o_srout : out std_logic);
end component;

component serializer_register_8b is
    Port ( i_clk : in STD_LOGIC;
           i_in : in STD_LOGIC_VECTOR (7 downto 0);
           i_load : in std_logic;
           i_sel : in STD_LOGIC_VECTOR (2 downto 0);
           o_out : out STD_LOGIC);
end component;

signal sm_input: std_logic := '0';
signal sm_input_msr: std_logic := '0';
signal sm_output : std_logic_vector(1 downto 0);

signal curr_out_bit : std_logic;
signal curr_out_bit_vec : std_logic_vector(7 downto 0);
signal currbit_shift : std_logic_vector(7 downto 0);

signal outbuff : std_logic_vector(7 downto 0);
signal outbuff_mux : std_logic_vector(7 downto 0);

signal nbytes : unsigned(7 downto 0);
signal curr_pos : std_logic_vector(10 downto 0); -- 3 bit for current bit (LSB) and 8 for current byte (MSB)
signal cpos_mux : std_logic_vector(10 downto 0);

signal out_pos : std_logic_vector(10 downto 0);

begin

SM : state_machine port map (
    sm_ena,
    sm_rst,
    i_clk,
    sm_input_msr,
    sm_output);
    
SR : shift_register_8b port map(
    sr_byte_load,
    i_data,
    sr_ena,
    i_clk,
    sm_input);
    
MSR: serializer_register_8b port map(
    i_clk,
    i_data,
    sr_byte_load,
    curr_pos(2 downto 0),
    sm_input_msr);

with sm_w_sel select
    curr_out_bit <= sm_output(1) when '0',
                    sm_output(0) when '1',
                    'X' when others;
with sm_w_sel select
     out_pos <= std_logic_vector(shift_left(unsigned(curr_pos), 1)) when '0',
                std_logic_vector(shift_left(unsigned(curr_pos), 1) + 1) when '1',
                (others => 'X') when others;

with outbuff_rst select
    outbuff_mux <= (others => '0') when '1',
                   outbuff or currbit_shift when '0',
                   (others => 'X') when others;

with writesel select
    o_addr <= std_logic_vector(unsigned(X"00" & out_pos(10 downto 3)) + 998) when '1',
              std_logic_vector(unsigned(X"00" & curr_pos(10 downto 3))) when '0',
              (others => '0') when others;  

with curr_mux select
    cpos_mux <= (others => '0') when "11",
                std_logic_vector(unsigned(curr_pos) + 1) when "01",
                std_logic_vector(unsigned(curr_pos) + 8) when "10",
                curr_pos when others;

outbuff_full <= '1' when out_pos(2 downto 0) = "111" else '0';
seq_end <= '1' when unsigned(curr_pos(10 downto 3)) > nbytes else '0';
cbit_end <= '1' when curr_pos(2 downto 0) = "111" else '0';
                   
currbit_shift <= std_logic_vector(shift_left(unsigned(curr_out_bit_vec), 7 - to_integer(unsigned(out_pos(2 downto 0)))));
 
 process(curr_out_bit) begin
    curr_out_bit_vec(7 downto 1) <= "0000000";
    curr_out_bit_vec(0) <= curr_out_bit;
 end process;
 
 process(i_clk, outbuff_mux) begin
    if rising_edge(i_clk) and outbuff_load = '1' then
       outbuff <= outbuff_mux;
    end if;
 end process;
 
 process(i_clk, cpos_mux) begin
 if rising_edge(i_clk) then
     curr_pos <= cpos_mux;
 end if;
 end process;
 
 process(i_clk, nbytes_load) begin
    if rising_edge(i_clk) and nbytes_load = '1' then
       nbytes <= unsigned(i_data);
    end if;
 end process;
 
o_outbyte <= outbuff;

end Behavioral;
