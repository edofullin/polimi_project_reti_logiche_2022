library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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

type comp_state is (S0, S1, S2, S3, S4, S5, S6);

signal curr_state, next_state : comp_state;
signal curr_addr, next_addr : std_logic_vector(15 downto 0);

signal cbyte_end : std_logic := '0';

begin

-- gestisce stato corrente in modo sincronizzato
process(i_clk, i_rst) begin

if i_rst = '1' then
   curr_state <= S0;
   curr_addr <= (others => '0');
elsif rising_edge(i_clk) then
   curr_state <= next_state;
   curr_addr <= next_addr;
end if; 

o_address <= curr_addr;

end process;

process(curr_state, curr_addr, cbyte_end, i_start) begin

next_state <= curr_state;
next_addr <= curr_addr;

case curr_state is
    
    when S0 =>
        if i_start = '1' then
            next_state <= S1;
         end if;
    when S1 =>
        next_state <= S2;
    when S2 =>
        if cbyte_end = '1' then
           next_state <= S6;
        else
            next_state <= S3;
            next_addr <= std_logic_vector(unsigned(curr_addr) + 1);
        end if;
    when S3 =>
        next_state <= S4;
    when S4 =>
        next_state <= S5;
    when S5 =>
        if cbyte_end = '1' then
            next_state <= S2;
        else
            next_state <= S3;
        end if;
    when S6 =>
        next_state <= S0;
end case;
end process;

process(curr_state) begin

o_address <= (others => '0');


case curr_state is
    when S0 =>
    when S1 =>
    when S2 =>
    when S3 =>
    when S4 =>
    when S5 =>
    when S6 =>
end case;

end process;

o_en <= '1';
o_we <= '0';

end Behavioral;
