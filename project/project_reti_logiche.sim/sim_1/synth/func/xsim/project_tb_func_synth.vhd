-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Tue Apr  5 18:57:06 2022
-- Host        : edoardo-macmi running 64-bit unknown
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/edoardo/Code/polimi_project_reti_logiche_2022/project/project_reti_logiche.sim/sim_1/synth/func/xsim/project_tb_func_synth.vhd
-- Design      : project_reti_logiche
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity serializer_register_8b is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_curr_state_reg[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \curr_byte_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \curr_out_reg[1]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \curr_byte_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC
  );
end serializer_register_8b;

architecture STRUCTURE of serializer_register_8b is
  signal \FSM_sequential_curr_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_curr_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_curr_state[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_curr_state[0]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_curr_state[0]_i_6_n_0\ : STD_LOGIC;
  signal \curr_byte_reg_n_0_[0]\ : STD_LOGIC;
  signal data0 : STD_LOGIC;
  signal data2 : STD_LOGIC;
  signal data3 : STD_LOGIC;
  signal data4 : STD_LOGIC;
  signal data5 : STD_LOGIC;
  signal data6 : STD_LOGIC;
  signal data7 : STD_LOGIC;
  signal sr_byte_load : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_curr_state[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \curr_out[0]_i_1\ : label is "soft_lutpair0";
begin
\FSM_sequential_curr_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EB28"
    )
        port map (
      I0 => \FSM_sequential_curr_state[0]_i_2_n_0\,
      I1 => Q(0),
      I2 => Q(1),
      I3 => \FSM_sequential_curr_state[0]_i_3_n_0\,
      O => D(0)
    );
\FSM_sequential_curr_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF1111D111"
    )
        port map (
      I0 => \FSM_sequential_curr_state[0]_i_4_n_0\,
      I1 => \curr_out_reg[1]\(0),
      I2 => \curr_out_reg[1]\(2),
      I3 => \curr_out_reg[1]\(1),
      I4 => \curr_byte_reg_n_0_[0]\,
      I5 => \FSM_sequential_curr_state[0]_i_5_n_0\,
      O => \FSM_sequential_curr_state[0]_i_2_n_0\
    );
\FSM_sequential_curr_state[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFE2222222"
    )
        port map (
      I0 => \FSM_sequential_curr_state[0]_i_4_n_0\,
      I1 => \curr_out_reg[1]\(0),
      I2 => \curr_byte_reg_n_0_[0]\,
      I3 => \curr_out_reg[1]\(2),
      I4 => \curr_out_reg[1]\(1),
      I5 => \FSM_sequential_curr_state[0]_i_6_n_0\,
      O => \FSM_sequential_curr_state[0]_i_3_n_0\
    );
\FSM_sequential_curr_state[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data2,
      I1 => data6,
      I2 => \curr_out_reg[1]\(1),
      I3 => data4,
      I4 => \curr_out_reg[1]\(2),
      I5 => data0,
      O => \FSM_sequential_curr_state[0]_i_4_n_0\
    );
\FSM_sequential_curr_state[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"005000500030F030"
    )
        port map (
      I0 => data3,
      I1 => data7,
      I2 => \curr_out_reg[1]\(0),
      I3 => \curr_out_reg[1]\(1),
      I4 => data5,
      I5 => \curr_out_reg[1]\(2),
      O => \FSM_sequential_curr_state[0]_i_5_n_0\
    );
\FSM_sequential_curr_state[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A000A0F0C000C0"
    )
        port map (
      I0 => data3,
      I1 => data7,
      I2 => \curr_out_reg[1]\(0),
      I3 => \curr_out_reg[1]\(1),
      I4 => data5,
      I5 => \curr_out_reg[1]\(2),
      O => \FSM_sequential_curr_state[0]_i_6_n_0\
    );
\curr_byte[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \curr_byte_reg[0]_0\(0),
      I1 => \curr_byte_reg[0]_0\(1),
      O => sr_byte_load
    );
\curr_byte_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sr_byte_load,
      D => \curr_byte_reg[7]_0\(0),
      Q => \curr_byte_reg_n_0_[0]\,
      R => '0'
    );
\curr_byte_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sr_byte_load,
      D => \curr_byte_reg[7]_0\(1),
      Q => data2,
      R => '0'
    );
\curr_byte_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sr_byte_load,
      D => \curr_byte_reg[7]_0\(2),
      Q => data3,
      R => '0'
    );
\curr_byte_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sr_byte_load,
      D => \curr_byte_reg[7]_0\(3),
      Q => data4,
      R => '0'
    );
\curr_byte_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sr_byte_load,
      D => \curr_byte_reg[7]_0\(4),
      Q => data5,
      R => '0'
    );
\curr_byte_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sr_byte_load,
      D => \curr_byte_reg[7]_0\(5),
      Q => data6,
      R => '0'
    );
\curr_byte_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sr_byte_load,
      D => \curr_byte_reg[7]_0\(6),
      Q => data7,
      R => '0'
    );
\curr_byte_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sr_byte_load,
      D => \curr_byte_reg[7]_0\(7),
      Q => data0,
      R => '0'
    );
\curr_out[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \FSM_sequential_curr_state[0]_i_2_n_0\,
      I1 => Q(0),
      I2 => \FSM_sequential_curr_state[0]_i_3_n_0\,
      O => \FSM_sequential_curr_state_reg[1]\(0)
    );
\curr_out[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \FSM_sequential_curr_state[0]_i_2_n_0\,
      I1 => Q(1),
      I2 => \FSM_sequential_curr_state[0]_i_3_n_0\,
      O => \FSM_sequential_curr_state_reg[1]\(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity state_machine is
  port (
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \FSM_sequential_curr_state_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \outbuff_reg[7]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \outbuff_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \FSM_sequential_curr_state_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \curr_out_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK : in STD_LOGIC;
    \curr_out_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end state_machine;

architecture STRUCTURE of state_machine is
  signal \^fsm_sequential_curr_state_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal curr_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_state : STD_LOGIC_VECTOR ( 1 to 1 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_curr_state_reg[0]\ : label is "s0:00,s2:01,s1:11,s3:10";
  attribute FSM_ENCODED_STATES of \FSM_sequential_curr_state_reg[1]\ : label is "s0:00,s2:01,s1:11,s3:10";
begin
  \FSM_sequential_curr_state_reg[1]_0\(1 downto 0) <= \^fsm_sequential_curr_state_reg[1]_0\(1 downto 0);
\FSM_sequential_curr_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^fsm_sequential_curr_state_reg[1]_0\(0),
      I1 => \^fsm_sequential_curr_state_reg[1]_0\(1),
      O => next_state(1)
    );
\FSM_sequential_curr_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_out_reg[0]_0\(1),
      CLR => \curr_out_reg[0]_0\(0),
      D => \FSM_sequential_curr_state_reg[0]_0\(0),
      Q => \^fsm_sequential_curr_state_reg[1]_0\(0)
    );
\FSM_sequential_curr_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_out_reg[0]_0\(1),
      CLR => \curr_out_reg[0]_0\(0),
      D => next_state(1),
      Q => \^fsm_sequential_curr_state_reg[1]_0\(1)
    );
\curr_out_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_out_reg[0]_0\(1),
      CLR => \curr_out_reg[0]_0\(0),
      D => \curr_out_reg[1]_0\(0),
      Q => curr_out(0)
    );
\curr_out_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_out_reg[0]_0\(1),
      CLR => \curr_out_reg[0]_0\(0),
      D => \curr_out_reg[1]_0\(1),
      Q => curr_out(1)
    );
\outbuff[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => \outbuff_reg[7]\,
      I1 => curr_out(0),
      I2 => Q(1),
      I3 => Q(0),
      I4 => \outbuff_reg[7]_0\(0),
      O => D(0)
    );
\outbuff[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0080"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => curr_out(1),
      I3 => \outbuff_reg[7]\,
      I4 => \outbuff_reg[7]_0\(1),
      O => D(1)
    );
\outbuff[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0080"
    )
        port map (
      I0 => \outbuff_reg[7]\,
      I1 => curr_out(0),
      I2 => Q(1),
      I3 => Q(0),
      I4 => \outbuff_reg[7]_0\(2),
      O => D(2)
    );
\outbuff[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0020"
    )
        port map (
      I0 => curr_out(1),
      I1 => \outbuff_reg[7]\,
      I2 => Q(1),
      I3 => Q(0),
      I4 => \outbuff_reg[7]_0\(3),
      O => D(3)
    );
\outbuff[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF2000"
    )
        port map (
      I0 => \outbuff_reg[7]\,
      I1 => Q(1),
      I2 => curr_out(0),
      I3 => Q(0),
      I4 => \outbuff_reg[7]_0\(4),
      O => D(4)
    );
\outbuff[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0020"
    )
        port map (
      I0 => curr_out(1),
      I1 => \outbuff_reg[7]\,
      I2 => Q(0),
      I3 => Q(1),
      I4 => \outbuff_reg[7]_0\(5),
      O => D(5)
    );
\outbuff[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0020"
    )
        port map (
      I0 => \outbuff_reg[7]\,
      I1 => Q(1),
      I2 => curr_out(0),
      I3 => Q(0),
      I4 => \outbuff_reg[7]_0\(6),
      O => D(6)
    );
\outbuff[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0002"
    )
        port map (
      I0 => curr_out(1),
      I1 => \outbuff_reg[7]\,
      I2 => Q(0),
      I3 => Q(1),
      I4 => \outbuff_reg[7]_0\(7),
      O => D(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity datapath is
  port (
    \FSM_onehot_curr_state_reg[13]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_address_OBUF : out STD_LOGIC_VECTOR ( 10 downto 0 );
    D : out STD_LOGIC_VECTOR ( 5 downto 0 );
    CLK : in STD_LOGIC;
    \curr_pos_reg[2]_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \curr_byte_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end datapath;

architecture STRUCTURE of datapath is
  signal \FSM_onehot_curr_state[7]_i_2_n_0\ : STD_LOGIC;
  signal \^fsm_onehot_curr_state_reg[13]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SHIFT_LEFT : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal SM_n_0 : STD_LOGIC;
  signal SM_n_1 : STD_LOGIC;
  signal SM_n_2 : STD_LOGIC;
  signal SM_n_3 : STD_LOGIC;
  signal SM_n_4 : STD_LOGIC;
  signal SM_n_5 : STD_LOGIC;
  signal SM_n_6 : STD_LOGIC;
  signal SM_n_7 : STD_LOGIC;
  signal cpos_mux : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \curr_pos[10]_i_2_n_0\ : STD_LOGIC;
  signal \curr_pos[10]_i_3_n_0\ : STD_LOGIC;
  signal \curr_pos[10]_i_4_n_0\ : STD_LOGIC;
  signal \curr_pos[10]_i_5_n_0\ : STD_LOGIC;
  signal \curr_pos[10]_i_6_n_0\ : STD_LOGIC;
  signal \curr_pos[10]_i_7_n_0\ : STD_LOGIC;
  signal \curr_pos[10]_i_8_n_0\ : STD_LOGIC;
  signal \curr_pos[4]_i_2_n_0\ : STD_LOGIC;
  signal \curr_pos[4]_i_3_n_0\ : STD_LOGIC;
  signal \curr_pos[4]_i_4_n_0\ : STD_LOGIC;
  signal \curr_pos[9]_i_2_n_0\ : STD_LOGIC;
  signal curr_pos_overflow : STD_LOGIC;
  signal curr_pos_overflow_i_1_n_0 : STD_LOGIC;
  signal curr_pos_overflow_i_2_n_0 : STD_LOGIC;
  signal curr_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nbytes : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal next_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \o_address_OBUF[10]_inst_i_2_n_0\ : STD_LOGIC;
  signal \o_address_OBUF[6]_inst_i_2_n_0\ : STD_LOGIC;
  signal \o_address_OBUF[6]_inst_i_3_n_0\ : STD_LOGIC;
  signal \o_address_OBUF[8]_inst_i_2_n_0\ : STD_LOGIC;
  signal \o_address_OBUF[9]_inst_i_2_n_0\ : STD_LOGIC;
  signal outbuff0 : STD_LOGIC;
  signal outbuff_load : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal seq_end1_carry_i_1_n_0 : STD_LOGIC;
  signal seq_end1_carry_i_2_n_0 : STD_LOGIC;
  signal seq_end1_carry_i_3_n_0 : STD_LOGIC;
  signal seq_end1_carry_i_4_n_0 : STD_LOGIC;
  signal seq_end1_carry_i_5_n_0 : STD_LOGIC;
  signal seq_end1_carry_i_6_n_0 : STD_LOGIC;
  signal seq_end1_carry_i_7_n_0 : STD_LOGIC;
  signal seq_end1_carry_i_8_n_0 : STD_LOGIC;
  signal seq_end1_carry_n_0 : STD_LOGIC;
  signal seq_end1_carry_n_1 : STD_LOGIC;
  signal seq_end1_carry_n_2 : STD_LOGIC;
  signal seq_end1_carry_n_3 : STD_LOGIC;
  signal NLW_seq_end1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[11]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[13]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[4]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[5]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \curr_pos[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \curr_pos[10]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \curr_pos[10]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \curr_pos[10]_i_4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \curr_pos[10]_i_6\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \curr_pos[10]_i_7\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \curr_pos[10]_i_8\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \curr_pos[4]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \curr_pos[5]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \curr_pos[6]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \curr_pos[9]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \o_address_OBUF[0]_inst_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \o_address_OBUF[10]_inst_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \o_address_OBUF[1]_inst_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \o_address_OBUF[2]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \o_address_OBUF[3]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \o_address_OBUF[8]_inst_i_2\ : label is "soft_lutpair4";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of seq_end1_carry : label is 11;
begin
  \FSM_onehot_curr_state_reg[13]\ <= \^fsm_onehot_curr_state_reg[13]\;
  Q(7 downto 0) <= \^q\(7 downto 0);
\FSM_onehot_curr_state[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(8),
      I1 => SHIFT_LEFT(2),
      I2 => SHIFT_LEFT(1),
      O => D(4)
    );
\FSM_onehot_curr_state[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF2A"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(8),
      I1 => SHIFT_LEFT(1),
      I2 => SHIFT_LEFT(2),
      I3 => \curr_pos_reg[2]_0\(10),
      O => D(5)
    );
\FSM_onehot_curr_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAAAAAA"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(1),
      I1 => SHIFT_LEFT(3),
      I2 => SHIFT_LEFT(1),
      I3 => SHIFT_LEFT(2),
      I4 => \curr_pos_reg[2]_0\(11),
      O => D(0)
    );
\FSM_onehot_curr_state[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(2),
      I1 => curr_pos_overflow,
      I2 => seq_end1_carry_n_0,
      O => D(1)
    );
\FSM_onehot_curr_state[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEE0"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(3),
      I1 => \curr_pos_reg[2]_0\(2),
      I2 => curr_pos_overflow,
      I3 => seq_end1_carry_n_0,
      O => D(2)
    );
\FSM_onehot_curr_state[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A8A8AFF8A8A8A8A"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(11),
      I1 => \FSM_onehot_curr_state[7]_i_2_n_0\,
      I2 => SHIFT_LEFT(3),
      I3 => seq_end1_carry_n_0,
      I4 => curr_pos_overflow,
      I5 => \curr_pos_reg[2]_0\(3),
      O => D(3)
    );
\FSM_onehot_curr_state[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SHIFT_LEFT(1),
      I1 => SHIFT_LEFT(2),
      O => \FSM_onehot_curr_state[7]_i_2_n_0\
    );
MSR: entity work.serializer_register_8b
     port map (
      CLK => CLK,
      D(0) => next_state(0),
      \FSM_sequential_curr_state_reg[1]\(1 downto 0) => next_out(1 downto 0),
      Q(1 downto 0) => curr_state(1 downto 0),
      \curr_byte_reg[0]_0\(1) => \curr_pos_reg[2]_0\(5),
      \curr_byte_reg[0]_0\(0) => \curr_pos_reg[2]_0\(3),
      \curr_byte_reg[7]_0\(7 downto 0) => \curr_byte_reg[7]\(7 downto 0),
      \curr_out_reg[1]\(2 downto 0) => SHIFT_LEFT(3 downto 1)
    );
SM: entity work.state_machine
     port map (
      CLK => CLK,
      D(7) => SM_n_0,
      D(6) => SM_n_1,
      D(5) => SM_n_2,
      D(4) => SM_n_3,
      D(3) => SM_n_4,
      D(2) => SM_n_5,
      D(1) => SM_n_6,
      D(0) => SM_n_7,
      \FSM_sequential_curr_state_reg[0]_0\(0) => next_state(0),
      \FSM_sequential_curr_state_reg[1]_0\(1 downto 0) => curr_state(1 downto 0),
      Q(1 downto 0) => SHIFT_LEFT(2 downto 1),
      \curr_out_reg[0]_0\(1) => \curr_pos_reg[2]_0\(6),
      \curr_out_reg[0]_0\(0) => \curr_pos_reg[2]_0\(0),
      \curr_out_reg[1]_0\(1 downto 0) => next_out(1 downto 0),
      \outbuff_reg[7]\ => \^fsm_onehot_curr_state_reg[13]\,
      \outbuff_reg[7]_0\(7 downto 0) => \^q\(7 downto 0)
    );
\curr_pos[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010300"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(1),
      I1 => \curr_pos_reg[2]_0\(0),
      I2 => \curr_pos_reg[2]_0\(4),
      I3 => SHIFT_LEFT(1),
      I4 => \curr_pos_reg[2]_0\(11),
      O => cpos_mux(0)
    );
\curr_pos[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF308830"
    )
        port map (
      I0 => \curr_pos[10]_i_2_n_0\,
      I1 => \curr_pos[10]_i_3_n_0\,
      I2 => \curr_pos[10]_i_4_n_0\,
      I3 => p_0_in(7),
      I4 => \curr_pos[10]_i_5_n_0\,
      O => cpos_mux(10)
    );
\curr_pos[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0007"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(11),
      I1 => \curr_pos_reg[2]_0\(1),
      I2 => \curr_pos_reg[2]_0\(4),
      I3 => \curr_pos_reg[2]_0\(0),
      O => \curr_pos[10]_i_2_n_0\
    );
\curr_pos[10]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => p_0_in(5),
      I1 => p_0_in(3),
      I2 => p_0_in(2),
      I3 => p_0_in(4),
      I4 => p_0_in(6),
      O => \curr_pos[10]_i_3_n_0\
    );
\curr_pos[10]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(0),
      I1 => \curr_pos_reg[2]_0\(4),
      I2 => \curr_pos[10]_i_6_n_0\,
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      O => \curr_pos[10]_i_4_n_0\
    );
\curr_pos[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000D5F5F5F"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(11),
      I1 => \curr_pos[10]_i_7_n_0\,
      I2 => \curr_pos_reg[2]_0\(1),
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      I5 => \curr_pos[10]_i_8_n_0\,
      O => \curr_pos[10]_i_5_n_0\
    );
\curr_pos[10]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF8000"
    )
        port map (
      I0 => SHIFT_LEFT(2),
      I1 => SHIFT_LEFT(3),
      I2 => SHIFT_LEFT(1),
      I3 => \curr_pos_reg[2]_0\(11),
      I4 => \curr_pos_reg[2]_0\(1),
      O => \curr_pos[10]_i_6_n_0\
    );
\curr_pos[10]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => SHIFT_LEFT(2),
      I1 => SHIFT_LEFT(1),
      I2 => SHIFT_LEFT(3),
      O => \curr_pos[10]_i_7_n_0\
    );
\curr_pos[10]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(0),
      I1 => \curr_pos_reg[2]_0\(4),
      O => \curr_pos[10]_i_8_n_0\
    );
\curr_pos[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101000201030000"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(11),
      I1 => \curr_pos_reg[2]_0\(4),
      I2 => \curr_pos_reg[2]_0\(0),
      I3 => \curr_pos_reg[2]_0\(1),
      I4 => SHIFT_LEFT(2),
      I5 => SHIFT_LEFT(1),
      O => cpos_mux(1)
    );
\curr_pos[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0103010100000002"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(11),
      I1 => \curr_pos_reg[2]_0\(4),
      I2 => \curr_pos_reg[2]_0\(0),
      I3 => \curr_pos_reg[2]_0\(1),
      I4 => \FSM_onehot_curr_state[7]_i_2_n_0\,
      I5 => SHIFT_LEFT(3),
      O => cpos_mux(2)
    );
\curr_pos[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000CAAAAAAAA"
    )
        port map (
      I0 => \curr_pos[4]_i_4_n_0\,
      I1 => \curr_pos[4]_i_3_n_0\,
      I2 => \curr_pos_reg[2]_0\(1),
      I3 => \curr_pos_reg[2]_0\(0),
      I4 => \curr_pos_reg[2]_0\(4),
      I5 => p_0_in(0),
      O => cpos_mux(3)
    );
\curr_pos[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888F8F8FF000000"
    )
        port map (
      I0 => \curr_pos[4]_i_2_n_0\,
      I1 => \curr_pos[4]_i_3_n_0\,
      I2 => \curr_pos[10]_i_2_n_0\,
      I3 => \curr_pos[4]_i_4_n_0\,
      I4 => p_0_in(0),
      I5 => p_0_in(1),
      O => cpos_mux(4)
    );
\curr_pos[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(4),
      I1 => \curr_pos_reg[2]_0\(0),
      I2 => \curr_pos_reg[2]_0\(1),
      O => \curr_pos[4]_i_2_n_0\
    );
\curr_pos[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => SHIFT_LEFT(3),
      I1 => SHIFT_LEFT(1),
      I2 => SHIFT_LEFT(2),
      I3 => \curr_pos_reg[2]_0\(11),
      O => \curr_pos[4]_i_3_n_0\
    );
\curr_pos[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000062222222"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(1),
      I1 => \curr_pos_reg[2]_0\(11),
      I2 => SHIFT_LEFT(1),
      I3 => SHIFT_LEFT(3),
      I4 => SHIFT_LEFT(2),
      I5 => \curr_pos[10]_i_8_n_0\,
      O => \curr_pos[4]_i_4_n_0\
    );
\curr_pos[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \curr_pos[10]_i_5_n_0\,
      I1 => p_0_in(2),
      I2 => \curr_pos[10]_i_4_n_0\,
      O => cpos_mux(5)
    );
\curr_pos[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA044A0"
    )
        port map (
      I0 => p_0_in(2),
      I1 => \curr_pos[10]_i_2_n_0\,
      I2 => \curr_pos[10]_i_4_n_0\,
      I3 => p_0_in(3),
      I4 => \curr_pos[10]_i_5_n_0\,
      O => cpos_mux(6)
    );
\curr_pos[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF880070708800"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      I2 => \curr_pos[10]_i_2_n_0\,
      I3 => \curr_pos[10]_i_4_n_0\,
      I4 => p_0_in(4),
      I5 => \curr_pos[10]_i_5_n_0\,
      O => cpos_mux(7)
    );
\curr_pos[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0C00A2A20C00"
    )
        port map (
      I0 => \curr_pos[10]_i_2_n_0\,
      I1 => p_0_in(4),
      I2 => \o_address_OBUF[6]_inst_i_2_n_0\,
      I3 => \curr_pos[10]_i_4_n_0\,
      I4 => p_0_in(5),
      I5 => \curr_pos[10]_i_5_n_0\,
      O => cpos_mux(8)
    );
\curr_pos[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0C00A2A20C00"
    )
        port map (
      I0 => \curr_pos[10]_i_2_n_0\,
      I1 => p_0_in(5),
      I2 => \curr_pos[9]_i_2_n_0\,
      I3 => \curr_pos[10]_i_4_n_0\,
      I4 => p_0_in(6),
      I5 => \curr_pos[10]_i_5_n_0\,
      O => cpos_mux(9)
    );
\curr_pos[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => p_0_in(3),
      I1 => p_0_in(2),
      I2 => p_0_in(4),
      O => \curr_pos[9]_i_2_n_0\
    );
curr_pos_overflow_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00008000"
    )
        port map (
      I0 => curr_pos_overflow_i_2_n_0,
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => p_0_in(7),
      I4 => \curr_pos[10]_i_3_n_0\,
      I5 => curr_pos_overflow,
      O => curr_pos_overflow_i_1_n_0
    );
curr_pos_overflow_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE00000000000000"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(0),
      I1 => \curr_pos_reg[2]_0\(4),
      I2 => \curr_pos_reg[2]_0\(11),
      I3 => SHIFT_LEFT(2),
      I4 => SHIFT_LEFT(1),
      I5 => SHIFT_LEFT(3),
      O => curr_pos_overflow_i_2_n_0
    );
curr_pos_overflow_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => curr_pos_overflow_i_1_n_0,
      Q => curr_pos_overflow,
      R => '0'
    );
\curr_pos_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(0),
      Q => SHIFT_LEFT(1),
      R => '0'
    );
\curr_pos_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(10),
      Q => p_0_in(7),
      R => '0'
    );
\curr_pos_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(1),
      Q => SHIFT_LEFT(2),
      R => '0'
    );
\curr_pos_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(2),
      Q => SHIFT_LEFT(3),
      R => '0'
    );
\curr_pos_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(3),
      Q => p_0_in(0),
      R => '0'
    );
\curr_pos_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(4),
      Q => p_0_in(1),
      R => '0'
    );
\curr_pos_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(5),
      Q => p_0_in(2),
      R => '0'
    );
\curr_pos_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(6),
      Q => p_0_in(3),
      R => '0'
    );
\curr_pos_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(7),
      Q => p_0_in(4),
      R => '0'
    );
\curr_pos_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(8),
      Q => p_0_in(5),
      R => '0'
    );
\curr_pos_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(9),
      Q => p_0_in(6),
      R => '0'
    );
\nbytes_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_pos_reg[2]_0\(1),
      D => \curr_byte_reg[7]\(0),
      Q => nbytes(0),
      R => '0'
    );
\nbytes_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_pos_reg[2]_0\(1),
      D => \curr_byte_reg[7]\(1),
      Q => nbytes(1),
      R => '0'
    );
\nbytes_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_pos_reg[2]_0\(1),
      D => \curr_byte_reg[7]\(2),
      Q => nbytes(2),
      R => '0'
    );
\nbytes_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_pos_reg[2]_0\(1),
      D => \curr_byte_reg[7]\(3),
      Q => nbytes(3),
      R => '0'
    );
\nbytes_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_pos_reg[2]_0\(1),
      D => \curr_byte_reg[7]\(4),
      Q => nbytes(4),
      R => '0'
    );
\nbytes_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_pos_reg[2]_0\(1),
      D => \curr_byte_reg[7]\(5),
      Q => nbytes(5),
      R => '0'
    );
\nbytes_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_pos_reg[2]_0\(1),
      D => \curr_byte_reg[7]\(6),
      Q => nbytes(6),
      R => '0'
    );
\nbytes_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \curr_pos_reg[2]_0\(1),
      D => \curr_byte_reg[7]\(7),
      Q => nbytes(7),
      R => '0'
    );
\o_address_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(3),
      I1 => \curr_pos_reg[2]_0\(9),
      I2 => p_0_in(0),
      O => o_address_OBUF(0)
    );
\o_address_OBUF[10]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => p_0_in(6),
      I1 => p_0_in(5),
      I2 => \o_address_OBUF[10]_inst_i_2_n_0\,
      I3 => \curr_pos_reg[2]_0\(9),
      I4 => p_0_in(7),
      O => o_address_OBUF(10)
    );
\o_address_OBUF[10]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8880"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      I4 => p_0_in(4),
      O => \o_address_OBUF[10]_inst_i_2_n_0\
    );
\o_address_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => p_0_in(0),
      I1 => \curr_pos_reg[2]_0\(9),
      I2 => p_0_in(1),
      O => o_address_OBUF(1)
    );
\o_address_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C3AA"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => \curr_pos_reg[2]_0\(9),
      O => o_address_OBUF(2)
    );
\o_address_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => p_0_in(3),
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => \curr_pos_reg[2]_0\(9),
      I4 => p_0_in(2),
      O => o_address_OBUF(3)
    );
\o_address_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => p_0_in(4),
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => \curr_pos_reg[2]_0\(9),
      I5 => p_0_in(3),
      O => o_address_OBUF(4)
    );
\o_address_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C03F00FFAAAAAAAA"
    )
        port map (
      I0 => p_0_in(5),
      I1 => p_0_in(3),
      I2 => p_0_in(2),
      I3 => p_0_in(4),
      I4 => \o_address_OBUF[6]_inst_i_3_n_0\,
      I5 => \curr_pos_reg[2]_0\(9),
      O => o_address_OBUF(5)
    );
\o_address_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF3000CFAAAAAAAA"
    )
        port map (
      I0 => p_0_in(6),
      I1 => \o_address_OBUF[6]_inst_i_2_n_0\,
      I2 => \o_address_OBUF[6]_inst_i_3_n_0\,
      I3 => p_0_in(4),
      I4 => p_0_in(5),
      I5 => \curr_pos_reg[2]_0\(9),
      O => o_address_OBUF(6)
    );
\o_address_OBUF[6]_inst_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      O => \o_address_OBUF[6]_inst_i_2_n_0\
    );
\o_address_OBUF[6]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      O => \o_address_OBUF[6]_inst_i_3_n_0\
    );
\o_address_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => p_0_in(7),
      I1 => p_0_in(4),
      I2 => \o_address_OBUF[8]_inst_i_2_n_0\,
      I3 => p_0_in(5),
      I4 => \curr_pos_reg[2]_0\(9),
      I5 => p_0_in(6),
      O => o_address_OBUF(7)
    );
\o_address_OBUF[8]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCC800000004"
    )
        port map (
      I0 => p_0_in(4),
      I1 => \curr_pos_reg[2]_0\(9),
      I2 => \o_address_OBUF[8]_inst_i_2_n_0\,
      I3 => p_0_in(6),
      I4 => p_0_in(5),
      I5 => p_0_in(7),
      O => o_address_OBUF(8)
    );
\o_address_OBUF[8]_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(3),
      I3 => p_0_in(2),
      O => \o_address_OBUF[8]_inst_i_2_n_0\
    );
\o_address_OBUF[9]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => p_0_in(7),
      I1 => p_0_in(5),
      I2 => p_0_in(6),
      I3 => \o_address_OBUF[9]_inst_i_2_n_0\,
      O => o_address_OBUF(9)
    );
\o_address_OBUF[9]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0444044404444444"
    )
        port map (
      I0 => p_0_in(4),
      I1 => \curr_pos_reg[2]_0\(9),
      I2 => p_0_in(2),
      I3 => p_0_in(3),
      I4 => p_0_in(0),
      I5 => p_0_in(1),
      O => \o_address_OBUF[9]_inst_i_2_n_0\
    );
\outbuff[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(10),
      I1 => \curr_pos_reg[2]_0\(0),
      O => outbuff0
    );
\outbuff[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(8),
      I1 => \curr_pos_reg[2]_0\(7),
      O => outbuff_load
    );
\outbuff[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \curr_pos_reg[2]_0\(11),
      I1 => \curr_pos_reg[2]_0\(9),
      I2 => \curr_pos_reg[2]_0\(10),
      I3 => \curr_pos_reg[2]_0\(8),
      O => \^fsm_onehot_curr_state_reg[13]\
    );
\outbuff_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => outbuff_load,
      D => SM_n_7,
      Q => \^q\(0),
      R => outbuff0
    );
\outbuff_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => outbuff_load,
      D => SM_n_6,
      Q => \^q\(1),
      R => outbuff0
    );
\outbuff_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => outbuff_load,
      D => SM_n_5,
      Q => \^q\(2),
      R => outbuff0
    );
\outbuff_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => outbuff_load,
      D => SM_n_4,
      Q => \^q\(3),
      R => outbuff0
    );
\outbuff_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => outbuff_load,
      D => SM_n_3,
      Q => \^q\(4),
      R => outbuff0
    );
\outbuff_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => outbuff_load,
      D => SM_n_2,
      Q => \^q\(5),
      R => outbuff0
    );
\outbuff_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => outbuff_load,
      D => SM_n_1,
      Q => \^q\(6),
      R => outbuff0
    );
\outbuff_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => outbuff_load,
      D => SM_n_0,
      Q => \^q\(7),
      R => outbuff0
    );
seq_end1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => seq_end1_carry_n_0,
      CO(2) => seq_end1_carry_n_1,
      CO(1) => seq_end1_carry_n_2,
      CO(0) => seq_end1_carry_n_3,
      CYINIT => '0',
      DI(3) => seq_end1_carry_i_1_n_0,
      DI(2) => seq_end1_carry_i_2_n_0,
      DI(1) => seq_end1_carry_i_3_n_0,
      DI(0) => seq_end1_carry_i_4_n_0,
      O(3 downto 0) => NLW_seq_end1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => seq_end1_carry_i_5_n_0,
      S(2) => seq_end1_carry_i_6_n_0,
      S(1) => seq_end1_carry_i_7_n_0,
      S(0) => seq_end1_carry_i_8_n_0
    );
seq_end1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => p_0_in(7),
      I1 => nbytes(7),
      I2 => p_0_in(6),
      I3 => nbytes(6),
      O => seq_end1_carry_i_1_n_0
    );
seq_end1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => p_0_in(5),
      I1 => nbytes(5),
      I2 => p_0_in(4),
      I3 => nbytes(4),
      O => seq_end1_carry_i_2_n_0
    );
seq_end1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20BA"
    )
        port map (
      I0 => p_0_in(3),
      I1 => nbytes(2),
      I2 => p_0_in(2),
      I3 => nbytes(3),
      O => seq_end1_carry_i_3_n_0
    );
seq_end1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20BA"
    )
        port map (
      I0 => p_0_in(1),
      I1 => nbytes(0),
      I2 => p_0_in(0),
      I3 => nbytes(1),
      O => seq_end1_carry_i_4_n_0
    );
seq_end1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => nbytes(7),
      I1 => p_0_in(7),
      I2 => nbytes(6),
      I3 => p_0_in(6),
      O => seq_end1_carry_i_5_n_0
    );
seq_end1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => nbytes(5),
      I1 => p_0_in(5),
      I2 => nbytes(4),
      I3 => p_0_in(4),
      O => seq_end1_carry_i_6_n_0
    );
seq_end1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8421"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      I2 => nbytes(2),
      I3 => nbytes(3),
      O => seq_end1_carry_i_7_n_0
    );
seq_end1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8421"
    )
        port map (
      I0 => nbytes(1),
      I1 => nbytes(0),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      O => seq_end1_carry_i_8_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity project_reti_logiche is
  port (
    i_clk : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_start : in STD_LOGIC;
    i_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_address : out STD_LOGIC_VECTOR ( 15 downto 0 );
    o_done : out STD_LOGIC;
    o_en : out STD_LOGIC;
    o_we : out STD_LOGIC;
    o_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of project_reti_logiche : entity is true;
end project_reti_logiche;

architecture STRUCTURE of project_reti_logiche is
  signal DP_n_0 : STD_LOGIC;
  signal DP_n_20 : STD_LOGIC;
  signal DP_n_21 : STD_LOGIC;
  signal DP_n_22 : STD_LOGIC;
  signal DP_n_23 : STD_LOGIC;
  signal DP_n_24 : STD_LOGIC;
  signal DP_n_25 : STD_LOGIC;
  signal \FSM_onehot_curr_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[13]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[13]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[10]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[12]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[13]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[7]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[9]\ : STD_LOGIC;
  signal i_clk_IBUF : STD_LOGIC;
  signal i_clk_IBUF_BUFG : STD_LOGIC;
  signal i_data_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i_rst_IBUF : STD_LOGIC;
  signal i_start_IBUF : STD_LOGIC;
  signal nbytes_load : STD_LOGIC;
  signal o_address_OBUF : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal o_data_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_done_OBUF : STD_LOGIC;
  signal o_we_OBUF : STD_LOGIC;
  signal sm_rst : STD_LOGIC;
  signal sr_ena : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[0]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[10]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[11]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[12]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[13]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[1]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[2]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[3]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[4]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[5]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[7]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[8]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[9]\ : label is "s_sm:00000100000000,s_rb:00000000010000,s_rnb:00000000000100,s_done:00000000100000,s_swb:00000010000000,s_init:1100,s_swnb:00000000001000,s_rst:00000000000010,s_sinit:00000000000001,s_rstob:01000000000000,s_fin:10000000000000,s_w1:00010000000000,s_wb:00100000000000,iSTATE:00000001000000,s_w0:00001000000000";
begin
DP: entity work.datapath
     port map (
      CLK => i_clk_IBUF_BUFG,
      D(5) => DP_n_20,
      D(4) => DP_n_21,
      D(3) => DP_n_22,
      D(2) => DP_n_23,
      D(1) => DP_n_24,
      D(0) => DP_n_25,
      \FSM_onehot_curr_state_reg[13]\ => DP_n_0,
      Q(7 downto 0) => o_data_OBUF(7 downto 0),
      \curr_byte_reg[7]\(7 downto 0) => i_data_IBUF(7 downto 0),
      \curr_pos_reg[2]_0\(11) => \FSM_onehot_curr_state_reg_n_0_[13]\,
      \curr_pos_reg[2]_0\(10) => \FSM_onehot_curr_state_reg_n_0_[12]\,
      \curr_pos_reg[2]_0\(9) => o_we_OBUF,
      \curr_pos_reg[2]_0\(8) => \FSM_onehot_curr_state_reg_n_0_[10]\,
      \curr_pos_reg[2]_0\(7) => \FSM_onehot_curr_state_reg_n_0_[9]\,
      \curr_pos_reg[2]_0\(6) => sr_ena,
      \curr_pos_reg[2]_0\(5) => \FSM_onehot_curr_state_reg_n_0_[7]\,
      \curr_pos_reg[2]_0\(4) => o_done_OBUF,
      \curr_pos_reg[2]_0\(3) => \FSM_onehot_curr_state_reg_n_0_[4]\,
      \curr_pos_reg[2]_0\(2) => \FSM_onehot_curr_state_reg_n_0_[3]\,
      \curr_pos_reg[2]_0\(1) => nbytes_load,
      \curr_pos_reg[2]_0\(0) => sm_rst,
      o_address_OBUF(10 downto 0) => o_address_OBUF(10 downto 0)
    );
\FSM_onehot_curr_state[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => o_done_OBUF,
      I1 => i_start_IBUF,
      O => \FSM_onehot_curr_state[0]_i_1_n_0\
    );
\FSM_onehot_curr_state[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_curr_state[13]_i_3_n_0\,
      I1 => nbytes_load,
      I2 => \FSM_onehot_curr_state_reg_n_0_[7]\,
      I3 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => sm_rst,
      O => \FSM_onehot_curr_state[13]_i_1_n_0\
    );
\FSM_onehot_curr_state[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFB8"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      I1 => i_start_IBUF,
      I2 => o_done_OBUF,
      I3 => sr_ena,
      I4 => DP_n_0,
      I5 => \FSM_onehot_curr_state_reg_n_0_[9]\,
      O => \FSM_onehot_curr_state[13]_i_3_n_0\
    );
\FSM_onehot_curr_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      D => \FSM_onehot_curr_state[0]_i_1_n_0\,
      PRE => i_rst_IBUF,
      Q => \FSM_onehot_curr_state_reg_n_0_[0]\
    );
\FSM_onehot_curr_state_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => \FSM_onehot_curr_state_reg_n_0_[9]\,
      Q => \FSM_onehot_curr_state_reg_n_0_[10]\
    );
\FSM_onehot_curr_state_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => DP_n_21,
      Q => o_we_OBUF
    );
\FSM_onehot_curr_state_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => o_we_OBUF,
      Q => \FSM_onehot_curr_state_reg_n_0_[12]\
    );
\FSM_onehot_curr_state_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => DP_n_20,
      Q => \FSM_onehot_curr_state_reg_n_0_[13]\
    );
\FSM_onehot_curr_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => \FSM_onehot_curr_state_reg_n_0_[0]\,
      Q => sm_rst
    );
\FSM_onehot_curr_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => sm_rst,
      Q => nbytes_load
    );
\FSM_onehot_curr_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => DP_n_25,
      Q => \FSM_onehot_curr_state_reg_n_0_[3]\
    );
\FSM_onehot_curr_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => DP_n_24,
      Q => \FSM_onehot_curr_state_reg_n_0_[4]\
    );
\FSM_onehot_curr_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => DP_n_23,
      Q => o_done_OBUF
    );
\FSM_onehot_curr_state_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => DP_n_22,
      Q => \FSM_onehot_curr_state_reg_n_0_[7]\
    );
\FSM_onehot_curr_state_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => \FSM_onehot_curr_state_reg_n_0_[7]\,
      Q => sr_ena
    );
\FSM_onehot_curr_state_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[13]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => sr_ena,
      Q => \FSM_onehot_curr_state_reg_n_0_[9]\
    );
i_clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_clk_IBUF,
      O => i_clk_IBUF_BUFG
    );
i_clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_clk,
      O => i_clk_IBUF
    );
\i_data_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(0),
      O => i_data_IBUF(0)
    );
\i_data_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(1),
      O => i_data_IBUF(1)
    );
\i_data_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(2),
      O => i_data_IBUF(2)
    );
\i_data_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(3),
      O => i_data_IBUF(3)
    );
\i_data_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(4),
      O => i_data_IBUF(4)
    );
\i_data_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(5),
      O => i_data_IBUF(5)
    );
\i_data_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(6),
      O => i_data_IBUF(6)
    );
\i_data_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(7),
      O => i_data_IBUF(7)
    );
i_rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_rst,
      O => i_rst_IBUF
    );
i_start_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_start,
      O => i_start_IBUF
    );
\o_address_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(0),
      O => o_address(0)
    );
\o_address_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(10),
      O => o_address(10)
    );
\o_address_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_address(11)
    );
\o_address_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_address(12)
    );
\o_address_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_address(13)
    );
\o_address_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_address(14)
    );
\o_address_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_address(15)
    );
\o_address_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(1),
      O => o_address(1)
    );
\o_address_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(2),
      O => o_address(2)
    );
\o_address_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(3),
      O => o_address(3)
    );
\o_address_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(4),
      O => o_address(4)
    );
\o_address_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(5),
      O => o_address(5)
    );
\o_address_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(6),
      O => o_address(6)
    );
\o_address_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(7),
      O => o_address(7)
    );
\o_address_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(8),
      O => o_address(8)
    );
\o_address_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(9),
      O => o_address(9)
    );
\o_data_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(0),
      O => o_data(0)
    );
\o_data_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(1),
      O => o_data(1)
    );
\o_data_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(2),
      O => o_data(2)
    );
\o_data_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(3),
      O => o_data(3)
    );
\o_data_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(4),
      O => o_data(4)
    );
\o_data_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(5),
      O => o_data(5)
    );
\o_data_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(6),
      O => o_data(6)
    );
\o_data_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(7),
      O => o_data(7)
    );
o_done_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_done_OBUF,
      O => o_done
    );
o_en_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => o_en
    );
o_we_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_we_OBUF,
      O => o_we
    );
end STRUCTURE;
