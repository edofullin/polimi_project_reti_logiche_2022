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
