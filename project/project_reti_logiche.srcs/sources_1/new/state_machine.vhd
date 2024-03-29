library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Macchina di Mealy convoluzionatore

entity state_machine is
    Port ( i_ena : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_clk : in STD_LOGIC;
           i_in : in STD_LOGIC;
           o_out : out STD_LOGIC_VECTOR (1 downto 0));
end state_machine;

architecture Behavioral of state_machine is

type State is (S0, S1, S2, S3);

signal curr_state, next_state : State := S0;
signal curr_out, next_out : std_logic_vector(1 downto 0);

begin

process(curr_state, i_in)
begin
next_state <= curr_state;
case curr_state is
    when S0 =>
        if i_in = '1' then
           next_state <= S2;
           next_out <= "11";
        else
           next_state <= S0;
           next_out <= "00";
        end if;
    when S1 =>
        if i_in = '1' then
           next_state <= S2;
           next_out <= "00";
        else
           next_state <= S0;
           next_out <= "11";
        end if;
    when S2 =>
       if i_in = '1' then
           next_state <= S3;
           next_out <= "10";
        else
           next_state <= S1;
           next_out <= "01";
        end if;
    when S3 =>
        if i_in = '1' then
           next_state <= S3;
           next_out <= "01";
        else
           next_state <= S1;
           next_out <= "10";
        end if;       
end case;

end process;

process(i_clk, i_ena, i_rst)
begin

if i_rst = '1' then
   curr_state <= S0;
   curr_out <= "00"; 
elsif rising_edge(i_clk) and i_ena = '1' then

   curr_state <= next_state;
   curr_out <= next_out;

end if;

end process;

o_out <= curr_out;

end Behavioral;
