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

component datapath is
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
 end component;

type comp_state is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S_STALL);

signal curr_state, next_state : comp_state;

signal cbyte_load : std_logic; -- abilita caricamento (incremento) del byte corrente
signal sm_ena : std_logic; -- abilita la macchina a stati
signal sm_rst : std_logic; -- resetta la macchina a stati
signal sm_w_sel : std_logic; -- seleziona se scribere bit 0 o 1 dalla macchina a stati bel buff di output
signal curr_mux : std_logic_vector(1 downto 0); -- inutile
signal cbit_rst : std_logic; -- resetta il bit corrente all'interno del byte a 7
signal sr_byte_load : std_logic; -- inserisce nuovo byte nello shift register
signal sr_ena : std_logic; -- abilita lo shift register
signal nbytes_load : std_logic; -- carica il numero di bytes
signal outbuff_rst : std_logic; -- resetta buffer di output
signal outbuff_load : std_logic; -- carica nuovo bit nel buffer di output

signal cnbyte_load : std_logic; -- carica numero totale di byte da processare
signal cnbyte_rst : std_logic; -- resetta numero totale di byte da processare
signal seq_end : std_logic; -- viene alzato se la sequenza è terminata
signal cbit_end : std_logic; -- viene alzato se il byte corrente è processato interamente
signal writesel : std_logic; -- attivo in scrittura

signal outbuff_full : std_logic;

begin

DP : datapath port map(
           i_data,
           i_clk,
           o_data,
           cbyte_load,
           sm_ena,
           sm_rst,
           sm_w_sel,
           curr_mux,
           sr_byte_load,
           sr_ena,
           nbytes_load,
           outbuff_rst,
           outbuff_load,
           seq_end,
           cbit_end,
           outbuff_full,
           writesel,
           o_address);

-- gestisce stato corrente in modo sincronizzato
process(i_clk, i_rst) begin

if i_rst = '1' then
   curr_state <= S0;
elsif rising_edge(i_clk) then
   curr_state <= next_state;
end if;

end process;

process(curr_state, cbit_end, i_start, outbuff_full) begin

case curr_state is
    
    when S0 =>
        if i_start = '1' then
            next_state <= S1;
         end if;
    when S1 =>
        next_state <= S2;
    when S2 =>
         next_state <= S_STALL;
    when S_STALL =>
        next_state <= S3;
    when S3 =>
        next_state <= S4;
    when S4 =>
        next_state <= S5;
    when S5 =>
        next_state <= S6;
    when S6 =>
        if outbuff_full = '1' then
            next_state <= S8;
        else
            next_state <= S7;
        end if;
    when S7 =>
        if cbit_end = '1' then  
           next_state <= S_STALL;
        else
           next_state <= S4;
        end if;
    when S8 =>
        next_state <= S9;
    when S9 =>
        next_state <= S7;
end case;
end process;

process(curr_state) begin

    cbyte_load <= '0';
    sm_ena <= '0';
    sm_rst <= '0';
    sm_w_sel <= '0';
    curr_mux <= "00";
    sr_byte_load <= '0';
    sr_ena <= '0';
    nbytes_load <= '0';
    outbuff_rst <= '0';
    outbuff_load <= '0';
    nbytes_load <= '0';
    writesel <= '0';


    case curr_state is
        when S0 =>
        when S1 =>
           sm_rst <= '1';
           curr_mux <= "11";
           outbuff_rst <= '1';
           outbuff_load <= '1';
        when S2 =>
           curr_mux <= "10";
           nbytes_load <= '1';
        when S_STALL =>
        when S3 =>
           sr_byte_load <= '1';
        when S4 =>
           sr_ena <= '1';
           sm_ena <= '1';
           curr_mux <= "00";
        when S5 =>
           sm_w_sel <= '0';
           outbuff_load <= '1';
           curr_mux <= "00";
        when S6 =>
           sm_w_sel <= '1';
           outbuff_load <= '1';
           curr_mux <= "00";
        when S7 =>
           sm_w_sel <= '1';
           curr_mux <= "01";
        when S8 =>
           sm_w_sel <= '1';
           writesel <= '1';
        when S9 =>
           sm_w_sel <= '1';
           outbuff_rst <= '1';
           outbuff_load <= '1';
    end case;

end process;

o_en <= '1';
o_we <= writesel;

end Behavioral;
