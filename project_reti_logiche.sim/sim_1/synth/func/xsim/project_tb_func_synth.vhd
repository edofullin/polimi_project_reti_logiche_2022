-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Thu Mar 24 21:20:07 2022
-- Host        : edoardo-fedora running 64-bit unknown
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/edoardo/Code/polimi_project_reti_logiche_2022/project_reti_logiche.sim/sim_1/synth/func/xsim/project_tb_func_synth.vhd
-- Design      : project_reti_logiche
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity datapath is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \curr_pos_reg[9]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CLK : in STD_LOGIC
  );
end datapath;

architecture STRUCTURE of datapath is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal cpos_mux : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal \curr_pos[10]_i_2_n_0\ : STD_LOGIC;
  signal \curr_pos[6]_i_2_n_0\ : STD_LOGIC;
  signal \curr_pos[7]_i_2_n_0\ : STD_LOGIC;
  signal \curr_pos[8]_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \curr_pos[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \curr_pos[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \curr_pos[7]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \curr_pos[8]_i_2\ : label is "soft_lutpair0";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\curr_pos[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0111111110000000"
    )
        port map (
      I0 => \curr_pos_reg[9]_0\(2),
      I1 => \curr_pos_reg[9]_0\(0),
      I2 => \curr_pos[10]_i_2_n_0\,
      I3 => \^q\(6),
      I4 => \curr_pos_reg[9]_0\(1),
      I5 => \^q\(7),
      O => cpos_mux(10)
    );
\curr_pos[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^q\(4),
      O => \curr_pos[10]_i_2_n_0\
    );
\curr_pos[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0110"
    )
        port map (
      I0 => \curr_pos_reg[9]_0\(2),
      I1 => \curr_pos_reg[9]_0\(0),
      I2 => \curr_pos_reg[9]_0\(1),
      I3 => \^q\(0),
      O => cpos_mux(3)
    );
\curr_pos[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111000"
    )
        port map (
      I0 => \curr_pos_reg[9]_0\(2),
      I1 => \curr_pos_reg[9]_0\(0),
      I2 => \^q\(0),
      I3 => \curr_pos_reg[9]_0\(1),
      I4 => \^q\(1),
      O => cpos_mux(4)
    );
\curr_pos[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0111111110000000"
    )
        port map (
      I0 => \curr_pos_reg[9]_0\(2),
      I1 => \curr_pos_reg[9]_0\(0),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \curr_pos_reg[9]_0\(1),
      I5 => \^q\(2),
      O => cpos_mux(5)
    );
\curr_pos[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111000"
    )
        port map (
      I0 => \curr_pos_reg[9]_0\(2),
      I1 => \curr_pos_reg[9]_0\(0),
      I2 => \curr_pos[6]_i_2_n_0\,
      I3 => \curr_pos_reg[9]_0\(1),
      I4 => \^q\(3),
      O => cpos_mux(6)
    );
\curr_pos[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => \curr_pos[6]_i_2_n_0\
    );
\curr_pos[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111000"
    )
        port map (
      I0 => \curr_pos_reg[9]_0\(2),
      I1 => \curr_pos_reg[9]_0\(0),
      I2 => \curr_pos[7]_i_2_n_0\,
      I3 => \curr_pos_reg[9]_0\(1),
      I4 => \^q\(4),
      O => cpos_mux(7)
    );
\curr_pos[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      O => \curr_pos[7]_i_2_n_0\
    );
\curr_pos[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111000"
    )
        port map (
      I0 => \curr_pos_reg[9]_0\(2),
      I1 => \curr_pos_reg[9]_0\(0),
      I2 => \curr_pos[8]_i_2_n_0\,
      I3 => \curr_pos_reg[9]_0\(1),
      I4 => \^q\(5),
      O => cpos_mux(8)
    );
\curr_pos[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      O => \curr_pos[8]_i_2_n_0\
    );
\curr_pos[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111000"
    )
        port map (
      I0 => \curr_pos_reg[9]_0\(2),
      I1 => \curr_pos_reg[9]_0\(0),
      I2 => \curr_pos[10]_i_2_n_0\,
      I3 => \curr_pos_reg[9]_0\(1),
      I4 => \^q\(6),
      O => cpos_mux(9)
    );
\curr_pos_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => cpos_mux(10),
      Q => \^q\(7),
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
      Q => \^q\(0),
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
      Q => \^q\(1),
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
      Q => \^q\(2),
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
      Q => \^q\(3),
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
      Q => \^q\(4),
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
      Q => \^q\(5),
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
      Q => \^q\(6),
      R => '0'
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
  signal \FSM_onehot_curr_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[3]\ : STD_LOGIC;
  signal i_clk_IBUF : STD_LOGIC;
  signal i_clk_IBUF_BUFG : STD_LOGIC;
  signal i_rst_IBUF : STD_LOGIC;
  signal i_start_IBUF : STD_LOGIC;
  signal nbytes_load : STD_LOGIC;
  signal o_address_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_done_OBUF : STD_LOGIC;
  signal outbuff_load : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[0]\ : label is "s4:00000100000000,s3:00000000010000,s2:00000000000100,s_done:00000000100000,s_s2:00000010000000,s_init:1100,s_s1:00000000001000,s1:00000000000010,s0:00000000000001,s9:01000000000000,s7:10000000000000,s6:00010000000000,s8:00100000000000,iSTATE:00000001000000,s5:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[1]\ : label is "s4:00000100000000,s3:00000000010000,s2:00000000000100,s_done:00000000100000,s_s2:00000010000000,s_init:1100,s_s1:00000000001000,s1:00000000000010,s0:00000000000001,s9:01000000000000,s7:10000000000000,s6:00010000000000,s8:00100000000000,iSTATE:00000001000000,s5:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[2]\ : label is "s4:00000100000000,s3:00000000010000,s2:00000000000100,s_done:00000000100000,s_s2:00000010000000,s_init:1100,s_s1:00000000001000,s1:00000000000010,s0:00000000000001,s9:01000000000000,s7:10000000000000,s6:00010000000000,s8:00100000000000,iSTATE:00000001000000,s5:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[3]\ : label is "s4:00000100000000,s3:00000000010000,s2:00000000000100,s_done:00000000100000,s_s2:00000010000000,s_init:1100,s_s1:00000000001000,s1:00000000000010,s0:00000000000001,s9:01000000000000,s7:10000000000000,s6:00010000000000,s8:00100000000000,iSTATE:00000001000000,s5:00001000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[5]\ : label is "s4:00000100000000,s3:00000000010000,s2:00000000000100,s_done:00000000100000,s_s2:00000010000000,s_init:1100,s_s1:00000000001000,s1:00000000000010,s0:00000000000001,s9:01000000000000,s7:10000000000000,s6:00010000000000,s8:00100000000000,iSTATE:00000001000000,s5:00001000000000";
begin
DP: entity work.datapath
     port map (
      CLK => i_clk_IBUF_BUFG,
      Q(7 downto 0) => o_address_OBUF(7 downto 0),
      \curr_pos_reg[9]_0\(2) => o_done_OBUF,
      \curr_pos_reg[9]_0\(1) => nbytes_load,
      \curr_pos_reg[9]_0\(0) => outbuff_load
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
\FSM_onehot_curr_state[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEAE"
    )
        port map (
      I0 => outbuff_load,
      I1 => o_done_OBUF,
      I2 => i_start_IBUF,
      I3 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      I4 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I5 => nbytes_load,
      O => \FSM_onehot_curr_state[5]_i_1_n_0\
    );
\FSM_onehot_curr_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[5]_i_1_n_0\,
      D => \FSM_onehot_curr_state[0]_i_1_n_0\,
      PRE => i_rst_IBUF,
      Q => \FSM_onehot_curr_state_reg_n_0_[0]\
    );
\FSM_onehot_curr_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[5]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => \FSM_onehot_curr_state_reg_n_0_[0]\,
      Q => outbuff_load
    );
\FSM_onehot_curr_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[5]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => outbuff_load,
      Q => nbytes_load
    );
\FSM_onehot_curr_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[5]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => nbytes_load,
      Q => \FSM_onehot_curr_state_reg_n_0_[3]\
    );
\FSM_onehot_curr_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_onehot_curr_state[5]_i_1_n_0\,
      CLR => i_rst_IBUF,
      D => \FSM_onehot_curr_state_reg_n_0_[3]\,
      Q => o_done_OBUF
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
      I => '0',
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
      I => '0',
      O => o_address(8)
    );
\o_address_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_address(9)
    );
\o_data_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_data(0)
    );
\o_data_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_data(1)
    );
\o_data_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_data(2)
    );
\o_data_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_data(3)
    );
\o_data_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_data(4)
    );
\o_data_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_data(5)
    );
\o_data_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_data(6)
    );
\o_data_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
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
      I => '0',
      O => o_we
    );
end STRUCTURE;
