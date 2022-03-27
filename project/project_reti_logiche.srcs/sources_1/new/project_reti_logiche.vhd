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

type comp_state is (
    S_SINIT, -- Stato Iniziale della sequenza (attesa start)
    S_RST, -- Reset tutti i componenti
    S_RNB, -- Leggi numero bytes
    S_RB, -- Leggi byte corrente
    S_SM, -- Calcola output convoluzionatore
    S_W0, -- Scrivi bit 0 in output buffer
    S_W1, -- Scrivi bit 1 in output buffer
    S_FIN, -- Bit corrente letto, avanza
    S_WB, -- Output buffer pieno, scrivi in memoria
    S_RSTOB, -- Reset output buffer
    S_SWNB, -- Stallo attesa numero byte da memoria
    S_SWB, -- Stallo attesa byte da memoria
    S_INIT, -- Stato Iniziale macchina (attesa RST)
    S_DONE -- Computazione terminata
);

-- stati macchina di controllo
signal curr_state, next_state : comp_state := S_SINIT;

-- segnali pilota per datapath
signal sm_ena : std_logic; -- abilita la macchina a stati
signal sm_rst : std_logic; -- resetta la macchina a stati
signal sm_w_sel : std_logic; -- seleziona se scribere bit 0 o 1 dalla macchina a stati bel buff di output
signal curr_mux : std_logic_vector(1 downto 0); -- segnale pilota MUX contatore
signal cbit_rst : std_logic; -- resetta il bit corrente all'interno del byte a 7
signal sr_byte_load : std_logic; -- inserisce nuovo byte nello shift register
signal sr_ena : std_logic; -- carica byte nel registro serializzatore
signal nbytes_load : std_logic; -- carica il numero di bytes
signal outbuff_rst : std_logic; -- resetta buffer di output a zero (necessario per sovrascrittura)
signal outbuff_load : std_logic; -- abilita caricamento in buffer di output
signal writesel : std_logic; -- deve essere attivo per la scrittura in memoria

-- segnali stato dal datapath
signal seq_end : std_logic; -- viene alzato dal datapath se la sequenza è terminata
signal cbit_end : std_logic; -- viene alzato dal datapath se il byte corrente è stato processato per intero
signal outbuff_full : std_logic; -- viene alzato dal datapath se il buffer di output è pieno

begin

DP : datapath port map(
           i_data,
           i_clk,
           o_data,
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
   curr_state <= S_SINIT;
elsif rising_edge(i_clk) then
   curr_state <= next_state;
end if;

end process;

-- calcolo prossimo stato (combinatorio)
process(curr_state, cbit_end, i_start, outbuff_full, i_rst) begin

next_state <= curr_state;

case curr_state is
    when S_INIT =>
        if i_rst = '1' then
           next_state <= S_SINIT;
        end if;
    when S_SINIT =>
        if i_start = '1' then
            next_state <= S_RST;
         end if;
    when S_RST =>
        next_state <= S_RNB;
    when S_RNB =>
         next_state <= S_SWNB;
    when S_SWNB =>
        if seq_end = '1' then
           next_state <= S_DONE;
        else
           next_state <= S_RB;
        end if;
    when S_RB =>
        if seq_end = '1' then
           next_state <= S_DONE;
        else
           next_state <= S_SWB;
        end if;
    when S_SWB =>
        next_state <= S_SM;
    when S_SM =>
        next_state <= S_W0;
    when S_W0 =>
        next_state <= S_W1;
    when S_W1 =>
        if outbuff_full = '1' then
            next_state <= S_WB;
        else
            next_state <= S_FIN;
        end if;
    when S_FIN =>
        if cbit_end = '1' then  
           next_state <= S_SWNB;
        else
           next_state <= S_SWB;
        end if;
    when S_WB =>
        next_state <= S_RSTOB;
    when S_RSTOB =>
        next_state <= S_FIN;
    when S_DONE =>
        if i_start = '0' then
           next_state <= S_SINIT;
        end if;
end case;
end process;

-- output segnali (combinatorio)
process(curr_state) begin

    sm_ena <= '0';
    sm_rst <= '0';
    sm_w_sel <= '0';
    curr_mux <= "00";
    sr_byte_load <= '0';
    sr_ena <= '0';
    nbytes_load <= '0';
    outbuff_rst <= '0';
    outbuff_load <= '0';
    writesel <= '0';
    o_done <= '0';


    case curr_state is
        when S_SINIT =>
        when S_RST =>
           sm_rst <= '1';
           curr_mux <= "11";
           outbuff_rst <= '1';
           outbuff_load <= '1';
        when S_RNB =>
           curr_mux <= "10";
           nbytes_load <= '1';
        when S_SWNB =>
        when S_RB =>
           sr_byte_load <= '1';
        when S_SWB =>
           sr_byte_load <= '1';
        when S_SM =>
           sr_ena <= '1';
           sm_ena <= '1';
           curr_mux <= "00";
        when S_W0 =>
           sm_w_sel <= '0';
           outbuff_load <= '1';
           curr_mux <= "00";
        when S_W1 =>
           sm_w_sel <= '1';
           outbuff_load <= '1';
           curr_mux <= "00";
        when S_FIN =>
           sm_w_sel <= '1';
           curr_mux <= "01";
        when S_WB =>
           sm_w_sel <= '1';
           writesel <= '1';
        when S_RSTOB =>
           sm_w_sel <= '1';
           outbuff_rst <= '1';
           outbuff_load <= '1';
        when S_DONE =>
            o_done <= '1';
            curr_mux <= "11";
        when S_INIT =>
    end case;

end process;

o_en <= '1'; -- memoria sempre attiva
o_we <= writesel;

end Behavioral;
