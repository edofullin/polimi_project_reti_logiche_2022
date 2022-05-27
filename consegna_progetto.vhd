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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Registro che prende in input anche una posizione e restituisce il bit in quella posizione da sinistra

entity serializer_register_8b is
    Port ( i_clk : in STD_LOGIC;
           i_in : in STD_LOGIC_VECTOR (7 downto 0);
           i_load : in std_logic;
           i_sel : in STD_LOGIC_VECTOR (2 downto 0);
           o_out : out STD_LOGIC);
end serializer_register_8b;

architecture Behavioral of serializer_register_8b is

signal curr_byte : std_logic_vector(7 downto 0); -- registro

begin

process(i_clk, i_load)
begin
    
    if rising_edge(i_clk) and i_load = '1' then
       curr_byte <= i_in;
    end if;

end process;

o_out <= curr_byte(to_integer(7 - unsigned(i_sel))); -- bit di output

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity datapath is
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
end datapath;

architecture Behavioral of datapath is

component state_machine is     
    Port ( i_ena : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_clk : in STD_LOGIC;
           i_in : in STD_LOGIC;
           o_out : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component serializer_register_8b is
    Port ( i_clk : in STD_LOGIC;
           i_in : in STD_LOGIC_VECTOR (7 downto 0);
           i_load : in std_logic;
           i_sel : in STD_LOGIC_VECTOR (2 downto 0);
           o_out : out STD_LOGIC);
end component;

signal sm_input_msr: std_logic := '0'; -- bit di input alla state machine
signal sm_output : std_logic_vector(1 downto 0); -- vettore di output dalla state machine

signal curr_out_bit : std_logic; -- bit corrente di output dalla state machine
signal curr_out_bit_vec : std_logic_vector(7 downto 0); -- segnale interno per rendere il bit della stessa lungh. del buffer
signal currbit_shift : std_logic_vector(7 downto 0); -- segnale interno per aggiornamento buffer

signal outbuff : std_logic_vector(7 downto 0); -- buffer di output
signal outbuff_mux : std_logic_vector(7 downto 0); -- input a buffer di output

signal nbytes : unsigned(7 downto 0); -- numero di bytes della sequenza
signal curr_pos : std_logic_vector(10 downto 0); -- registro posizione corrente, 3 bit (LSB) indicano bit corrente, gli altri 8 il byte corrente
signal cpos_mux : std_logic_vector(10 downto 0); -- prossimo stato registro posizione
signal curr_pos_overflow : std_logic := '0'; -- segnale interno in caso di overflow
signal out_pos : std_logic_vector(15 downto 0); -- posizione di output

begin

SM : state_machine port map (
    sm_ena,
    sm_rst,
    i_clk,
    sm_input_msr,
    sm_output);
    
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
                    
-- calcolo della posizione di ouput (2 * currpos [+ 1])                    
with sm_w_sel select
     out_pos <= std_logic_vector(shift_left(unsigned("00000" & curr_pos), 1)) when '0',
                std_logic_vector(shift_left(unsigned("00000" & curr_pos), 1) + 1) when '1',
                (others => 'X') when others;

with outbuff_rst select
    outbuff_mux <= (others => '0') when '1',
                   outbuff or currbit_shift when '0', -- nuovo valore bit di output (scrivi nesimo bit)
                   (others => 'X') when others;

-- output inidirizzo memoria
with writesel select
    o_addr <= std_logic_vector(unsigned("000" & out_pos(15 downto 3)) + 998) when '1',
              std_logic_vector(unsigned(X"00" & curr_pos(10 downto 3))) when '0',
              (others => '0') when others;  

-- segnale mux per aggiornamento posizione
-- 00 : non aggiornare registro
-- 01 : avanza al prossimo bit
-- 10 : avanza di un byte
-- 11 : reset a zero
with curr_mux select
    cpos_mux <= (others => '0') when "11",
                std_logic_vector(unsigned(curr_pos) + 1) when "01",
                std_logic_vector(unsigned(curr_pos) + 8) when "10",
                curr_pos when others;

outbuff_full <= '1' when out_pos(2 downto 0) = "111" else '0';

-- la sequenza è finita se il byte la posizione corrente è maggiore del numero di byte della sequenza
-- oppure se il la posizione del byte corrente è andata in overflow
seq_end <= '1' when unsigned(curr_pos(10 downto 3)) > nbytes or curr_pos_overflow = '1' else '0'; 

cbit_end <= '1' when curr_pos(2 downto 0) = "111" else '0';

-- scrittura del bufferi di ouput in modo combinatorio con shift e bitwise or, esempio:
-- OUTBUFF: 01001000, devo scrivere 1 in terza posizione da sinistra (partendo da zero)
-- Trasformo 1 in 00000001 (curr_out_bit_vec), shifto a sinistra di 7 - 3 = 4 posizioni e faccio or con valore attuale
-- 00000001 << 4 = 00010000 OR 01001000 = 01011000                  
currbit_shift <= std_logic_vector(shift_left(unsigned(curr_out_bit_vec), 7 - to_integer(unsigned(out_pos(2 downto 0)))));
 
 -- calcolo vettore da singolo bit
 process(curr_out_bit) begin
    curr_out_bit_vec(7 downto 1) <= "0000000";
    curr_out_bit_vec(0) <= curr_out_bit;
 end process;
 
 -- aggiornamento buffer output
 process(i_clk, outbuff_mux) begin
    if rising_edge(i_clk) and outbuff_load = '1' then
       outbuff <= outbuff_mux;
    end if;
 end process;
 
 -- aggiornamento registro posizione e segnalazione di overflow
 process(i_clk, cpos_mux) begin
 if rising_edge(i_clk) then
    
    if curr_pos = "11111111111" and cpos_mux = "00000000000" then
       curr_pos_overflow <= '1';
    else
       curr_pos_overflow <= '0';
    end if;
 
     curr_pos <= cpos_mux;
 end if;
 end process;
 
 -- caricamento numero byte
 process(i_clk, nbytes_load) begin
    if rising_edge(i_clk) and nbytes_load = '1' then
       nbytes <= unsigned(i_data);
    end if;
 end process;
 
o_outbyte <= outbuff;

end Behavioral;
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
