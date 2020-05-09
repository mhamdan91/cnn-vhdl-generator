-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Thu May  7 19:26:07 2020
-- Host        : Jr-Mhamdan running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/Users/mhamdan/Google Drive/PhD
--               classes/My_other_stuff/cnn_vhdl_generator/generated_model/Vivado/tiny_model.sim/sim_1/synth/func/xsim/conv_layer_tb_func_synth.vhd}
-- Design      : CONV_LAYER_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FC_LAYER_4 is
  port (
    \DOUT_1_1[4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    RST_IBUF : in STD_LOGIC;
    CLK_IBUF_BUFG : in STD_LOGIC;
    EN_NXT_LYR_3_reg : in STD_LOGIC;
    EN_STREAM_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \DOUT_BUF_3_3_reg[4]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \DOUT_BUF_2_3_reg[4]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \DOUT_BUF_1_3_reg[4]\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end FC_LAYER_4;

architecture STRUCTURE of FC_LAYER_4 is
  signal BIAS_1 : STD_LOGIC;
  signal \BIAS_1[0]_i_1_n_0\ : STD_LOGIC;
  signal \BIAS_1[1]_i_1_n_0\ : STD_LOGIC;
  signal \BIAS_1[2]_i_1_n_0\ : STD_LOGIC;
  signal \BIAS_1[3]_i_1_n_0\ : STD_LOGIC;
  signal \BIAS_1[4]_i_2_n_0\ : STD_LOGIC;
  signal BIAS_2 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \DOUT_BUF_1_4[4]_i_3_n_0\ : STD_LOGIC;
  signal \DOUT_BUF_1_4[4]_i_4_n_0\ : STD_LOGIC;
  signal DOUT_BUF_2_4 : STD_LOGIC;
  signal EN_SUM_MULT_1 : STD_LOGIC;
  signal EN_SUM_MULT_2 : STD_LOGIC;
  signal EN_SUM_MULT_23_out : STD_LOGIC;
  signal EN_SUM_MULT_2_i_1_n_0 : STD_LOGIC;
  signal Enable_BIAS : STD_LOGIC;
  signal Enable_BIAS_i_1_n_0 : STD_LOGIC;
  signal Enable_BIAS_reg_n_0 : STD_LOGIC;
  signal Enable_ReLU : STD_LOGIC;
  signal Enable_ReLU_i_1_n_0 : STD_LOGIC;
  signal INTERNAL_RST0 : STD_LOGIC;
  signal \MULTS_1_1[0][0]_i_1_n_0\ : STD_LOGIC;
  signal \MULTS_1_1[0][1]_i_1_n_0\ : STD_LOGIC;
  signal \MULTS_1_1[0][4]_i_1_n_0\ : STD_LOGIC;
  signal \MULTS_1_1_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \MULTS_1_1_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \MULTS_1_1_reg_n_0_[0][4]\ : STD_LOGIC;
  signal \MULTS_1_2[0][4]_i_2_n_0\ : STD_LOGIC;
  signal \MULTS_1_2_reg[0]\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \MULTS_2_1[0][0]_i_1_n_0\ : STD_LOGIC;
  signal \MULTS_2_1[0][1]_i_1_n_0\ : STD_LOGIC;
  signal \MULTS_2_1[0][2]_i_1_n_0\ : STD_LOGIC;
  signal \MULTS_2_1[0][3]_i_1_n_0\ : STD_LOGIC;
  signal \MULTS_2_1[0][4]_i_2_n_0\ : STD_LOGIC;
  signal \MULTS_2_1_reg[0]\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \MULT_1_reg[0]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \MULT_2_reg[0]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \MULT_3_reg[0]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \MULT_4_reg[0]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal OUT_PIXEL_COUNT : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[1]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[2]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[0]\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[1]\ : STD_LOGIC;
  signal SIG_STRIDE : STD_LOGIC;
  signal SIG_STRIDE0 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \SIG_STRIDE[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \SIG_STRIDE[4]_i_1_n_0\ : STD_LOGIC;
  signal \SIG_STRIDE_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal VALID_NXTLYR_PIX : STD_LOGIC;
  signal VALID_NXTLYR_PIX1 : STD_LOGIC;
  signal \VALID_NXTLYR_PIX[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \VALID_NXTLYR_PIX_reg_n_0_[0]\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BIAS_1[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \BIAS_1[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \BIAS_1[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \BIAS_1[4]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \DOUT_BUF_1_4[4]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \MULTS_1_1[0][1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \MULTS_1_1[0][4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \MULTS_1_2[0][1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \MULTS_1_2[0][4]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \MULTS_2_1[0][0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \MULTS_2_1[0][1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \SIG_STRIDE[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \SIG_STRIDE[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \SIG_STRIDE[4]_i_3\ : label is "soft_lutpair0";
begin
\BIAS_1[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \MULTS_2_1_reg[0]\(0),
      O => \BIAS_1[0]_i_1_n_0\
    );
\BIAS_1[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \MULTS_2_1_reg[0]\(0),
      I1 => \MULTS_2_1_reg[0]\(1),
      O => \BIAS_1[1]_i_1_n_0\
    );
\BIAS_1[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \MULTS_2_1_reg[0]\(0),
      I1 => \MULTS_2_1_reg[0]\(1),
      I2 => \MULTS_2_1_reg[0]\(2),
      O => \BIAS_1[2]_i_1_n_0\
    );
\BIAS_1[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \MULTS_2_1_reg[0]\(1),
      I1 => \MULTS_2_1_reg[0]\(0),
      I2 => \MULTS_2_1_reg[0]\(2),
      I3 => \MULTS_2_1_reg[0]\(3),
      O => \BIAS_1[3]_i_1_n_0\
    );
\BIAS_1[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Enable_BIAS_reg_n_0,
      I1 => EN_NXT_LYR_3_reg,
      I2 => EN_STREAM_IBUF,
      I3 => INTERNAL_RST0,
      O => BIAS_1
    );
\BIAS_1[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \MULTS_2_1_reg[0]\(2),
      I1 => \MULTS_2_1_reg[0]\(0),
      I2 => \MULTS_2_1_reg[0]\(1),
      I3 => \MULTS_2_1_reg[0]\(3),
      I4 => \MULTS_2_1_reg[0]\(4),
      O => \BIAS_1[4]_i_2_n_0\
    );
\BIAS_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => BIAS_1,
      D => \BIAS_1[0]_i_1_n_0\,
      Q => BIAS_2(0),
      R => RST_IBUF
    );
\BIAS_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => BIAS_1,
      D => \BIAS_1[1]_i_1_n_0\,
      Q => BIAS_2(1),
      R => RST_IBUF
    );
\BIAS_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => BIAS_1,
      D => \BIAS_1[2]_i_1_n_0\,
      Q => BIAS_2(2),
      R => RST_IBUF
    );
\BIAS_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => BIAS_1,
      D => \BIAS_1[3]_i_1_n_0\,
      Q => BIAS_2(3),
      R => RST_IBUF
    );
\BIAS_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => BIAS_1,
      D => \BIAS_1[4]_i_2_n_0\,
      Q => BIAS_2(4),
      R => RST_IBUF
    );
\DOUT_BUF_1_4[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAABAAAAAAA"
    )
        port map (
      I0 => RST_IBUF,
      I1 => \DOUT_BUF_1_4[4]_i_3_n_0\,
      I2 => Enable_ReLU,
      I3 => EN_NXT_LYR_3_reg,
      I4 => EN_STREAM_IBUF,
      I5 => INTERNAL_RST0,
      O => DOUT_BUF_2_4
    );
\DOUT_BUF_1_4[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Enable_ReLU,
      I1 => EN_NXT_LYR_3_reg,
      I2 => EN_STREAM_IBUF,
      I3 => INTERNAL_RST0,
      O => VALID_NXTLYR_PIX
    );
\DOUT_BUF_1_4[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFFE"
    )
        port map (
      I0 => BIAS_2(3),
      I1 => BIAS_2(2),
      I2 => BIAS_2(1),
      I3 => BIAS_2(0),
      I4 => BIAS_2(4),
      I5 => \DOUT_BUF_1_4[4]_i_4_n_0\,
      O => \DOUT_BUF_1_4[4]_i_3_n_0\
    );
\DOUT_BUF_1_4[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(0),
      I1 => \SIG_STRIDE_reg__0\(3),
      I2 => \SIG_STRIDE_reg__0\(4),
      I3 => \SIG_STRIDE_reg__0\(1),
      I4 => \SIG_STRIDE_reg__0\(2),
      O => \DOUT_BUF_1_4[4]_i_4_n_0\
    );
\DOUT_BUF_1_4_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => BIAS_2(0),
      Q => \DOUT_1_1[4]\(0),
      R => DOUT_BUF_2_4
    );
\DOUT_BUF_1_4_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => BIAS_2(1),
      Q => \DOUT_1_1[4]\(1),
      R => DOUT_BUF_2_4
    );
\DOUT_BUF_1_4_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => BIAS_2(2),
      Q => \DOUT_1_1[4]\(2),
      R => DOUT_BUF_2_4
    );
\DOUT_BUF_1_4_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => BIAS_2(3),
      Q => \DOUT_1_1[4]\(3),
      R => DOUT_BUF_2_4
    );
\DOUT_BUF_1_4_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => BIAS_2(4),
      Q => \DOUT_1_1[4]\(4),
      R => DOUT_BUF_2_4
    );
EN_SUM_MULT_1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => EN_NXT_LYR_3_reg,
      I1 => EN_STREAM_IBUF,
      I2 => INTERNAL_RST0,
      O => VALID_NXTLYR_PIX1
    );
EN_SUM_MULT_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => VALID_NXTLYR_PIX1,
      Q => EN_SUM_MULT_1,
      R => RST_IBUF
    );
EN_SUM_MULT_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => INTERNAL_RST0,
      I1 => EN_STREAM_IBUF,
      I2 => EN_NXT_LYR_3_reg,
      I3 => EN_SUM_MULT_1,
      I4 => EN_SUM_MULT_2,
      O => EN_SUM_MULT_2_i_1_n_0
    );
EN_SUM_MULT_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => EN_SUM_MULT_2_i_1_n_0,
      Q => EN_SUM_MULT_2,
      R => RST_IBUF
    );
Enable_BIAS_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => INTERNAL_RST0,
      I1 => EN_STREAM_IBUF,
      I2 => EN_NXT_LYR_3_reg,
      I3 => EN_SUM_MULT_2,
      I4 => Enable_BIAS_reg_n_0,
      O => Enable_BIAS_i_1_n_0
    );
Enable_BIAS_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => Enable_BIAS_i_1_n_0,
      Q => Enable_BIAS_reg_n_0,
      R => RST_IBUF
    );
Enable_ReLU_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => INTERNAL_RST0,
      I1 => EN_STREAM_IBUF,
      I2 => EN_NXT_LYR_3_reg,
      I3 => Enable_BIAS_reg_n_0,
      I4 => Enable_ReLU,
      O => Enable_ReLU_i_1_n_0
    );
Enable_ReLU_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => Enable_ReLU_i_1_n_0,
      Q => Enable_ReLU,
      R => RST_IBUF
    );
\MULTS_1_1[0][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \MULT_1_reg[0]\(3),
      I1 => \MULT_2_reg[0]\(3),
      O => \MULTS_1_1[0][0]_i_1_n_0\
    );
\MULTS_1_1[0][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \MULT_1_reg[0]\(3),
      I1 => \MULT_2_reg[0]\(3),
      I2 => \MULT_2_reg[0]\(4),
      I3 => \MULT_1_reg[0]\(4),
      O => \MULTS_1_1[0][1]_i_1_n_0\
    );
\MULTS_1_1[0][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8EEE"
    )
        port map (
      I0 => \MULT_2_reg[0]\(4),
      I1 => \MULT_1_reg[0]\(4),
      I2 => \MULT_1_reg[0]\(3),
      I3 => \MULT_2_reg[0]\(3),
      O => \MULTS_1_1[0][4]_i_1_n_0\
    );
\MULTS_1_1_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => EN_SUM_MULT_23_out,
      D => \MULTS_1_1[0][0]_i_1_n_0\,
      Q => \MULTS_1_1_reg_n_0_[0][0]\,
      R => RST_IBUF
    );
\MULTS_1_1_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => EN_SUM_MULT_23_out,
      D => \MULTS_1_1[0][1]_i_1_n_0\,
      Q => \MULTS_1_1_reg_n_0_[0][1]\,
      R => RST_IBUF
    );
\MULTS_1_1_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => EN_SUM_MULT_23_out,
      D => \MULTS_1_1[0][4]_i_1_n_0\,
      Q => \MULTS_1_1_reg_n_0_[0][4]\,
      R => RST_IBUF
    );
\MULTS_1_2[0][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \MULT_3_reg[0]\(3),
      I1 => \MULT_4_reg[0]\(3),
      O => plusOp(0)
    );
\MULTS_1_2[0][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \MULT_3_reg[0]\(3),
      I1 => \MULT_4_reg[0]\(3),
      I2 => \MULT_4_reg[0]\(4),
      I3 => \MULT_3_reg[0]\(4),
      O => plusOp(1)
    );
\MULTS_1_2[0][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => EN_SUM_MULT_1,
      I1 => EN_NXT_LYR_3_reg,
      I2 => EN_STREAM_IBUF,
      I3 => INTERNAL_RST0,
      O => EN_SUM_MULT_23_out
    );
\MULTS_1_2[0][4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8EEE"
    )
        port map (
      I0 => \MULT_4_reg[0]\(4),
      I1 => \MULT_3_reg[0]\(4),
      I2 => \MULT_3_reg[0]\(3),
      I3 => \MULT_4_reg[0]\(3),
      O => \MULTS_1_2[0][4]_i_2_n_0\
    );
\MULTS_1_2_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => EN_SUM_MULT_23_out,
      D => plusOp(0),
      Q => \MULTS_1_2_reg[0]\(0),
      R => RST_IBUF
    );
\MULTS_1_2_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => EN_SUM_MULT_23_out,
      D => plusOp(1),
      Q => \MULTS_1_2_reg[0]\(1),
      R => RST_IBUF
    );
\MULTS_1_2_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => EN_SUM_MULT_23_out,
      D => \MULTS_1_2[0][4]_i_2_n_0\,
      Q => \MULTS_1_2_reg[0]\(4),
      R => RST_IBUF
    );
\MULTS_2_1[0][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \MULTS_1_1_reg_n_0_[0][0]\,
      I1 => \MULTS_1_2_reg[0]\(0),
      O => \MULTS_2_1[0][0]_i_1_n_0\
    );
\MULTS_2_1[0][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \MULTS_1_1_reg_n_0_[0][0]\,
      I1 => \MULTS_1_2_reg[0]\(0),
      I2 => \MULTS_1_2_reg[0]\(1),
      I3 => \MULTS_1_1_reg_n_0_[0][1]\,
      O => \MULTS_2_1[0][1]_i_1_n_0\
    );
\MULTS_2_1[0][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880077F077FF880"
    )
        port map (
      I0 => \MULTS_1_2_reg[0]\(0),
      I1 => \MULTS_1_1_reg_n_0_[0][0]\,
      I2 => \MULTS_1_1_reg_n_0_[0][1]\,
      I3 => \MULTS_1_2_reg[0]\(1),
      I4 => \MULTS_1_2_reg[0]\(4),
      I5 => \MULTS_1_1_reg_n_0_[0][4]\,
      O => \MULTS_2_1[0][2]_i_1_n_0\
    );
\MULTS_2_1[0][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF177717770000"
    )
        port map (
      I0 => \MULTS_1_2_reg[0]\(1),
      I1 => \MULTS_1_1_reg_n_0_[0][1]\,
      I2 => \MULTS_1_1_reg_n_0_[0][0]\,
      I3 => \MULTS_1_2_reg[0]\(0),
      I4 => \MULTS_1_2_reg[0]\(4),
      I5 => \MULTS_1_1_reg_n_0_[0][4]\,
      O => \MULTS_2_1[0][3]_i_1_n_0\
    );
\MULTS_2_1[0][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => EN_SUM_MULT_2,
      I1 => EN_NXT_LYR_3_reg,
      I2 => EN_STREAM_IBUF,
      I3 => INTERNAL_RST0,
      O => Enable_BIAS
    );
\MULTS_2_1[0][4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF077F077F0000"
    )
        port map (
      I0 => \MULTS_1_2_reg[0]\(0),
      I1 => \MULTS_1_1_reg_n_0_[0][0]\,
      I2 => \MULTS_1_1_reg_n_0_[0][1]\,
      I3 => \MULTS_1_2_reg[0]\(1),
      I4 => \MULTS_1_2_reg[0]\(4),
      I5 => \MULTS_1_1_reg_n_0_[0][4]\,
      O => \MULTS_2_1[0][4]_i_2_n_0\
    );
\MULTS_2_1_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS,
      D => \MULTS_2_1[0][0]_i_1_n_0\,
      Q => \MULTS_2_1_reg[0]\(0),
      R => RST_IBUF
    );
\MULTS_2_1_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS,
      D => \MULTS_2_1[0][1]_i_1_n_0\,
      Q => \MULTS_2_1_reg[0]\(1),
      R => RST_IBUF
    );
\MULTS_2_1_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS,
      D => \MULTS_2_1[0][2]_i_1_n_0\,
      Q => \MULTS_2_1_reg[0]\(2),
      R => RST_IBUF
    );
\MULTS_2_1_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS,
      D => \MULTS_2_1[0][3]_i_1_n_0\,
      Q => \MULTS_2_1_reg[0]\(3),
      R => RST_IBUF
    );
\MULTS_2_1_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS,
      D => \MULTS_2_1[0][4]_i_2_n_0\,
      Q => \MULTS_2_1_reg[0]\(4),
      R => RST_IBUF
    );
\MULT_1_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => \DOUT_BUF_1_3_reg[4]\(0),
      Q => \MULT_1_reg[0]\(3),
      R => RST_IBUF
    );
\MULT_1_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => \DOUT_BUF_1_3_reg[4]\(1),
      Q => \MULT_1_reg[0]\(4),
      R => RST_IBUF
    );
\MULT_2_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => \DOUT_BUF_2_3_reg[4]\(0),
      Q => \MULT_2_reg[0]\(3),
      R => RST_IBUF
    );
\MULT_2_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => \DOUT_BUF_2_3_reg[4]\(1),
      Q => \MULT_2_reg[0]\(4),
      R => RST_IBUF
    );
\MULT_3_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => \DOUT_BUF_3_3_reg[4]\(0),
      Q => \MULT_3_reg[0]\(3),
      R => RST_IBUF
    );
\MULT_3_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => \DOUT_BUF_3_3_reg[4]\(1),
      Q => \MULT_3_reg[0]\(4),
      R => RST_IBUF
    );
\MULT_4_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => Q(0),
      Q => \MULT_4_reg[0]\(3),
      R => RST_IBUF
    );
\MULT_4_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX1,
      D => Q(1),
      Q => \MULT_4_reg[0]\(4),
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => OUT_PIXEL_COUNT,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      O => \OUT_PIXEL_COUNT[0]_i_1_n_0\
    );
\OUT_PIXEL_COUNT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I1 => OUT_PIXEL_COUNT,
      I2 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      O => \OUT_PIXEL_COUNT[1]_i_1_n_0\
    );
\OUT_PIXEL_COUNT[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I2 => OUT_PIXEL_COUNT,
      I3 => INTERNAL_RST0,
      O => \OUT_PIXEL_COUNT[2]_i_1_n_0\
    );
\OUT_PIXEL_COUNT[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
        port map (
      I0 => VALID_NXTLYR_PIX,
      I1 => \SIG_STRIDE_reg__0\(2),
      I2 => \SIG_STRIDE_reg__0\(1),
      I3 => \SIG_STRIDE_reg__0\(4),
      I4 => \SIG_STRIDE_reg__0\(3),
      I5 => \SIG_STRIDE_reg__0\(0),
      O => OUT_PIXEL_COUNT
    );
\OUT_PIXEL_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[0]_i_1_n_0\,
      Q => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[1]_i_1_n_0\,
      Q => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[2]_i_1_n_0\,
      Q => INTERNAL_RST0,
      R => RST_IBUF
    );
\SIG_STRIDE[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(0),
      O => SIG_STRIDE0(0)
    );
\SIG_STRIDE[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(0),
      I1 => \SIG_STRIDE_reg__0\(1),
      O => \SIG_STRIDE[1]_i_1__0_n_0\
    );
\SIG_STRIDE[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(0),
      I1 => \SIG_STRIDE_reg__0\(1),
      I2 => \SIG_STRIDE_reg__0\(2),
      O => SIG_STRIDE0(2)
    );
\SIG_STRIDE[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(3),
      I1 => \SIG_STRIDE_reg__0\(1),
      I2 => \SIG_STRIDE_reg__0\(2),
      I3 => \SIG_STRIDE_reg__0\(0),
      O => SIG_STRIDE0(3)
    );
\SIG_STRIDE[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF8000"
    )
        port map (
      I0 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      I1 => Enable_ReLU,
      I2 => EN_NXT_LYR_3_reg,
      I3 => EN_STREAM_IBUF,
      I4 => INTERNAL_RST0,
      I5 => RST_IBUF,
      O => \SIG_STRIDE[4]_i_1_n_0\
    );
\SIG_STRIDE[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => VALID_NXTLYR_PIX,
      I1 => \SIG_STRIDE_reg__0\(3),
      I2 => \SIG_STRIDE_reg__0\(4),
      I3 => \SIG_STRIDE_reg__0\(1),
      I4 => \SIG_STRIDE_reg__0\(2),
      O => SIG_STRIDE
    );
\SIG_STRIDE[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(4),
      I1 => \SIG_STRIDE_reg__0\(3),
      I2 => \SIG_STRIDE_reg__0\(0),
      I3 => \SIG_STRIDE_reg__0\(2),
      I4 => \SIG_STRIDE_reg__0\(1),
      O => SIG_STRIDE0(4)
    );
\SIG_STRIDE_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => SIG_STRIDE0(0),
      Q => \SIG_STRIDE_reg__0\(0),
      S => \SIG_STRIDE[4]_i_1_n_0\
    );
\SIG_STRIDE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => \SIG_STRIDE[1]_i_1__0_n_0\,
      Q => \SIG_STRIDE_reg__0\(1),
      R => \SIG_STRIDE[4]_i_1_n_0\
    );
\SIG_STRIDE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => SIG_STRIDE0(2),
      Q => \SIG_STRIDE_reg__0\(2),
      R => \SIG_STRIDE[4]_i_1_n_0\
    );
\SIG_STRIDE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => SIG_STRIDE0(3),
      Q => \SIG_STRIDE_reg__0\(3),
      R => \SIG_STRIDE[4]_i_1_n_0\
    );
\SIG_STRIDE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => SIG_STRIDE0(4),
      Q => \SIG_STRIDE_reg__0\(4),
      R => \SIG_STRIDE[4]_i_1_n_0\
    );
\VALID_NXTLYR_PIX[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF4000"
    )
        port map (
      I0 => INTERNAL_RST0,
      I1 => EN_STREAM_IBUF,
      I2 => EN_NXT_LYR_3_reg,
      I3 => Enable_ReLU,
      I4 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      O => \VALID_NXTLYR_PIX[0]_i_1__0_n_0\
    );
\VALID_NXTLYR_PIX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \VALID_NXTLYR_PIX[0]_i_1__0_n_0\,
      Q => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      R => RST_IBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Flatten_LAYER_3 is
  port (
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    RST_IBUF : in STD_LOGIC;
    CLK_IBUF_BUFG : in STD_LOGIC;
    EN_STREAM_IBUF : in STD_LOGIC;
    EN_NXT_LYR_2 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end Flatten_LAYER_3;

architecture STRUCTURE of Flatten_LAYER_3 is
  signal DOUT_BUF_1_3 : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal DOUT_BUF_2_3 : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal DOUT_BUF_3_3 : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal DOUT_BUF_4_3 : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal EN_NXT_LYR_30 : STD_LOGIC;
  signal EN_NXT_LYR_3_i_1_n_0 : STD_LOGIC;
  signal EN_NXT_LYR_3_i_2_n_0 : STD_LOGIC;
  signal EN_NXT_LYR_3_i_3_n_0 : STD_LOGIC;
  signal EN_NXT_LYR_3_reg_n_0 : STD_LOGIC;
  signal Enable_ONEHOT : STD_LOGIC;
  signal Enable_ONEHOT_i_1_n_0 : STD_LOGIC;
  signal FRST_TIM_EN_3 : STD_LOGIC;
  signal FRST_TIM_EN_3_i_1_n_0 : STD_LOGIC;
  signal OUT_PIXEL_COUNT : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[1]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[2]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[2]_i_3_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[0]\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[1]\ : STD_LOGIC;
  signal PIXEL_COUNT1 : STD_LOGIC;
  signal \PIXEL_COUNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \PIXEL_COUNT[1]_i_1_n_0\ : STD_LOGIC;
  signal \PIXEL_COUNT[2]_i_1_n_0\ : STD_LOGIC;
  signal \PIXEL_COUNT_reg_n_0_[0]\ : STD_LOGIC;
  signal \PIXEL_COUNT_reg_n_0_[1]\ : STD_LOGIC;
  signal \PIXEL_COUNT_reg_n_0_[2]\ : STD_LOGIC;
  signal SIG_STRIDE : STD_LOGIC;
  signal \SIG_STRIDE0__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \SIG_STRIDE[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \SIG_STRIDE[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \SIG_STRIDE_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal VALID_NXTLYR_PIX : STD_LOGIC;
  signal \VALID_NXTLYR_PIX[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \VALID_NXTLYR_PIX_reg_n_0_[0]\ : STD_LOGIC;
  signal \WINDOW_1_reg[0,0]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \WINDOW_1_reg[0,1]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \WINDOW_1_reg[1,0]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \WINDOW_1_reg[1,1]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of EN_NXT_LYR_3_i_3 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of FRST_TIM_EN_3_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[2]_i_2__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[2]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \SIG_STRIDE[0]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \SIG_STRIDE[2]_i_1__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \SIG_STRIDE[3]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \SIG_STRIDE[4]_i_3__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \VALID_NXTLYR_PIX[0]_i_1__1\ : label is "soft_lutpair9";
begin
\DOUT_BUF_1_3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \WINDOW_1_reg[0,0]\(3),
      Q => DOUT_BUF_1_3(3),
      R => RST_IBUF
    );
\DOUT_BUF_1_3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \WINDOW_1_reg[0,0]\(4),
      Q => DOUT_BUF_1_3(4),
      R => RST_IBUF
    );
\DOUT_BUF_2_3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \WINDOW_1_reg[0,1]\(3),
      Q => DOUT_BUF_2_3(3),
      R => RST_IBUF
    );
\DOUT_BUF_2_3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \WINDOW_1_reg[0,1]\(4),
      Q => DOUT_BUF_2_3(4),
      R => RST_IBUF
    );
\DOUT_BUF_3_3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \WINDOW_1_reg[1,0]\(3),
      Q => DOUT_BUF_3_3(3),
      R => RST_IBUF
    );
\DOUT_BUF_3_3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \WINDOW_1_reg[1,0]\(4),
      Q => DOUT_BUF_3_3(4),
      R => RST_IBUF
    );
\DOUT_BUF_4_3[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Enable_ONEHOT,
      I1 => EN_STREAM_IBUF,
      I2 => EN_NXT_LYR_2,
      I3 => EN_NXT_LYR_30,
      O => VALID_NXTLYR_PIX
    );
\DOUT_BUF_4_3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \WINDOW_1_reg[1,1]\(3),
      Q => DOUT_BUF_4_3(3),
      R => RST_IBUF
    );
\DOUT_BUF_4_3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \WINDOW_1_reg[1,1]\(4),
      Q => DOUT_BUF_4_3(4),
      R => RST_IBUF
    );
EN_NXT_LYR_3_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDFDDDFDDDFDDD0"
    )
        port map (
      I0 => EN_NXT_LYR_3_i_2_n_0,
      I1 => EN_NXT_LYR_30,
      I2 => Enable_ONEHOT,
      I3 => EN_NXT_LYR_3_i_3_n_0,
      I4 => FRST_TIM_EN_3,
      I5 => EN_NXT_LYR_3_reg_n_0,
      O => EN_NXT_LYR_3_i_1_n_0
    );
EN_NXT_LYR_3_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFBFFFFFFFBF"
    )
        port map (
      I0 => EN_NXT_LYR_30,
      I1 => EN_NXT_LYR_2,
      I2 => EN_STREAM_IBUF,
      I3 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      I4 => \OUT_PIXEL_COUNT[2]_i_3_n_0\,
      I5 => \SIG_STRIDE_reg__0\(0),
      O => EN_NXT_LYR_3_i_2_n_0
    );
EN_NXT_LYR_3_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => EN_NXT_LYR_30,
      I1 => EN_NXT_LYR_2,
      I2 => EN_STREAM_IBUF,
      O => EN_NXT_LYR_3_i_3_n_0
    );
EN_NXT_LYR_3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => EN_NXT_LYR_3_i_1_n_0,
      Q => EN_NXT_LYR_3_reg_n_0,
      R => RST_IBUF
    );
Enable_ONEHOT_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF1000"
    )
        port map (
      I0 => EN_NXT_LYR_3_i_3_n_0,
      I1 => \PIXEL_COUNT_reg_n_0_[2]\,
      I2 => \PIXEL_COUNT_reg_n_0_[1]\,
      I3 => \PIXEL_COUNT_reg_n_0_[0]\,
      I4 => Enable_ONEHOT,
      O => Enable_ONEHOT_i_1_n_0
    );
Enable_ONEHOT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => Enable_ONEHOT_i_1_n_0,
      Q => Enable_ONEHOT,
      R => RST_IBUF
    );
FC_LYR_4: entity work.FC_LAYER_4
     port map (
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      \DOUT_1_1[4]\(4 downto 0) => Q(4 downto 0),
      \DOUT_BUF_1_3_reg[4]\(1 downto 0) => DOUT_BUF_1_3(4 downto 3),
      \DOUT_BUF_2_3_reg[4]\(1 downto 0) => DOUT_BUF_2_3(4 downto 3),
      \DOUT_BUF_3_3_reg[4]\(1 downto 0) => DOUT_BUF_3_3(4 downto 3),
      EN_NXT_LYR_3_reg => EN_NXT_LYR_3_reg_n_0,
      EN_STREAM_IBUF => EN_STREAM_IBUF,
      Q(1 downto 0) => DOUT_BUF_4_3(4 downto 3),
      RST_IBUF => RST_IBUF
    );
FRST_TIM_EN_3_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => OUT_PIXEL_COUNT,
      I1 => FRST_TIM_EN_3,
      O => FRST_TIM_EN_3_i_1_n_0
    );
FRST_TIM_EN_3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => FRST_TIM_EN_3_i_1_n_0,
      Q => FRST_TIM_EN_3,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => OUT_PIXEL_COUNT,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      O => \OUT_PIXEL_COUNT[0]_i_1_n_0\
    );
\OUT_PIXEL_COUNT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I1 => OUT_PIXEL_COUNT,
      I2 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      O => \OUT_PIXEL_COUNT[1]_i_1_n_0\
    );
\OUT_PIXEL_COUNT[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I2 => OUT_PIXEL_COUNT,
      I3 => EN_NXT_LYR_30,
      O => \OUT_PIXEL_COUNT[2]_i_1_n_0\
    );
\OUT_PIXEL_COUNT[2]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000008A"
    )
        port map (
      I0 => Enable_ONEHOT,
      I1 => \SIG_STRIDE_reg__0\(0),
      I2 => \OUT_PIXEL_COUNT[2]_i_3_n_0\,
      I3 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      I4 => EN_NXT_LYR_3_i_3_n_0,
      O => OUT_PIXEL_COUNT
    );
\OUT_PIXEL_COUNT[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(4),
      I1 => \SIG_STRIDE_reg__0\(3),
      I2 => \SIG_STRIDE_reg__0\(2),
      I3 => \SIG_STRIDE_reg__0\(1),
      O => \OUT_PIXEL_COUNT[2]_i_3_n_0\
    );
\OUT_PIXEL_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[0]_i_1_n_0\,
      Q => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[1]_i_1_n_0\,
      Q => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[2]_i_1_n_0\,
      Q => EN_NXT_LYR_30,
      R => RST_IBUF
    );
\PIXEL_COUNT[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFBFBF40404040"
    )
        port map (
      I0 => EN_NXT_LYR_30,
      I1 => EN_NXT_LYR_2,
      I2 => EN_STREAM_IBUF,
      I3 => \PIXEL_COUNT_reg_n_0_[2]\,
      I4 => \PIXEL_COUNT_reg_n_0_[1]\,
      I5 => \PIXEL_COUNT_reg_n_0_[0]\,
      O => \PIXEL_COUNT[0]_i_1_n_0\
    );
\PIXEL_COUNT[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCC6ECCCCCC"
    )
        port map (
      I0 => \PIXEL_COUNT_reg_n_0_[0]\,
      I1 => \PIXEL_COUNT_reg_n_0_[1]\,
      I2 => \PIXEL_COUNT_reg_n_0_[2]\,
      I3 => EN_STREAM_IBUF,
      I4 => EN_NXT_LYR_2,
      I5 => EN_NXT_LYR_30,
      O => \PIXEL_COUNT[1]_i_1_n_0\
    );
\PIXEL_COUNT[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F070F0F0F0"
    )
        port map (
      I0 => \PIXEL_COUNT_reg_n_0_[0]\,
      I1 => \PIXEL_COUNT_reg_n_0_[1]\,
      I2 => \PIXEL_COUNT_reg_n_0_[2]\,
      I3 => EN_STREAM_IBUF,
      I4 => EN_NXT_LYR_2,
      I5 => EN_NXT_LYR_30,
      O => \PIXEL_COUNT[2]_i_1_n_0\
    );
\PIXEL_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \PIXEL_COUNT[0]_i_1_n_0\,
      Q => \PIXEL_COUNT_reg_n_0_[0]\,
      R => RST_IBUF
    );
\PIXEL_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \PIXEL_COUNT[1]_i_1_n_0\,
      Q => \PIXEL_COUNT_reg_n_0_[1]\,
      R => RST_IBUF
    );
\PIXEL_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \PIXEL_COUNT[2]_i_1_n_0\,
      Q => \PIXEL_COUNT_reg_n_0_[2]\,
      R => RST_IBUF
    );
\SIG_STRIDE[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(0),
      O => \SIG_STRIDE0__0\(0)
    );
\SIG_STRIDE[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(0),
      I1 => \SIG_STRIDE_reg__0\(1),
      O => \SIG_STRIDE[1]_i_1__1_n_0\
    );
\SIG_STRIDE[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(0),
      I1 => \SIG_STRIDE_reg__0\(1),
      I2 => \SIG_STRIDE_reg__0\(2),
      O => \SIG_STRIDE0__0\(2)
    );
\SIG_STRIDE[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(3),
      I1 => \SIG_STRIDE_reg__0\(1),
      I2 => \SIG_STRIDE_reg__0\(2),
      I3 => \SIG_STRIDE_reg__0\(0),
      O => \SIG_STRIDE0__0\(3)
    );
\SIG_STRIDE[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF8000"
    )
        port map (
      I0 => Enable_ONEHOT,
      I1 => EN_STREAM_IBUF,
      I2 => EN_NXT_LYR_2,
      I3 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      I4 => EN_NXT_LYR_30,
      I5 => RST_IBUF,
      O => \SIG_STRIDE[4]_i_1__0_n_0\
    );
\SIG_STRIDE[4]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => VALID_NXTLYR_PIX,
      I1 => \SIG_STRIDE_reg__0\(1),
      I2 => \SIG_STRIDE_reg__0\(2),
      I3 => \SIG_STRIDE_reg__0\(3),
      I4 => \SIG_STRIDE_reg__0\(4),
      O => SIG_STRIDE
    );
\SIG_STRIDE[4]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(4),
      I1 => \SIG_STRIDE_reg__0\(3),
      I2 => \SIG_STRIDE_reg__0\(0),
      I3 => \SIG_STRIDE_reg__0\(2),
      I4 => \SIG_STRIDE_reg__0\(1),
      O => \SIG_STRIDE0__0\(4)
    );
\SIG_STRIDE_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => \SIG_STRIDE0__0\(0),
      Q => \SIG_STRIDE_reg__0\(0),
      S => \SIG_STRIDE[4]_i_1__0_n_0\
    );
\SIG_STRIDE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => \SIG_STRIDE[1]_i_1__1_n_0\,
      Q => \SIG_STRIDE_reg__0\(1),
      R => \SIG_STRIDE[4]_i_1__0_n_0\
    );
\SIG_STRIDE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => \SIG_STRIDE0__0\(2),
      Q => \SIG_STRIDE_reg__0\(2),
      R => \SIG_STRIDE[4]_i_1__0_n_0\
    );
\SIG_STRIDE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => \SIG_STRIDE0__0\(3),
      Q => \SIG_STRIDE_reg__0\(3),
      R => \SIG_STRIDE[4]_i_1__0_n_0\
    );
\SIG_STRIDE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => SIG_STRIDE,
      D => \SIG_STRIDE0__0\(4),
      Q => \SIG_STRIDE_reg__0\(4),
      R => \SIG_STRIDE[4]_i_1__0_n_0\
    );
\VALID_NXTLYR_PIX[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF4000"
    )
        port map (
      I0 => EN_NXT_LYR_30,
      I1 => EN_NXT_LYR_2,
      I2 => EN_STREAM_IBUF,
      I3 => Enable_ONEHOT,
      I4 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      O => \VALID_NXTLYR_PIX[0]_i_1__1_n_0\
    );
\VALID_NXTLYR_PIX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \VALID_NXTLYR_PIX[0]_i_1__1_n_0\,
      Q => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      R => RST_IBUF
    );
\WINDOW_1[0,0][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => EN_STREAM_IBUF,
      I1 => EN_NXT_LYR_2,
      I2 => EN_NXT_LYR_30,
      O => PIXEL_COUNT1
    );
\WINDOW_1_reg[0,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => D(0),
      Q => \WINDOW_1_reg[0,0]\(3),
      R => RST_IBUF
    );
\WINDOW_1_reg[0,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => D(1),
      Q => \WINDOW_1_reg[0,0]\(4),
      R => RST_IBUF
    );
\WINDOW_1_reg[0,1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_1_reg[0,0]\(3),
      Q => \WINDOW_1_reg[0,1]\(3),
      R => RST_IBUF
    );
\WINDOW_1_reg[0,1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_1_reg[0,0]\(4),
      Q => \WINDOW_1_reg[0,1]\(4),
      R => RST_IBUF
    );
\WINDOW_1_reg[1,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_1_reg[0,1]\(3),
      Q => \WINDOW_1_reg[1,0]\(3),
      R => RST_IBUF
    );
\WINDOW_1_reg[1,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_1_reg[0,1]\(4),
      Q => \WINDOW_1_reg[1,0]\(4),
      R => RST_IBUF
    );
\WINDOW_1_reg[1,1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_1_reg[1,0]\(3),
      Q => \WINDOW_1_reg[1,1]\(3),
      R => RST_IBUF
    );
\WINDOW_1_reg[1,1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_1_reg[1,0]\(4),
      Q => \WINDOW_1_reg[1,1]\(4),
      R => RST_IBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity POOL_LAYER_2 is
  port (
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    RST_IBUF : in STD_LOGIC;
    CLK_IBUF_BUFG : in STD_LOGIC;
    EN_STREAM_IBUF : in STD_LOGIC;
    EN_NXT_LYR_1_reg : in STD_LOGIC;
    \DOUT_BUF_1_1_reg[4]\ : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
end POOL_LAYER_2;

architecture STRUCTURE of POOL_LAYER_2 is
  signal Async_Mode_1_1 : STD_LOGIC;
  signal DOUT_BUF_1_2 : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \DOUT_BUF_1_2[3]_i_1_n_0\ : STD_LOGIC;
  signal \DOUT_BUF_1_2[4]_i_1_n_0\ : STD_LOGIC;
  signal \DOUT_BUF_1_2[4]_i_2_n_0\ : STD_LOGIC;
  signal \DOUT_BUF_1_2[4]_i_3_n_0\ : STD_LOGIC;
  signal EN_NXT_LYR_2 : STD_LOGIC;
  signal EN_NXT_LYR_20 : STD_LOGIC;
  signal EN_NXT_LYR_2_i_1_n_0 : STD_LOGIC;
  signal EN_NXT_LYR_2_i_2_n_0 : STD_LOGIC;
  signal EN_NXT_LYR_2_i_3_n_0 : STD_LOGIC;
  signal EN_OUT_BUF : STD_LOGIC;
  signal EN_OUT_BUF4_out : STD_LOGIC;
  signal EN_OUT_BUF_i_1_n_0 : STD_LOGIC;
  signal Enable_MAX : STD_LOGIC;
  signal Enable_MAX_i_1_n_0 : STD_LOGIC;
  signal Enable_MX_2 : STD_LOGIC;
  signal Enable_MX_26_out : STD_LOGIC;
  signal Enable_MX_2_i_1_n_0 : STD_LOGIC;
  signal \FIFO_ROW_1_1[0]_0\ : STD_LOGIC;
  signal \FIFO_ROW_1_1[1]_1\ : STD_LOGIC;
  signal \FIFO_ROW_1_1[2]_2\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[0][4]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[1][4]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[2][3]\ : STD_LOGIC;
  signal \FIFO_ROW_1_1_reg_n_0_[2][4]\ : STD_LOGIC;
  signal FRST_TIM_EN_2_i_1_n_0 : STD_LOGIC;
  signal FRST_TIM_EN_2_reg_n_0 : STD_LOGIC;
  signal \HEAD_1_1[0]_i_1_n_0\ : STD_LOGIC;
  signal \HEAD_1_1[1]_i_1_n_0\ : STD_LOGIC;
  signal \HEAD_1_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \HEAD_1_1_reg_n_0_[1]\ : STD_LOGIC;
  signal \MAX_D_1[0,0][3]_i_1_n_0\ : STD_LOGIC;
  signal \MAX_D_1[0,0][3]_i_2_n_0\ : STD_LOGIC;
  signal \MAX_D_1[0,0][3]_i_3_n_0\ : STD_LOGIC;
  signal \MAX_D_1[0,0][4]_i_1_n_0\ : STD_LOGIC;
  signal \MAX_D_1[0,1][3]_i_1_n_0\ : STD_LOGIC;
  signal \MAX_D_1[0,1][3]_i_2_n_0\ : STD_LOGIC;
  signal \MAX_D_1[0,1][3]_i_3_n_0\ : STD_LOGIC;
  signal \MAX_D_1[0,1][4]_i_2_n_0\ : STD_LOGIC;
  signal \MAX_D_1_reg[0,_n_0_0][3]\ : STD_LOGIC;
  signal \MAX_D_1_reg[0,_n_0_0][4]\ : STD_LOGIC;
  signal \MAX_D_1_reg[0,_n_0_1][3]\ : STD_LOGIC;
  signal \MAX_D_1_reg[0,_n_0_1][4]\ : STD_LOGIC;
  signal \MAX_D_2[0,0][3]_i_1_n_0\ : STD_LOGIC;
  signal \MAX_D_2[0,0][4]_i_1_n_0\ : STD_LOGIC;
  signal \MAX_D_2[0,0][4]_i_2_n_0\ : STD_LOGIC;
  signal \MAX_D_2_reg[0,0]\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \OUT_PIXEL_COUNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[1]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT[2]_i_1_n_0\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[0]\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[1]\ : STD_LOGIC;
  signal \PIXEL_COUNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \PIXEL_COUNT[1]_i_1_n_0\ : STD_LOGIC;
  signal \PIXEL_COUNT[2]_i_1_n_0\ : STD_LOGIC;
  signal \PIXEL_COUNT_reg_n_0_[0]\ : STD_LOGIC;
  signal \PIXEL_COUNT_reg_n_0_[1]\ : STD_LOGIC;
  signal \PIXEL_COUNT_reg_n_0_[2]\ : STD_LOGIC;
  signal ReadEn_1_1_i_1_n_0 : STD_LOGIC;
  signal \SIG_STRIDE[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \SIG_STRIDE[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \SIG_STRIDE[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \SIG_STRIDE_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \SIG_STRIDE_reg_n_0_[0]\ : STD_LOGIC;
  signal \TAIL_1_1[0]_i_1_n_0\ : STD_LOGIC;
  signal \TAIL_1_1[1]_i_1_n_0\ : STD_LOGIC;
  signal \TAIL_1_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \TAIL_1_1_reg_n_0_[1]\ : STD_LOGIC;
  signal VALID_ROWS : STD_LOGIC;
  signal \VALID_ROWS[0]_i_1_n_0\ : STD_LOGIC;
  signal \VALID_ROWS[1]_i_1_n_0\ : STD_LOGIC;
  signal \VALID_ROWS[2]_i_1_n_0\ : STD_LOGIC;
  signal \VALID_ROWS[3]_i_1_n_0\ : STD_LOGIC;
  signal \VALID_ROWS[4]_i_2_n_0\ : STD_LOGIC;
  signal \VALID_ROWS_reg_n_0_[0]\ : STD_LOGIC;
  signal \VALID_ROWS_reg_n_0_[1]\ : STD_LOGIC;
  signal \VALID_ROWS_reg_n_0_[2]\ : STD_LOGIC;
  signal \VALID_ROWS_reg_n_0_[3]\ : STD_LOGIC;
  signal \VALID_ROWS_reg_n_0_[4]\ : STD_LOGIC;
  signal \WINDOW[0,2]\ : STD_LOGIC;
  signal \WINDOW[0,2][0]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[0,2][1]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[0,2][2]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[0,2][3]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[0,2][4]_i_2_n_0\ : STD_LOGIC;
  signal \WINDOW_reg[0,0]0\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][0]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][1]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][2]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][3]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][4]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][0]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][1]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][2]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][3]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][4]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_2][0]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_2][1]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_2][2]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_2][3]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_2][4]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_3][0]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_3][1]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_3][2]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_3][3]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_3][4]\ : STD_LOGIC;
  signal WriteEn_1_1 : STD_LOGIC;
  signal WriteEn_1_1_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of EN_NXT_LYR_2_i_2 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of EN_NXT_LYR_2_i_3 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of Enable_MX_2_i_1 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of FRST_TIM_EN_2_i_1 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \MAX_D_2[0,0][3]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \SIG_STRIDE[4]_i_3__1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \TAIL_1_1[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \TAIL_1_1[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \VALID_ROWS[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \VALID_ROWS[1]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \VALID_ROWS[2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \VALID_ROWS[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \VALID_ROWS[4]_i_2\ : label is "soft_lutpair14";
begin
\DOUT_BUF_1_2[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000CA0A"
    )
        port map (
      I0 => DOUT_BUF_1_2(3),
      I1 => \MAX_D_2_reg[0,0]\(3),
      I2 => VALID_ROWS,
      I3 => \DOUT_BUF_1_2[4]_i_2_n_0\,
      I4 => RST_IBUF,
      O => \DOUT_BUF_1_2[3]_i_1_n_0\
    );
\DOUT_BUF_1_2[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000CA0A"
    )
        port map (
      I0 => DOUT_BUF_1_2(4),
      I1 => \MAX_D_2_reg[0,0]\(4),
      I2 => VALID_ROWS,
      I3 => \DOUT_BUF_1_2[4]_i_2_n_0\,
      I4 => RST_IBUF,
      O => \DOUT_BUF_1_2[4]_i_1_n_0\
    );
\DOUT_BUF_1_2[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000007"
    )
        port map (
      I0 => \VALID_ROWS_reg_n_0_[1]\,
      I1 => \VALID_ROWS_reg_n_0_[0]\,
      I2 => \VALID_ROWS_reg_n_0_[2]\,
      I3 => \DOUT_BUF_1_2[4]_i_3_n_0\,
      I4 => \VALID_ROWS_reg_n_0_[3]\,
      I5 => \VALID_ROWS_reg_n_0_[4]\,
      O => \DOUT_BUF_1_2[4]_i_2_n_0\
    );
\DOUT_BUF_1_2[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \SIG_STRIDE_reg__0\(2),
      I1 => \SIG_STRIDE_reg__0\(1),
      I2 => \SIG_STRIDE_reg__0\(4),
      I3 => \SIG_STRIDE_reg__0\(3),
      O => \DOUT_BUF_1_2[4]_i_3_n_0\
    );
\DOUT_BUF_1_2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \DOUT_BUF_1_2[3]_i_1_n_0\,
      Q => DOUT_BUF_1_2(3),
      R => '0'
    );
\DOUT_BUF_1_2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \DOUT_BUF_1_2[4]_i_1_n_0\,
      Q => DOUT_BUF_1_2(4),
      R => '0'
    );
EN_NXT_LYR_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFEAAFFAAFEAA00"
    )
        port map (
      I0 => EN_NXT_LYR_20,
      I1 => \DOUT_BUF_1_2[4]_i_2_n_0\,
      I2 => EN_NXT_LYR_2_i_2_n_0,
      I3 => \MAX_D_2[0,0][4]_i_2_n_0\,
      I4 => EN_NXT_LYR_2_i_3_n_0,
      I5 => EN_NXT_LYR_2,
      O => EN_NXT_LYR_2_i_1_n_0
    );
EN_NXT_LYR_2_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => Enable_MAX,
      I1 => FRST_TIM_EN_2_reg_n_0,
      I2 => EN_OUT_BUF,
      O => EN_NXT_LYR_2_i_2_n_0
    );
EN_NXT_LYR_2_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => FRST_TIM_EN_2_reg_n_0,
      I1 => Enable_MAX,
      I2 => EN_OUT_BUF,
      O => EN_NXT_LYR_2_i_3_n_0
    );
EN_NXT_LYR_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => EN_NXT_LYR_2_i_1_n_0,
      Q => EN_NXT_LYR_2,
      R => RST_IBUF
    );
EN_OUT_BUF_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF08000000"
    )
        port map (
      I0 => EN_STREAM_IBUF,
      I1 => EN_NXT_LYR_1_reg,
      I2 => EN_NXT_LYR_20,
      I3 => Enable_MAX,
      I4 => Enable_MX_2,
      I5 => EN_OUT_BUF,
      O => EN_OUT_BUF_i_1_n_0
    );
EN_OUT_BUF_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => EN_OUT_BUF_i_1_n_0,
      Q => EN_OUT_BUF,
      R => RST_IBUF
    );
Enable_MAX_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0040"
    )
        port map (
      I0 => \TAIL_1_1_reg_n_0_[1]\,
      I1 => \TAIL_1_1_reg_n_0_[0]\,
      I2 => Async_Mode_1_1,
      I3 => \MAX_D_2[0,0][4]_i_2_n_0\,
      I4 => Enable_MAX,
      O => Enable_MAX_i_1_n_0
    );
Enable_MAX_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => Enable_MAX_i_1_n_0,
      Q => Enable_MAX,
      R => RST_IBUF
    );
Enable_MX_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAAAAA"
    )
        port map (
      I0 => Enable_MX_2,
      I1 => Enable_MAX,
      I2 => EN_NXT_LYR_20,
      I3 => EN_NXT_LYR_1_reg,
      I4 => EN_STREAM_IBUF,
      O => Enable_MX_2_i_1_n_0
    );
Enable_MX_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => Enable_MX_2_i_1_n_0,
      Q => Enable_MX_2,
      R => RST_IBUF
    );
\FIFO_ROW_1_1[0][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004000"
    )
        port map (
      I0 => \HEAD_1_1_reg_n_0_[0]\,
      I1 => WriteEn_1_1,
      I2 => EN_STREAM_IBUF,
      I3 => EN_NXT_LYR_1_reg,
      I4 => EN_NXT_LYR_20,
      I5 => \HEAD_1_1_reg_n_0_[1]\,
      O => \FIFO_ROW_1_1[0]_0\
    );
\FIFO_ROW_1_1[1][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \HEAD_1_1_reg_n_0_[0]\,
      I1 => WriteEn_1_1,
      I2 => EN_STREAM_IBUF,
      I3 => EN_NXT_LYR_1_reg,
      I4 => EN_NXT_LYR_20,
      I5 => \HEAD_1_1_reg_n_0_[1]\,
      O => \FIFO_ROW_1_1[1]_1\
    );
\FIFO_ROW_1_1[2][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => EN_NXT_LYR_20,
      I1 => EN_NXT_LYR_1_reg,
      I2 => EN_STREAM_IBUF,
      I3 => WriteEn_1_1,
      I4 => \HEAD_1_1_reg_n_0_[1]\,
      I5 => \HEAD_1_1_reg_n_0_[0]\,
      O => \FIFO_ROW_1_1[2]_2\
    );
\FIFO_ROW_1_1_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[0]_0\,
      D => \WINDOW_reg[0,_n_0_1][0]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[0][0]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[0]_0\,
      D => \WINDOW_reg[0,_n_0_1][1]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[0][1]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[0]_0\,
      D => \WINDOW_reg[0,_n_0_1][2]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[0][2]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[0]_0\,
      D => \WINDOW_reg[0,_n_0_1][3]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[0][3]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[0]_0\,
      D => \WINDOW_reg[0,_n_0_1][4]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[0][4]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[1]_1\,
      D => \WINDOW_reg[0,_n_0_1][0]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[1][0]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[1]_1\,
      D => \WINDOW_reg[0,_n_0_1][1]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[1][1]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[1]_1\,
      D => \WINDOW_reg[0,_n_0_1][2]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[1][2]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[1]_1\,
      D => \WINDOW_reg[0,_n_0_1][3]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[1][3]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[1]_1\,
      D => \WINDOW_reg[0,_n_0_1][4]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[1][4]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[2]_2\,
      D => \WINDOW_reg[0,_n_0_1][0]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[2][0]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[2]_2\,
      D => \WINDOW_reg[0,_n_0_1][1]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[2][1]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[2]_2\,
      D => \WINDOW_reg[0,_n_0_1][2]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[2][2]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[2]_2\,
      D => \WINDOW_reg[0,_n_0_1][3]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[2][3]\,
      R => RST_IBUF
    );
\FIFO_ROW_1_1_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1_1[2]_2\,
      D => \WINDOW_reg[0,_n_0_1][4]\,
      Q => \FIFO_ROW_1_1_reg_n_0_[2][4]\,
      R => RST_IBUF
    );
FRST_TIM_EN_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => VALID_ROWS,
      I1 => \DOUT_BUF_1_2[4]_i_2_n_0\,
      I2 => FRST_TIM_EN_2_reg_n_0,
      O => FRST_TIM_EN_2_i_1_n_0
    );
FRST_TIM_EN_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => FRST_TIM_EN_2_i_1_n_0,
      Q => FRST_TIM_EN_2_reg_n_0,
      R => RST_IBUF
    );
Flatten_LYR_3: entity work.Flatten_LAYER_3
     port map (
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      D(1 downto 0) => DOUT_BUF_1_2(4 downto 3),
      EN_NXT_LYR_2 => EN_NXT_LYR_2,
      EN_STREAM_IBUF => EN_STREAM_IBUF,
      Q(4 downto 0) => Q(4 downto 0),
      RST_IBUF => RST_IBUF
    );
\HEAD_1_1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF3FFF00004000"
    )
        port map (
      I0 => \HEAD_1_1_reg_n_0_[1]\,
      I1 => WriteEn_1_1,
      I2 => EN_STREAM_IBUF,
      I3 => EN_NXT_LYR_1_reg,
      I4 => EN_NXT_LYR_20,
      I5 => \HEAD_1_1_reg_n_0_[0]\,
      O => \HEAD_1_1[0]_i_1_n_0\
    );
\HEAD_1_1[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF3FFF00008000"
    )
        port map (
      I0 => \HEAD_1_1_reg_n_0_[0]\,
      I1 => WriteEn_1_1,
      I2 => EN_STREAM_IBUF,
      I3 => EN_NXT_LYR_1_reg,
      I4 => EN_NXT_LYR_20,
      I5 => \HEAD_1_1_reg_n_0_[1]\,
      O => \HEAD_1_1[1]_i_1_n_0\
    );
\HEAD_1_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \HEAD_1_1[0]_i_1_n_0\,
      Q => \HEAD_1_1_reg_n_0_[0]\,
      R => RST_IBUF
    );
\HEAD_1_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \HEAD_1_1[1]_i_1_n_0\,
      Q => \HEAD_1_1_reg_n_0_[1]\,
      R => RST_IBUF
    );
\MAX_D_1[0,0][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EECEAAAACCCCEECE"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_0][3]\,
      I1 => \WINDOW_reg[0,_n_0_1][3]\,
      I2 => \MAX_D_1[0,0][3]_i_2_n_0\,
      I3 => \MAX_D_1[0,0][3]_i_3_n_0\,
      I4 => \WINDOW_reg[0,_n_0_1][4]\,
      I5 => \WINDOW_reg[0,_n_0_0][4]\,
      O => \MAX_D_1[0,0][3]_i_1_n_0\
    );
\MAX_D_1[0,0][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDFD00F0FFFFDDFD"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_0][0]\,
      I1 => \WINDOW_reg[0,_n_0_1][0]\,
      I2 => \WINDOW_reg[0,_n_0_1][2]\,
      I3 => \WINDOW_reg[0,_n_0_0][2]\,
      I4 => \WINDOW_reg[0,_n_0_1][1]\,
      I5 => \WINDOW_reg[0,_n_0_0][1]\,
      O => \MAX_D_1[0,0][3]_i_2_n_0\
    );
\MAX_D_1[0,0][3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][3]\,
      I1 => \WINDOW_reg[0,_n_0_0][3]\,
      I2 => \WINDOW_reg[0,_n_0_1][2]\,
      I3 => \WINDOW_reg[0,_n_0_0][2]\,
      O => \MAX_D_1[0,0][3]_i_3_n_0\
    );
\MAX_D_1[0,0][4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][4]\,
      I1 => \WINDOW_reg[0,_n_0_0][4]\,
      O => \MAX_D_1[0,0][4]_i_1_n_0\
    );
\MAX_D_1[0,1][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EECEAAAACCCCEECE"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_2][3]\,
      I1 => \WINDOW_reg[0,_n_0_3][3]\,
      I2 => \MAX_D_1[0,1][3]_i_2_n_0\,
      I3 => \MAX_D_1[0,1][3]_i_3_n_0\,
      I4 => \WINDOW_reg[0,_n_0_3][4]\,
      I5 => \WINDOW_reg[0,_n_0_2][4]\,
      O => \MAX_D_1[0,1][3]_i_1_n_0\
    );
\MAX_D_1[0,1][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDFD00F0FFFFDDFD"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_2][0]\,
      I1 => \WINDOW_reg[0,_n_0_3][0]\,
      I2 => \WINDOW_reg[0,_n_0_3][2]\,
      I3 => \WINDOW_reg[0,_n_0_2][2]\,
      I4 => \WINDOW_reg[0,_n_0_3][1]\,
      I5 => \WINDOW_reg[0,_n_0_2][1]\,
      O => \MAX_D_1[0,1][3]_i_2_n_0\
    );
\MAX_D_1[0,1][3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_3][3]\,
      I1 => \WINDOW_reg[0,_n_0_2][3]\,
      I2 => \WINDOW_reg[0,_n_0_3][2]\,
      I3 => \WINDOW_reg[0,_n_0_2][2]\,
      O => \MAX_D_1[0,1][3]_i_3_n_0\
    );
\MAX_D_1[0,1][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => Enable_MAX,
      I1 => EN_NXT_LYR_20,
      I2 => EN_NXT_LYR_1_reg,
      I3 => EN_STREAM_IBUF,
      O => Enable_MX_26_out
    );
\MAX_D_1[0,1][4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_3][4]\,
      I1 => \WINDOW_reg[0,_n_0_2][4]\,
      O => \MAX_D_1[0,1][4]_i_2_n_0\
    );
\MAX_D_1_reg[0,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => \MAX_D_1[0,0][3]_i_1_n_0\,
      Q => \MAX_D_1_reg[0,_n_0_0][3]\,
      R => RST_IBUF
    );
\MAX_D_1_reg[0,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => \MAX_D_1[0,0][4]_i_1_n_0\,
      Q => \MAX_D_1_reg[0,_n_0_0][4]\,
      R => RST_IBUF
    );
\MAX_D_1_reg[0,1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => \MAX_D_1[0,1][3]_i_1_n_0\,
      Q => \MAX_D_1_reg[0,_n_0_1][3]\,
      R => RST_IBUF
    );
\MAX_D_1_reg[0,1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => \MAX_D_1[0,1][4]_i_2_n_0\,
      Q => \MAX_D_1_reg[0,_n_0_1][4]\,
      R => RST_IBUF
    );
\MAX_D_2[0,0][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBD0FFFFFBD00000"
    )
        port map (
      I0 => \MAX_D_1_reg[0,_n_0_0][4]\,
      I1 => \MAX_D_1_reg[0,_n_0_1][4]\,
      I2 => \MAX_D_1_reg[0,_n_0_1][3]\,
      I3 => \MAX_D_1_reg[0,_n_0_0][3]\,
      I4 => EN_OUT_BUF4_out,
      I5 => \MAX_D_2_reg[0,0]\(3),
      O => \MAX_D_2[0,0][3]_i_1_n_0\
    );
\MAX_D_2[0,0][3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => Enable_MX_2,
      I1 => Enable_MAX,
      I2 => EN_NXT_LYR_20,
      I3 => EN_NXT_LYR_1_reg,
      I4 => EN_STREAM_IBUF,
      O => EN_OUT_BUF4_out
    );
\MAX_D_2[0,0][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF0000E000"
    )
        port map (
      I0 => \MAX_D_1_reg[0,_n_0_1][4]\,
      I1 => \MAX_D_1_reg[0,_n_0_0][4]\,
      I2 => Enable_MX_2,
      I3 => Enable_MAX,
      I4 => \MAX_D_2[0,0][4]_i_2_n_0\,
      I5 => \MAX_D_2_reg[0,0]\(4),
      O => \MAX_D_2[0,0][4]_i_1_n_0\
    );
\MAX_D_2[0,0][4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => EN_NXT_LYR_20,
      I1 => EN_NXT_LYR_1_reg,
      I2 => EN_STREAM_IBUF,
      O => \MAX_D_2[0,0][4]_i_2_n_0\
    );
\MAX_D_2_reg[0,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \MAX_D_2[0,0][3]_i_1_n_0\,
      Q => \MAX_D_2_reg[0,0]\(3),
      R => RST_IBUF
    );
\MAX_D_2_reg[0,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \MAX_D_2[0,0][4]_i_1_n_0\,
      Q => \MAX_D_2_reg[0,0]\(4),
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => VALID_ROWS,
      I1 => \DOUT_BUF_1_2[4]_i_2_n_0\,
      I2 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      O => \OUT_PIXEL_COUNT[0]_i_1_n_0\
    );
\OUT_PIXEL_COUNT[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I1 => \DOUT_BUF_1_2[4]_i_2_n_0\,
      I2 => VALID_ROWS,
      I3 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      O => \OUT_PIXEL_COUNT[1]_i_1_n_0\
    );
\OUT_PIXEL_COUNT[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I2 => \DOUT_BUF_1_2[4]_i_2_n_0\,
      I3 => VALID_ROWS,
      I4 => EN_NXT_LYR_20,
      O => \OUT_PIXEL_COUNT[2]_i_1_n_0\
    );
\OUT_PIXEL_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[0]_i_1_n_0\,
      Q => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[1]_i_1_n_0\,
      Q => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \OUT_PIXEL_COUNT[2]_i_1_n_0\,
      Q => EN_NXT_LYR_20,
      R => RST_IBUF
    );
\PIXEL_COUNT[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF40404040"
    )
        port map (
      I0 => EN_NXT_LYR_20,
      I1 => EN_NXT_LYR_1_reg,
      I2 => EN_STREAM_IBUF,
      I3 => \PIXEL_COUNT_reg_n_0_[2]\,
      I4 => \PIXEL_COUNT_reg_n_0_[1]\,
      I5 => \PIXEL_COUNT_reg_n_0_[0]\,
      O => \PIXEL_COUNT[0]_i_1_n_0\
    );
\PIXEL_COUNT[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA62AAAAAA"
    )
        port map (
      I0 => \PIXEL_COUNT_reg_n_0_[1]\,
      I1 => \PIXEL_COUNT_reg_n_0_[0]\,
      I2 => \PIXEL_COUNT_reg_n_0_[2]\,
      I3 => EN_STREAM_IBUF,
      I4 => EN_NXT_LYR_1_reg,
      I5 => EN_NXT_LYR_20,
      O => \PIXEL_COUNT[1]_i_1_n_0\
    );
\PIXEL_COUNT[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F078F0F0F0"
    )
        port map (
      I0 => \PIXEL_COUNT_reg_n_0_[1]\,
      I1 => \PIXEL_COUNT_reg_n_0_[0]\,
      I2 => \PIXEL_COUNT_reg_n_0_[2]\,
      I3 => EN_STREAM_IBUF,
      I4 => EN_NXT_LYR_1_reg,
      I5 => EN_NXT_LYR_20,
      O => \PIXEL_COUNT[2]_i_1_n_0\
    );
\PIXEL_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \PIXEL_COUNT[0]_i_1_n_0\,
      Q => \PIXEL_COUNT_reg_n_0_[0]\,
      R => RST_IBUF
    );
\PIXEL_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \PIXEL_COUNT[1]_i_1_n_0\,
      Q => \PIXEL_COUNT_reg_n_0_[1]\,
      R => RST_IBUF
    );
\PIXEL_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \PIXEL_COUNT[2]_i_1_n_0\,
      Q => \PIXEL_COUNT_reg_n_0_[2]\,
      R => RST_IBUF
    );
ReadEn_1_1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0008"
    )
        port map (
      I0 => \HEAD_1_1_reg_n_0_[0]\,
      I1 => WriteEn_1_1,
      I2 => \MAX_D_2[0,0][4]_i_2_n_0\,
      I3 => \HEAD_1_1_reg_n_0_[1]\,
      I4 => Async_Mode_1_1,
      O => ReadEn_1_1_i_1_n_0
    );
ReadEn_1_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => ReadEn_1_1_i_1_n_0,
      Q => Async_Mode_1_1,
      R => RST_IBUF
    );
\SIG_STRIDE[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444440"
    )
        port map (
      I0 => \SIG_STRIDE_reg_n_0_[0]\,
      I1 => EN_OUT_BUF,
      I2 => \SIG_STRIDE_reg__0\(2),
      I3 => \SIG_STRIDE_reg__0\(1),
      I4 => \SIG_STRIDE_reg__0\(4),
      I5 => \SIG_STRIDE_reg__0\(3),
      O => \SIG_STRIDE[0]_i_1__1_n_0\
    );
\SIG_STRIDE[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF55575555FFFF"
    )
        port map (
      I0 => EN_OUT_BUF,
      I1 => \SIG_STRIDE_reg__0\(2),
      I2 => \SIG_STRIDE_reg__0\(4),
      I3 => \SIG_STRIDE_reg__0\(3),
      I4 => \SIG_STRIDE_reg__0\(1),
      I5 => \SIG_STRIDE_reg_n_0_[0]\,
      O => p_0_in(1)
    );
\SIG_STRIDE[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAA00000000A8"
    )
        port map (
      I0 => EN_OUT_BUF,
      I1 => \SIG_STRIDE_reg__0\(4),
      I2 => \SIG_STRIDE_reg__0\(3),
      I3 => \SIG_STRIDE_reg_n_0_[0]\,
      I4 => \SIG_STRIDE_reg__0\(1),
      I5 => \SIG_STRIDE_reg__0\(2),
      O => p_0_in(2)
    );
\SIG_STRIDE[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC8CCC800040000"
    )
        port map (
      I0 => \SIG_STRIDE_reg_n_0_[0]\,
      I1 => EN_OUT_BUF,
      I2 => \SIG_STRIDE_reg__0\(2),
      I3 => \SIG_STRIDE_reg__0\(1),
      I4 => \SIG_STRIDE_reg__0\(4),
      I5 => \SIG_STRIDE_reg__0\(3),
      O => p_0_in(3)
    );
\SIG_STRIDE[4]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0100"
    )
        port map (
      I0 => \VALID_ROWS_reg_n_0_[4]\,
      I1 => \SIG_STRIDE[4]_i_3__1_n_0\,
      I2 => \VALID_ROWS_reg_n_0_[3]\,
      I3 => VALID_ROWS,
      I4 => EN_NXT_LYR_20,
      I5 => RST_IBUF,
      O => \SIG_STRIDE[4]_i_1__1_n_0\
    );
\SIG_STRIDE[4]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCC80000"
    )
        port map (
      I0 => \SIG_STRIDE_reg_n_0_[0]\,
      I1 => EN_OUT_BUF,
      I2 => \SIG_STRIDE_reg__0\(2),
      I3 => \SIG_STRIDE_reg__0\(1),
      I4 => \SIG_STRIDE_reg__0\(4),
      I5 => \SIG_STRIDE_reg__0\(3),
      O => p_0_in(4)
    );
\SIG_STRIDE[4]_i_3__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \VALID_ROWS_reg_n_0_[2]\,
      I1 => \VALID_ROWS_reg_n_0_[0]\,
      I2 => \VALID_ROWS_reg_n_0_[1]\,
      O => \SIG_STRIDE[4]_i_3__1_n_0\
    );
\SIG_STRIDE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => \SIG_STRIDE[0]_i_1__1_n_0\,
      Q => \SIG_STRIDE_reg_n_0_[0]\,
      R => \SIG_STRIDE[4]_i_1__1_n_0\
    );
\SIG_STRIDE_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => p_0_in(1),
      Q => \SIG_STRIDE_reg__0\(1),
      S => \SIG_STRIDE[4]_i_1__1_n_0\
    );
\SIG_STRIDE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => p_0_in(2),
      Q => \SIG_STRIDE_reg__0\(2),
      R => \SIG_STRIDE[4]_i_1__1_n_0\
    );
\SIG_STRIDE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => p_0_in(3),
      Q => \SIG_STRIDE_reg__0\(3),
      R => \SIG_STRIDE[4]_i_1__1_n_0\
    );
\SIG_STRIDE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_MX_26_out,
      D => p_0_in(4),
      Q => \SIG_STRIDE_reg__0\(4),
      R => \SIG_STRIDE[4]_i_1__1_n_0\
    );
\TAIL_1_1[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFCF0010"
    )
        port map (
      I0 => \TAIL_1_1_reg_n_0_[1]\,
      I1 => \MAX_D_2[0,0][4]_i_2_n_0\,
      I2 => Async_Mode_1_1,
      I3 => RST_IBUF,
      I4 => \TAIL_1_1_reg_n_0_[0]\,
      O => \TAIL_1_1[0]_i_1_n_0\
    );
\TAIL_1_1[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFCF0020"
    )
        port map (
      I0 => \TAIL_1_1_reg_n_0_[0]\,
      I1 => \MAX_D_2[0,0][4]_i_2_n_0\,
      I2 => Async_Mode_1_1,
      I3 => RST_IBUF,
      I4 => \TAIL_1_1_reg_n_0_[1]\,
      O => \TAIL_1_1[1]_i_1_n_0\
    );
\TAIL_1_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \TAIL_1_1[0]_i_1_n_0\,
      Q => \TAIL_1_1_reg_n_0_[0]\,
      R => '0'
    );
\TAIL_1_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \TAIL_1_1[1]_i_1_n_0\,
      Q => \TAIL_1_1_reg_n_0_[1]\,
      R => '0'
    );
\VALID_ROWS[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \VALID_ROWS_reg_n_0_[0]\,
      O => \VALID_ROWS[0]_i_1_n_0\
    );
\VALID_ROWS[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \VALID_ROWS_reg_n_0_[1]\,
      I1 => \VALID_ROWS_reg_n_0_[0]\,
      O => \VALID_ROWS[1]_i_1_n_0\
    );
\VALID_ROWS[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \VALID_ROWS_reg_n_0_[2]\,
      I1 => \VALID_ROWS_reg_n_0_[0]\,
      I2 => \VALID_ROWS_reg_n_0_[1]\,
      O => \VALID_ROWS[2]_i_1_n_0\
    );
\VALID_ROWS[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3FFF8000"
    )
        port map (
      I0 => \VALID_ROWS_reg_n_0_[4]\,
      I1 => \VALID_ROWS_reg_n_0_[2]\,
      I2 => \VALID_ROWS_reg_n_0_[0]\,
      I3 => \VALID_ROWS_reg_n_0_[1]\,
      I4 => \VALID_ROWS_reg_n_0_[3]\,
      O => \VALID_ROWS[3]_i_1_n_0\
    );
\VALID_ROWS[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => EN_OUT_BUF,
      I1 => Enable_MAX,
      I2 => EN_NXT_LYR_20,
      I3 => EN_NXT_LYR_1_reg,
      I4 => EN_STREAM_IBUF,
      O => VALID_ROWS
    );
\VALID_ROWS[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \VALID_ROWS_reg_n_0_[4]\,
      I1 => \VALID_ROWS_reg_n_0_[2]\,
      I2 => \VALID_ROWS_reg_n_0_[0]\,
      I3 => \VALID_ROWS_reg_n_0_[1]\,
      I4 => \VALID_ROWS_reg_n_0_[3]\,
      O => \VALID_ROWS[4]_i_2_n_0\
    );
\VALID_ROWS_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_ROWS,
      D => \VALID_ROWS[0]_i_1_n_0\,
      Q => \VALID_ROWS_reg_n_0_[0]\,
      R => RST_IBUF
    );
\VALID_ROWS_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_ROWS,
      D => \VALID_ROWS[1]_i_1_n_0\,
      Q => \VALID_ROWS_reg_n_0_[1]\,
      R => RST_IBUF
    );
\VALID_ROWS_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_ROWS,
      D => \VALID_ROWS[2]_i_1_n_0\,
      Q => \VALID_ROWS_reg_n_0_[2]\,
      R => RST_IBUF
    );
\VALID_ROWS_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_ROWS,
      D => \VALID_ROWS[3]_i_1_n_0\,
      Q => \VALID_ROWS_reg_n_0_[3]\,
      R => RST_IBUF
    );
\VALID_ROWS_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_ROWS,
      D => \VALID_ROWS[4]_i_2_n_0\,
      Q => \VALID_ROWS_reg_n_0_[4]\,
      R => RST_IBUF
    );
\WINDOW[0,0][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => EN_STREAM_IBUF,
      I1 => EN_NXT_LYR_1_reg,
      I2 => EN_NXT_LYR_20,
      O => \WINDOW_reg[0,0]0\
    );
\WINDOW[0,2][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \FIFO_ROW_1_1_reg_n_0_[2][0]\,
      I1 => \FIFO_ROW_1_1_reg_n_0_[0][0]\,
      I2 => \TAIL_1_1_reg_n_0_[0]\,
      I3 => \TAIL_1_1_reg_n_0_[1]\,
      I4 => \FIFO_ROW_1_1_reg_n_0_[1][0]\,
      O => \WINDOW[0,2][0]_i_1_n_0\
    );
\WINDOW[0,2][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \FIFO_ROW_1_1_reg_n_0_[2][1]\,
      I1 => \FIFO_ROW_1_1_reg_n_0_[0][1]\,
      I2 => \TAIL_1_1_reg_n_0_[0]\,
      I3 => \TAIL_1_1_reg_n_0_[1]\,
      I4 => \FIFO_ROW_1_1_reg_n_0_[1][1]\,
      O => \WINDOW[0,2][1]_i_1_n_0\
    );
\WINDOW[0,2][2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0ACF0AC0"
    )
        port map (
      I0 => \FIFO_ROW_1_1_reg_n_0_[2][2]\,
      I1 => \FIFO_ROW_1_1_reg_n_0_[1][2]\,
      I2 => \TAIL_1_1_reg_n_0_[0]\,
      I3 => \TAIL_1_1_reg_n_0_[1]\,
      I4 => \FIFO_ROW_1_1_reg_n_0_[0][2]\,
      O => \WINDOW[0,2][2]_i_1_n_0\
    );
\WINDOW[0,2][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FCA00CA"
    )
        port map (
      I0 => \FIFO_ROW_1_1_reg_n_0_[0][3]\,
      I1 => \FIFO_ROW_1_1_reg_n_0_[1][3]\,
      I2 => \TAIL_1_1_reg_n_0_[0]\,
      I3 => \TAIL_1_1_reg_n_0_[1]\,
      I4 => \FIFO_ROW_1_1_reg_n_0_[2][3]\,
      O => \WINDOW[0,2][3]_i_1_n_0\
    );
\WINDOW[0,2][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Async_Mode_1_1,
      I1 => EN_STREAM_IBUF,
      I2 => EN_NXT_LYR_1_reg,
      I3 => EN_NXT_LYR_20,
      O => \WINDOW[0,2]\
    );
\WINDOW[0,2][4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FCA00CA"
    )
        port map (
      I0 => \FIFO_ROW_1_1_reg_n_0_[0][4]\,
      I1 => \FIFO_ROW_1_1_reg_n_0_[1][4]\,
      I2 => \TAIL_1_1_reg_n_0_[0]\,
      I3 => \TAIL_1_1_reg_n_0_[1]\,
      I4 => \FIFO_ROW_1_1_reg_n_0_[2][4]\,
      O => \WINDOW[0,2][4]_i_2_n_0\
    );
\WINDOW_reg[0,0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \DOUT_BUF_1_1_reg[4]\(0),
      Q => \WINDOW_reg[0,_n_0_0][0]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \DOUT_BUF_1_1_reg[4]\(1),
      Q => \WINDOW_reg[0,_n_0_0][1]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \DOUT_BUF_1_1_reg[4]\(2),
      Q => \WINDOW_reg[0,_n_0_0][2]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \DOUT_BUF_1_1_reg[4]\(3),
      Q => \WINDOW_reg[0,_n_0_0][3]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \DOUT_BUF_1_1_reg[4]\(4),
      Q => \WINDOW_reg[0,_n_0_0][4]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_0][0]\,
      Q => \WINDOW_reg[0,_n_0_1][0]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_0][1]\,
      Q => \WINDOW_reg[0,_n_0_1][1]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_0][2]\,
      Q => \WINDOW_reg[0,_n_0_1][2]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_0][3]\,
      Q => \WINDOW_reg[0,_n_0_1][3]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_0][4]\,
      Q => \WINDOW_reg[0,_n_0_1][4]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[0,2]\,
      D => \WINDOW[0,2][0]_i_1_n_0\,
      Q => \WINDOW_reg[0,_n_0_2][0]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[0,2]\,
      D => \WINDOW[0,2][1]_i_1_n_0\,
      Q => \WINDOW_reg[0,_n_0_2][1]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[0,2]\,
      D => \WINDOW[0,2][2]_i_1_n_0\,
      Q => \WINDOW_reg[0,_n_0_2][2]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[0,2]\,
      D => \WINDOW[0,2][3]_i_1_n_0\,
      Q => \WINDOW_reg[0,_n_0_2][3]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[0,2]\,
      D => \WINDOW[0,2][4]_i_2_n_0\,
      Q => \WINDOW_reg[0,_n_0_2][4]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_2][0]\,
      Q => \WINDOW_reg[0,_n_0_3][0]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_2][1]\,
      Q => \WINDOW_reg[0,_n_0_3][1]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_2][2]\,
      Q => \WINDOW_reg[0,_n_0_3][2]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_2][3]\,
      Q => \WINDOW_reg[0,_n_0_3][3]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW_reg[0,0]0\,
      D => \WINDOW_reg[0,_n_0_2][4]\,
      Q => \WINDOW_reg[0,_n_0_3][4]\,
      R => RST_IBUF
    );
WriteEn_1_1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0010"
    )
        port map (
      I0 => \MAX_D_2[0,0][4]_i_2_n_0\,
      I1 => \PIXEL_COUNT_reg_n_0_[2]\,
      I2 => \PIXEL_COUNT_reg_n_0_[0]\,
      I3 => \PIXEL_COUNT_reg_n_0_[1]\,
      I4 => WriteEn_1_1,
      O => WriteEn_1_1_i_1_n_0
    );
WriteEn_1_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => WriteEn_1_1_i_1_n_0,
      Q => WriteEn_1_1,
      R => RST_IBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity CONV_LAYER_1 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    DIS_STREAM : out STD_LOGIC;
    EN_STREAM : in STD_LOGIC;
    EN_STREAM_OUT_1 : out STD_LOGIC;
    VALID_OUT_1 : out STD_LOGIC;
    EN_LOC_STREAM_1 : in STD_LOGIC;
    DOUT_1_1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DOUT_2_1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    INTERNAL_RST : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of CONV_LAYER_1 : entity is true;
  attribute ADD_1 : integer;
  attribute ADD_1 of CONV_LAYER_1 : entity is 2;
  attribute ADD_2 : integer;
  attribute ADD_2 of CONV_LAYER_1 : entity is 1;
  attribute ADD_TREE_DEPTH : integer;
  attribute ADD_TREE_DEPTH of CONV_LAYER_1 : entity is 2;
  attribute BASE_DIN_WIDTH : integer;
  attribute BASE_DIN_WIDTH of CONV_LAYER_1 : entity is 8;
  attribute BIASES_SIZE : integer;
  attribute BIASES_SIZE of CONV_LAYER_1 : entity is 2;
  attribute BIAS_SIZE : integer;
  attribute BIAS_SIZE of CONV_LAYER_1 : entity is 5;
  attribute DECIMAL : integer;
  attribute DECIMAL of CONV_LAYER_1 : entity is 3;
  attribute DIN_WIDTH : integer;
  attribute DIN_WIDTH of CONV_LAYER_1 : entity is 8;
  attribute DOUT_WIDTH : integer;
  attribute DOUT_WIDTH of CONV_LAYER_1 : entity is 5;
  attribute FEATURE_MAPS : integer;
  attribute FEATURE_MAPS of CONV_LAYER_1 : entity is 1;
  attribute FIFO_DEPTH : integer;
  attribute FIFO_DEPTH of CONV_LAYER_1 : entity is 4;
  attribute F_SIZE : integer;
  attribute F_SIZE of CONV_LAYER_1 : entity is 2;
  attribute IMAGE_SIZE : integer;
  attribute IMAGE_SIZE of CONV_LAYER_1 : entity is 25;
  attribute IMAGE_WIDTH : integer;
  attribute IMAGE_WIDTH of CONV_LAYER_1 : entity is 5;
  attribute INPUT_DEPTH : integer;
  attribute INPUT_DEPTH of CONV_LAYER_1 : entity is 1;
  attribute LOCAL_OUTPUT : integer;
  attribute LOCAL_OUTPUT of CONV_LAYER_1 : entity is 5;
  attribute MULT_SIZE : integer;
  attribute MULT_SIZE of CONV_LAYER_1 : entity is 13;
  attribute MULT_SUM_SIZE : integer;
  attribute MULT_SUM_SIZE of CONV_LAYER_1 : entity is 6;
  attribute PADDING : integer;
  attribute PADDING of CONV_LAYER_1 : entity is 1;
  attribute PRECISION : integer;
  attribute PRECISION of CONV_LAYER_1 : entity is 5;
  attribute STRIDE : integer;
  attribute STRIDE of CONV_LAYER_1 : entity is 1;
  attribute STRIDE_CYCLES : integer;
  attribute STRIDE_CYCLES of CONV_LAYER_1 : entity is 4;
  attribute USED_FIFOS : integer;
  attribute USED_FIFOS of CONV_LAYER_1 : entity is 1;
  attribute VALID_CYCLES : integer;
  attribute VALID_CYCLES of CONV_LAYER_1 : entity is 16;
  attribute VALID_LOCAL_PIX : integer;
  attribute VALID_LOCAL_PIX of CONV_LAYER_1 : entity is 4;
  attribute WEIGHT_SIZE : integer;
  attribute WEIGHT_SIZE of CONV_LAYER_1 : entity is 5;
  attribute WHOLE : integer;
  attribute WHOLE of CONV_LAYER_1 : entity is 2;
end CONV_LAYER_1;

architecture STRUCTURE of CONV_LAYER_1 is
  signal \ADD_DEPTH_1[0,0][0]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[0,0][1]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[0,0][2]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[0,0][3]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[0,0][4]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[0,0][4]_i_2_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[1,0][0]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[1,0][1]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[1,0][2]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[1,0][3]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[1,0][4]_i_2_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1[1,0][4]_i_3_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_1_reg[0,0]__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \ADD_DEPTH_1_reg[1,0]__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \ADD_DEPTH_2[0,0][0]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_2[0,0][1]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_2[0,0][2]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_2[0,0][3]_i_1_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_2[0,0][4]_i_2_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_2[0,0][4]_i_3_n_0\ : STD_LOGIC;
  signal \ADD_DEPTH_2_reg[0,0]__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal Async_Mode_1 : STD_LOGIC;
  signal \BIAS_1[0]_i_1_n_0\ : STD_LOGIC;
  signal \BIAS_1[1]_i_1_n_0\ : STD_LOGIC;
  signal \BIAS_1[2]_i_1_n_0\ : STD_LOGIC;
  signal \BIAS_1[3]_i_1_n_0\ : STD_LOGIC;
  signal \BIAS_1[4]_i_2_n_0\ : STD_LOGIC;
  signal \BIAS_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \BIAS_1_reg_n_0_[1]\ : STD_LOGIC;
  signal \BIAS_1_reg_n_0_[2]\ : STD_LOGIC;
  signal \BIAS_1_reg_n_0_[3]\ : STD_LOGIC;
  signal \BIAS_1_reg_n_0_[4]\ : STD_LOGIC;
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal DIN_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal DOUT_2_1_OBUF : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal DOUT_BUF_1_1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \DOUT_BUF_1_1[4]_i_1_n_0\ : STD_LOGIC;
  signal \DOUT_BUF_1_1[4]_i_3_n_0\ : STD_LOGIC;
  signal EN_LOC_STREAM_1_IBUF : STD_LOGIC;
  signal EN_NXT_LYR_1_i_1_n_0 : STD_LOGIC;
  signal EN_NXT_LYR_1_reg_n_0 : STD_LOGIC;
  signal EN_STREAM_IBUF : STD_LOGIC;
  signal Enable_BIAS : STD_LOGIC;
  signal Enable_BIAS9_out : STD_LOGIC;
  signal \Enable_BIAS_i_1__0_n_0\ : STD_LOGIC;
  signal Enable_MULT : STD_LOGIC;
  signal Enable_MULT_i_1_n_0 : STD_LOGIC;
  signal Enable_ReLU : STD_LOGIC;
  signal Enable_ReLU7_out : STD_LOGIC;
  signal \Enable_ReLU_i_1__0_n_0\ : STD_LOGIC;
  signal Enable_STAGE_1 : STD_LOGIC;
  signal Enable_STAGE_113_out : STD_LOGIC;
  signal Enable_STAGE_1_i_1_n_0 : STD_LOGIC;
  signal Enable_STAGE_2 : STD_LOGIC;
  signal Enable_STAGE_211_out : STD_LOGIC;
  signal Enable_STAGE_2_i_1_n_0 : STD_LOGIC;
  signal \FIFO_ROW_1[0]\ : STD_LOGIC;
  signal \FIFO_ROW_1[1]\ : STD_LOGIC;
  signal \FIFO_ROW_1[2]\ : STD_LOGIC;
  signal \FIFO_ROW_1[3]\ : STD_LOGIC;
  signal \FIFO_ROW_1_reg[0]__0\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \FIFO_ROW_1_reg[1]__0\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \FIFO_ROW_1_reg[2]__0\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \FIFO_ROW_1_reg[3]__0\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal FRST_TIM_EN_1 : STD_LOGIC;
  signal FRST_TIM_EN_15_out : STD_LOGIC;
  signal FRST_TIM_EN_1_i_1_n_0 : STD_LOGIC;
  signal \HEAD_1[0]_i_1_n_0\ : STD_LOGIC;
  signal \HEAD_1[1]_i_1_n_0\ : STD_LOGIC;
  signal \HEAD_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \HEAD_1_reg_n_0_[1]\ : STD_LOGIC;
  signal INTERNAL_RST_OBUF : STD_LOGIC;
  signal L : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \MULT_1[1,0][3]_i_2_n_0\ : STD_LOGIC;
  signal \MULT_1[1,0][3]_i_3_n_0\ : STD_LOGIC;
  signal \MULT_1[1,0][3]_i_4_n_0\ : STD_LOGIC;
  signal \MULT_1[1,0][7]_i_3_n_0\ : STD_LOGIC;
  signal \MULT_1[1,0][7]_i_4_n_0\ : STD_LOGIC;
  signal \MULT_1[1,0][7]_i_5_n_0\ : STD_LOGIC;
  signal \MULT_1[1,0][7]_i_6_n_0\ : STD_LOGIC;
  signal \MULT_1_reg[0,0]__0\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \MULT_1_reg[1,0][3]_i_1_n_0\ : STD_LOGIC;
  signal \MULT_1_reg[1,0][3]_i_1_n_1\ : STD_LOGIC;
  signal \MULT_1_reg[1,0][3]_i_1_n_2\ : STD_LOGIC;
  signal \MULT_1_reg[1,0][3]_i_1_n_3\ : STD_LOGIC;
  signal \MULT_1_reg[1,0][7]_i_2_n_1\ : STD_LOGIC;
  signal \MULT_1_reg[1,0][7]_i_2_n_2\ : STD_LOGIC;
  signal \MULT_1_reg[1,0][7]_i_2_n_3\ : STD_LOGIC;
  signal \MULT_1_reg[1,_n_0_1][3]\ : STD_LOGIC;
  signal \MULT_1_reg[1,_n_0_1][4]\ : STD_LOGIC;
  signal \MULT_1_reg[1,_n_0_1][5]\ : STD_LOGIC;
  signal \MULT_1_reg[1,_n_0_1][6]\ : STD_LOGIC;
  signal \MULT_1_reg[1,_n_0_1][7]\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg__0\ : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \OUT_PIXEL_COUNT_reg_n_0_[0]\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[1]\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[2]\ : STD_LOGIC;
  signal \OUT_PIXEL_COUNT_reg_n_0_[3]\ : STD_LOGIC;
  signal PIXEL_COUNT1 : STD_LOGIC;
  signal \PIXEL_COUNT[4]_i_1_n_0\ : STD_LOGIC;
  signal \PIXEL_COUNT_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal R : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal RST_IBUF : STD_LOGIC;
  signal ReadEn_1_i_1_n_0 : STD_LOGIC;
  signal \TAIL_1[0]_i_1_n_0\ : STD_LOGIC;
  signal \TAIL_1[1]_i_1_n_0\ : STD_LOGIC;
  signal \TAIL_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \TAIL_1_reg_n_0_[1]\ : STD_LOGIC;
  signal VALID_NXTLYR_PIX : STD_LOGIC;
  signal \VALID_NXTLYR_PIX[0]_i_1_n_0\ : STD_LOGIC;
  signal \VALID_NXTLYR_PIX[1]_i_1_n_0\ : STD_LOGIC;
  signal \VALID_NXTLYR_PIX[2]_i_1_n_0\ : STD_LOGIC;
  signal \VALID_NXTLYR_PIX_reg_n_0_[0]\ : STD_LOGIC;
  signal \VALID_NXTLYR_PIX_reg_n_0_[1]\ : STD_LOGIC;
  signal \VALID_NXTLYR_PIX_reg_n_0_[2]\ : STD_LOGIC;
  signal \WINDOW[1,0]\ : STD_LOGIC;
  signal \WINDOW[1,0][2]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[1,0][3]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[1,0][4]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[1,0][5]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[1,0][6]_i_1_n_0\ : STD_LOGIC;
  signal \WINDOW[1,0][7]_i_2_n_0\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][0]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][1]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][2]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][3]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][4]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][5]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][6]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_0][7]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][0]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][1]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][2]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][3]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][4]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][5]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][6]\ : STD_LOGIC;
  signal \WINDOW_reg[0,_n_0_1][7]\ : STD_LOGIC;
  signal \WINDOW_reg[1,0]__0\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \WINDOW_reg[1,1]__0\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal WriteEn_1 : STD_LOGIC;
  signal WriteEn_1_i_1_n_0 : STD_LOGIC;
  signal WriteEn_1_i_2_n_0 : STD_LOGIC;
  signal multOp : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \p_0_in__2\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_MULT_1_reg[1,0][3]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_MULT_1_reg[1,0][7]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ADD_DEPTH_1[0,0][0]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \ADD_DEPTH_1[0,0][1]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \ADD_DEPTH_1[0,0][3]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \ADD_DEPTH_1[0,0][4]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \ADD_DEPTH_1[1,0][0]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \ADD_DEPTH_1[1,0][1]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \ADD_DEPTH_1[1,0][3]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \ADD_DEPTH_1[1,0][4]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \ADD_DEPTH_2[0,0][0]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \ADD_DEPTH_2[0,0][1]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \ADD_DEPTH_2[0,0][3]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \ADD_DEPTH_2[0,0][4]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \BIAS_1[1]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \BIAS_1[2]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \BIAS_1[3]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \BIAS_1[4]_i_2\ : label is "soft_lutpair26";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \MULT_1_reg[1,0][3]_i_1\ : label is "{SYNTH-9 {cell *THIS*} {string 8x3}}";
  attribute METHODOLOGY_DRC_VIOS of \MULT_1_reg[1,0][7]_i_2\ : label is "{SYNTH-9 {cell *THIS*} {string 8x3}}";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[2]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \OUT_PIXEL_COUNT[4]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \PIXEL_COUNT[0]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \PIXEL_COUNT[1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \PIXEL_COUNT[2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \PIXEL_COUNT[3]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \PIXEL_COUNT[4]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \VALID_NXTLYR_PIX[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \VALID_NXTLYR_PIX[2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of WriteEn_1_i_2 : label is "soft_lutpair27";
begin
\ADD_DEPTH_1[0,0][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \MULT_1_reg[0,0]__0\(3),
      I1 => \MULT_1_reg[1,_n_0_1][3]\,
      O => \ADD_DEPTH_1[0,0][0]_i_1_n_0\
    );
\ADD_DEPTH_1[0,0][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \MULT_1_reg[0,0]__0\(3),
      I1 => \MULT_1_reg[1,_n_0_1][3]\,
      I2 => \MULT_1_reg[1,_n_0_1][4]\,
      I3 => \MULT_1_reg[0,0]__0\(4),
      O => \ADD_DEPTH_1[0,0][1]_i_1_n_0\
    );
\ADD_DEPTH_1[0,0][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880077F077FF880"
    )
        port map (
      I0 => \MULT_1_reg[1,_n_0_1][3]\,
      I1 => \MULT_1_reg[0,0]__0\(3),
      I2 => \MULT_1_reg[0,0]__0\(4),
      I3 => \MULT_1_reg[1,_n_0_1][4]\,
      I4 => \MULT_1_reg[1,_n_0_1][5]\,
      I5 => \MULT_1_reg[0,0]__0\(5),
      O => \ADD_DEPTH_1[0,0][2]_i_1_n_0\
    );
\ADD_DEPTH_1[0,0][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \ADD_DEPTH_1[0,0][4]_i_2_n_0\,
      I1 => \MULT_1_reg[1,_n_0_1][6]\,
      I2 => \MULT_1_reg[0,0]__0\(6),
      O => \ADD_DEPTH_1[0,0][3]_i_1_n_0\
    );
\ADD_DEPTH_1[0,0][4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => \ADD_DEPTH_1[0,0][4]_i_2_n_0\,
      I1 => \MULT_1_reg[0,0]__0\(6),
      I2 => \MULT_1_reg[1,_n_0_1][6]\,
      I3 => \MULT_1_reg[1,_n_0_1][7]\,
      I4 => \MULT_1_reg[0,0]__0\(7),
      O => \ADD_DEPTH_1[0,0][4]_i_1_n_0\
    );
\ADD_DEPTH_1[0,0][4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEE888E8888888"
    )
        port map (
      I0 => \MULT_1_reg[1,_n_0_1][5]\,
      I1 => \MULT_1_reg[0,0]__0\(5),
      I2 => \MULT_1_reg[1,_n_0_1][3]\,
      I3 => \MULT_1_reg[0,0]__0\(3),
      I4 => \MULT_1_reg[0,0]__0\(4),
      I5 => \MULT_1_reg[1,_n_0_1][4]\,
      O => \ADD_DEPTH_1[0,0][4]_i_2_n_0\
    );
\ADD_DEPTH_1[1,0][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => L(0),
      I1 => R(0),
      O => \ADD_DEPTH_1[1,0][0]_i_1_n_0\
    );
\ADD_DEPTH_1[1,0][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => L(0),
      I1 => R(0),
      I2 => R(1),
      I3 => L(1),
      O => \ADD_DEPTH_1[1,0][1]_i_1_n_0\
    );
\ADD_DEPTH_1[1,0][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880077F077FF880"
    )
        port map (
      I0 => R(0),
      I1 => L(0),
      I2 => L(1),
      I3 => R(1),
      I4 => R(2),
      I5 => L(2),
      O => \ADD_DEPTH_1[1,0][2]_i_1_n_0\
    );
\ADD_DEPTH_1[1,0][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \ADD_DEPTH_1[1,0][4]_i_3_n_0\,
      I1 => R(3),
      I2 => L(3),
      O => \ADD_DEPTH_1[1,0][3]_i_1_n_0\
    );
\ADD_DEPTH_1[1,0][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Enable_STAGE_1,
      I1 => EN_STREAM_IBUF,
      I2 => EN_LOC_STREAM_1_IBUF,
      I3 => \OUT_PIXEL_COUNT_reg__0\(4),
      O => Enable_STAGE_211_out
    );
\ADD_DEPTH_1[1,0][4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => \ADD_DEPTH_1[1,0][4]_i_3_n_0\,
      I1 => L(3),
      I2 => R(3),
      I3 => R(4),
      I4 => L(4),
      O => \ADD_DEPTH_1[1,0][4]_i_2_n_0\
    );
\ADD_DEPTH_1[1,0][4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEE888E8888888"
    )
        port map (
      I0 => R(2),
      I1 => L(2),
      I2 => R(0),
      I3 => L(0),
      I4 => L(1),
      I5 => R(1),
      O => \ADD_DEPTH_1[1,0][4]_i_3_n_0\
    );
\ADD_DEPTH_1_reg[0,0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[0,0][0]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[0,0]__0\(0),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[0,0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[0,0][1]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[0,0]__0\(1),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[0,0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[0,0][2]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[0,0]__0\(2),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[0,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[0,0][3]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[0,0]__0\(3),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[0,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[0,0][4]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[0,0]__0\(4),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[1,0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[1,0][0]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[1,0]__0\(0),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[1,0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[1,0][1]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[1,0]__0\(1),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[1,0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[1,0][2]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[1,0]__0\(2),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[1,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[1,0][3]_i_1_n_0\,
      Q => \ADD_DEPTH_1_reg[1,0]__0\(3),
      R => RST_IBUF
    );
\ADD_DEPTH_1_reg[1,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_211_out,
      D => \ADD_DEPTH_1[1,0][4]_i_2_n_0\,
      Q => \ADD_DEPTH_1_reg[1,0]__0\(4),
      R => RST_IBUF
    );
\ADD_DEPTH_2[0,0][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ADD_DEPTH_1_reg[0,0]__0\(0),
      I1 => \ADD_DEPTH_1_reg[1,0]__0\(0),
      O => \ADD_DEPTH_2[0,0][0]_i_1_n_0\
    );
\ADD_DEPTH_2[0,0][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \ADD_DEPTH_1_reg[0,0]__0\(0),
      I1 => \ADD_DEPTH_1_reg[1,0]__0\(0),
      I2 => \ADD_DEPTH_1_reg[1,0]__0\(1),
      I3 => \ADD_DEPTH_1_reg[0,0]__0\(1),
      O => \ADD_DEPTH_2[0,0][1]_i_1_n_0\
    );
\ADD_DEPTH_2[0,0][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880077F077FF880"
    )
        port map (
      I0 => \ADD_DEPTH_1_reg[1,0]__0\(0),
      I1 => \ADD_DEPTH_1_reg[0,0]__0\(0),
      I2 => \ADD_DEPTH_1_reg[0,0]__0\(1),
      I3 => \ADD_DEPTH_1_reg[1,0]__0\(1),
      I4 => \ADD_DEPTH_1_reg[1,0]__0\(2),
      I5 => \ADD_DEPTH_1_reg[0,0]__0\(2),
      O => \ADD_DEPTH_2[0,0][2]_i_1_n_0\
    );
\ADD_DEPTH_2[0,0][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \ADD_DEPTH_2[0,0][4]_i_3_n_0\,
      I1 => \ADD_DEPTH_1_reg[1,0]__0\(3),
      I2 => \ADD_DEPTH_1_reg[0,0]__0\(3),
      O => \ADD_DEPTH_2[0,0][3]_i_1_n_0\
    );
\ADD_DEPTH_2[0,0][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Enable_STAGE_2,
      I1 => EN_STREAM_IBUF,
      I2 => EN_LOC_STREAM_1_IBUF,
      I3 => \OUT_PIXEL_COUNT_reg__0\(4),
      O => Enable_BIAS9_out
    );
\ADD_DEPTH_2[0,0][4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => \ADD_DEPTH_2[0,0][4]_i_3_n_0\,
      I1 => \ADD_DEPTH_1_reg[0,0]__0\(3),
      I2 => \ADD_DEPTH_1_reg[1,0]__0\(3),
      I3 => \ADD_DEPTH_1_reg[1,0]__0\(4),
      I4 => \ADD_DEPTH_1_reg[0,0]__0\(4),
      O => \ADD_DEPTH_2[0,0][4]_i_2_n_0\
    );
\ADD_DEPTH_2[0,0][4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEE888E8888888"
    )
        port map (
      I0 => \ADD_DEPTH_1_reg[1,0]__0\(2),
      I1 => \ADD_DEPTH_1_reg[0,0]__0\(2),
      I2 => \ADD_DEPTH_1_reg[1,0]__0\(0),
      I3 => \ADD_DEPTH_1_reg[0,0]__0\(0),
      I4 => \ADD_DEPTH_1_reg[0,0]__0\(1),
      I5 => \ADD_DEPTH_1_reg[1,0]__0\(1),
      O => \ADD_DEPTH_2[0,0][4]_i_3_n_0\
    );
\ADD_DEPTH_2_reg[0,0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS9_out,
      D => \ADD_DEPTH_2[0,0][0]_i_1_n_0\,
      Q => \ADD_DEPTH_2_reg[0,0]__0\(0),
      R => RST_IBUF
    );
\ADD_DEPTH_2_reg[0,0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS9_out,
      D => \ADD_DEPTH_2[0,0][1]_i_1_n_0\,
      Q => \ADD_DEPTH_2_reg[0,0]__0\(1),
      R => RST_IBUF
    );
\ADD_DEPTH_2_reg[0,0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS9_out,
      D => \ADD_DEPTH_2[0,0][2]_i_1_n_0\,
      Q => \ADD_DEPTH_2_reg[0,0]__0\(2),
      R => RST_IBUF
    );
\ADD_DEPTH_2_reg[0,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS9_out,
      D => \ADD_DEPTH_2[0,0][3]_i_1_n_0\,
      Q => \ADD_DEPTH_2_reg[0,0]__0\(3),
      R => RST_IBUF
    );
\ADD_DEPTH_2_reg[0,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_BIAS9_out,
      D => \ADD_DEPTH_2[0,0][4]_i_2_n_0\,
      Q => \ADD_DEPTH_2_reg[0,0]__0\(4),
      R => RST_IBUF
    );
\BIAS_1[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ADD_DEPTH_2_reg[0,0]__0\(0),
      O => \BIAS_1[0]_i_1_n_0\
    );
\BIAS_1[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ADD_DEPTH_2_reg[0,0]__0\(0),
      I1 => \ADD_DEPTH_2_reg[0,0]__0\(1),
      O => \BIAS_1[1]_i_1_n_0\
    );
\BIAS_1[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \ADD_DEPTH_2_reg[0,0]__0\(0),
      I1 => \ADD_DEPTH_2_reg[0,0]__0\(1),
      I2 => \ADD_DEPTH_2_reg[0,0]__0\(2),
      O => \BIAS_1[2]_i_1_n_0\
    );
\BIAS_1[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \ADD_DEPTH_2_reg[0,0]__0\(1),
      I1 => \ADD_DEPTH_2_reg[0,0]__0\(0),
      I2 => \ADD_DEPTH_2_reg[0,0]__0\(2),
      I3 => \ADD_DEPTH_2_reg[0,0]__0\(3),
      O => \BIAS_1[3]_i_1_n_0\
    );
\BIAS_1[4]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Enable_BIAS,
      I1 => EN_STREAM_IBUF,
      I2 => EN_LOC_STREAM_1_IBUF,
      I3 => \OUT_PIXEL_COUNT_reg__0\(4),
      O => Enable_ReLU7_out
    );
\BIAS_1[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \ADD_DEPTH_2_reg[0,0]__0\(2),
      I1 => \ADD_DEPTH_2_reg[0,0]__0\(0),
      I2 => \ADD_DEPTH_2_reg[0,0]__0\(1),
      I3 => \ADD_DEPTH_2_reg[0,0]__0\(3),
      I4 => \ADD_DEPTH_2_reg[0,0]__0\(4),
      O => \BIAS_1[4]_i_2_n_0\
    );
\BIAS_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_ReLU7_out,
      D => \BIAS_1[0]_i_1_n_0\,
      Q => \BIAS_1_reg_n_0_[0]\,
      R => RST_IBUF
    );
\BIAS_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_ReLU7_out,
      D => \BIAS_1[1]_i_1_n_0\,
      Q => \BIAS_1_reg_n_0_[1]\,
      R => RST_IBUF
    );
\BIAS_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_ReLU7_out,
      D => \BIAS_1[2]_i_1_n_0\,
      Q => \BIAS_1_reg_n_0_[2]\,
      R => RST_IBUF
    );
\BIAS_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_ReLU7_out,
      D => \BIAS_1[3]_i_1_n_0\,
      Q => \BIAS_1_reg_n_0_[3]\,
      R => RST_IBUF
    );
\BIAS_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_ReLU7_out,
      D => \BIAS_1[4]_i_2_n_0\,
      Q => \BIAS_1_reg_n_0_[4]\,
      R => RST_IBUF
    );
CLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_IBUF,
      O => CLK_IBUF_BUFG
    );
CLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK,
      O => CLK_IBUF
    );
\DIN_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DIN(0),
      O => DIN_IBUF(0)
    );
\DIN_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DIN(1),
      O => DIN_IBUF(1)
    );
\DIN_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DIN(2),
      O => DIN_IBUF(2)
    );
\DIN_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DIN(3),
      O => DIN_IBUF(3)
    );
\DIN_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DIN(4),
      O => DIN_IBUF(4)
    );
\DIN_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DIN(5),
      O => DIN_IBUF(5)
    );
\DIN_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DIN(6),
      O => DIN_IBUF(6)
    );
\DIN_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DIN(7),
      O => DIN_IBUF(7)
    );
DIS_STREAM_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => DIS_STREAM,
      T => '1'
    );
\DOUT_1_1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(0),
      O => DOUT_1_1(0)
    );
\DOUT_1_1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(1),
      O => DOUT_1_1(1)
    );
\DOUT_1_1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(2),
      O => DOUT_1_1(2)
    );
\DOUT_1_1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(3),
      O => DOUT_1_1(3)
    );
\DOUT_1_1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(4),
      O => DOUT_1_1(4)
    );
\DOUT_2_1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(0),
      O => DOUT_2_1(0)
    );
\DOUT_2_1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(1),
      O => DOUT_2_1(1)
    );
\DOUT_2_1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(2),
      O => DOUT_2_1(2)
    );
\DOUT_2_1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(3),
      O => DOUT_2_1(3)
    );
\DOUT_2_1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DOUT_2_1_OBUF(4),
      O => DOUT_2_1(4)
    );
\DOUT_BUF_1_1[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAABAAAAAAA"
    )
        port map (
      I0 => RST_IBUF,
      I1 => \DOUT_BUF_1_1[4]_i_3_n_0\,
      I2 => Enable_ReLU,
      I3 => EN_STREAM_IBUF,
      I4 => EN_LOC_STREAM_1_IBUF,
      I5 => \OUT_PIXEL_COUNT_reg__0\(4),
      O => \DOUT_BUF_1_1[4]_i_1_n_0\
    );
\DOUT_BUF_1_1[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Enable_ReLU,
      I1 => EN_STREAM_IBUF,
      I2 => EN_LOC_STREAM_1_IBUF,
      I3 => \OUT_PIXEL_COUNT_reg__0\(4),
      O => VALID_NXTLYR_PIX
    );
\DOUT_BUF_1_1[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFFE"
    )
        port map (
      I0 => \BIAS_1_reg_n_0_[3]\,
      I1 => \BIAS_1_reg_n_0_[2]\,
      I2 => \BIAS_1_reg_n_0_[1]\,
      I3 => \BIAS_1_reg_n_0_[0]\,
      I4 => \BIAS_1_reg_n_0_[4]\,
      I5 => \VALID_NXTLYR_PIX_reg_n_0_[2]\,
      O => \DOUT_BUF_1_1[4]_i_3_n_0\
    );
\DOUT_BUF_1_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \BIAS_1_reg_n_0_[0]\,
      Q => DOUT_BUF_1_1(0),
      R => \DOUT_BUF_1_1[4]_i_1_n_0\
    );
\DOUT_BUF_1_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \BIAS_1_reg_n_0_[1]\,
      Q => DOUT_BUF_1_1(1),
      R => \DOUT_BUF_1_1[4]_i_1_n_0\
    );
\DOUT_BUF_1_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \BIAS_1_reg_n_0_[2]\,
      Q => DOUT_BUF_1_1(2),
      R => \DOUT_BUF_1_1[4]_i_1_n_0\
    );
\DOUT_BUF_1_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \BIAS_1_reg_n_0_[3]\,
      Q => DOUT_BUF_1_1(3),
      R => \DOUT_BUF_1_1[4]_i_1_n_0\
    );
\DOUT_BUF_1_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => VALID_NXTLYR_PIX,
      D => \BIAS_1_reg_n_0_[4]\,
      Q => DOUT_BUF_1_1(4),
      R => \DOUT_BUF_1_1[4]_i_1_n_0\
    );
EN_LOC_STREAM_1_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => EN_LOC_STREAM_1,
      O => EN_LOC_STREAM_1_IBUF
    );
EN_NXT_LYR_1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFCCDFCCDFCCD0CC"
    )
        port map (
      I0 => \VALID_NXTLYR_PIX_reg_n_0_[2]\,
      I1 => \OUT_PIXEL_COUNT_reg__0\(4),
      I2 => Enable_ReLU,
      I3 => PIXEL_COUNT1,
      I4 => FRST_TIM_EN_1,
      I5 => EN_NXT_LYR_1_reg_n_0,
      O => EN_NXT_LYR_1_i_1_n_0
    );
EN_NXT_LYR_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => EN_NXT_LYR_1_i_1_n_0,
      Q => EN_NXT_LYR_1_reg_n_0,
      R => RST_IBUF
    );
EN_STREAM_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => EN_STREAM,
      O => EN_STREAM_IBUF
    );
EN_STREAM_OUT_1_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => EN_STREAM_OUT_1,
      T => '1'
    );
\Enable_BIAS_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => Enable_STAGE_2,
      I4 => Enable_BIAS,
      O => \Enable_BIAS_i_1__0_n_0\
    );
Enable_BIAS_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \Enable_BIAS_i_1__0_n_0\,
      Q => Enable_BIAS,
      R => RST_IBUF
    );
Enable_MULT_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => \TAIL_1_reg_n_0_[1]\,
      I1 => \TAIL_1_reg_n_0_[0]\,
      I2 => Async_Mode_1,
      I3 => PIXEL_COUNT1,
      I4 => Enable_MULT,
      O => Enable_MULT_i_1_n_0
    );
Enable_MULT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => Enable_MULT_i_1_n_0,
      Q => Enable_MULT,
      R => RST_IBUF
    );
\Enable_ReLU_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => Enable_BIAS,
      I4 => Enable_ReLU,
      O => \Enable_ReLU_i_1__0_n_0\
    );
Enable_ReLU_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \Enable_ReLU_i_1__0_n_0\,
      Q => Enable_ReLU,
      R => RST_IBUF
    );
Enable_STAGE_1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => Enable_MULT,
      I4 => Enable_STAGE_1,
      O => Enable_STAGE_1_i_1_n_0
    );
Enable_STAGE_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => Enable_STAGE_1_i_1_n_0,
      Q => Enable_STAGE_1,
      R => RST_IBUF
    );
Enable_STAGE_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => Enable_STAGE_1,
      I4 => Enable_STAGE_2,
      O => Enable_STAGE_2_i_1_n_0
    );
Enable_STAGE_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => Enable_STAGE_2_i_1_n_0,
      Q => Enable_STAGE_2,
      R => RST_IBUF
    );
\FIFO_ROW_1[0][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => WriteEn_1,
      I4 => \HEAD_1_reg_n_0_[0]\,
      I5 => \HEAD_1_reg_n_0_[1]\,
      O => \FIFO_ROW_1[0]\
    );
\FIFO_ROW_1[1][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => WriteEn_1,
      I4 => \HEAD_1_reg_n_0_[0]\,
      I5 => \HEAD_1_reg_n_0_[1]\,
      O => \FIFO_ROW_1[1]\
    );
\FIFO_ROW_1[2][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => WriteEn_1,
      I4 => \HEAD_1_reg_n_0_[1]\,
      I5 => \HEAD_1_reg_n_0_[0]\,
      O => \FIFO_ROW_1[2]\
    );
\FIFO_ROW_1[3][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => WriteEn_1,
      I4 => \HEAD_1_reg_n_0_[0]\,
      I5 => \HEAD_1_reg_n_0_[1]\,
      O => \FIFO_ROW_1[3]\
    );
\FIFO_ROW_1_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[0]\,
      D => \WINDOW_reg[0,_n_0_1][2]\,
      Q => \FIFO_ROW_1_reg[0]__0\(2),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[0]\,
      D => \WINDOW_reg[0,_n_0_1][3]\,
      Q => \FIFO_ROW_1_reg[0]__0\(3),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[0]\,
      D => \WINDOW_reg[0,_n_0_1][4]\,
      Q => \FIFO_ROW_1_reg[0]__0\(4),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[0]\,
      D => \WINDOW_reg[0,_n_0_1][5]\,
      Q => \FIFO_ROW_1_reg[0]__0\(5),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[0]\,
      D => \WINDOW_reg[0,_n_0_1][6]\,
      Q => \FIFO_ROW_1_reg[0]__0\(6),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[0]\,
      D => \WINDOW_reg[0,_n_0_1][7]\,
      Q => \FIFO_ROW_1_reg[0]__0\(7),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[1]\,
      D => \WINDOW_reg[0,_n_0_1][2]\,
      Q => \FIFO_ROW_1_reg[1]__0\(2),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[1]\,
      D => \WINDOW_reg[0,_n_0_1][3]\,
      Q => \FIFO_ROW_1_reg[1]__0\(3),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[1]\,
      D => \WINDOW_reg[0,_n_0_1][4]\,
      Q => \FIFO_ROW_1_reg[1]__0\(4),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[1]\,
      D => \WINDOW_reg[0,_n_0_1][5]\,
      Q => \FIFO_ROW_1_reg[1]__0\(5),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[1]\,
      D => \WINDOW_reg[0,_n_0_1][6]\,
      Q => \FIFO_ROW_1_reg[1]__0\(6),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[1]\,
      D => \WINDOW_reg[0,_n_0_1][7]\,
      Q => \FIFO_ROW_1_reg[1]__0\(7),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[2]\,
      D => \WINDOW_reg[0,_n_0_1][2]\,
      Q => \FIFO_ROW_1_reg[2]__0\(2),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[2]\,
      D => \WINDOW_reg[0,_n_0_1][3]\,
      Q => \FIFO_ROW_1_reg[2]__0\(3),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[2]\,
      D => \WINDOW_reg[0,_n_0_1][4]\,
      Q => \FIFO_ROW_1_reg[2]__0\(4),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[2]\,
      D => \WINDOW_reg[0,_n_0_1][5]\,
      Q => \FIFO_ROW_1_reg[2]__0\(5),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[2]\,
      D => \WINDOW_reg[0,_n_0_1][6]\,
      Q => \FIFO_ROW_1_reg[2]__0\(6),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[2]\,
      D => \WINDOW_reg[0,_n_0_1][7]\,
      Q => \FIFO_ROW_1_reg[2]__0\(7),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[3]\,
      D => \WINDOW_reg[0,_n_0_1][2]\,
      Q => \FIFO_ROW_1_reg[3]__0\(2),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[3]\,
      D => \WINDOW_reg[0,_n_0_1][3]\,
      Q => \FIFO_ROW_1_reg[3]__0\(3),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[3]\,
      D => \WINDOW_reg[0,_n_0_1][4]\,
      Q => \FIFO_ROW_1_reg[3]__0\(4),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[3]\,
      D => \WINDOW_reg[0,_n_0_1][5]\,
      Q => \FIFO_ROW_1_reg[3]__0\(5),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[3]\,
      D => \WINDOW_reg[0,_n_0_1][6]\,
      Q => \FIFO_ROW_1_reg[3]__0\(6),
      R => RST_IBUF
    );
\FIFO_ROW_1_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \FIFO_ROW_1[3]\,
      D => \WINDOW_reg[0,_n_0_1][7]\,
      Q => \FIFO_ROW_1_reg[3]__0\(7),
      R => RST_IBUF
    );
FRST_TIM_EN_1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00004000"
    )
        port map (
      I0 => \VALID_NXTLYR_PIX_reg_n_0_[2]\,
      I1 => Enable_ReLU,
      I2 => EN_STREAM_IBUF,
      I3 => EN_LOC_STREAM_1_IBUF,
      I4 => \OUT_PIXEL_COUNT_reg__0\(4),
      I5 => FRST_TIM_EN_1,
      O => FRST_TIM_EN_1_i_1_n_0
    );
FRST_TIM_EN_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => FRST_TIM_EN_1_i_1_n_0,
      Q => FRST_TIM_EN_1,
      R => RST_IBUF
    );
\HEAD_1[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF4000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => WriteEn_1,
      I4 => \HEAD_1_reg_n_0_[0]\,
      O => \HEAD_1[0]_i_1_n_0\
    );
\HEAD_1[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF7FFF00008000"
    )
        port map (
      I0 => \HEAD_1_reg_n_0_[0]\,
      I1 => WriteEn_1,
      I2 => EN_STREAM_IBUF,
      I3 => EN_LOC_STREAM_1_IBUF,
      I4 => \OUT_PIXEL_COUNT_reg__0\(4),
      I5 => \HEAD_1_reg_n_0_[1]\,
      O => \HEAD_1[1]_i_1_n_0\
    );
\HEAD_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \HEAD_1[0]_i_1_n_0\,
      Q => \HEAD_1_reg_n_0_[0]\,
      R => RST_IBUF
    );
\HEAD_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \HEAD_1[1]_i_1_n_0\,
      Q => \HEAD_1_reg_n_0_[1]\,
      R => RST_IBUF
    );
INTERNAL_RST_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => INTERNAL_RST_OBUF,
      O => INTERNAL_RST
    );
INTERNAL_RST_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \OUT_PIXEL_COUNT_reg__0\(4),
      D => \OUT_PIXEL_COUNT_reg__0\(4),
      Q => INTERNAL_RST_OBUF,
      R => RST_IBUF
    );
\MULT_1[1,0][3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][1]\,
      I1 => \WINDOW_reg[0,_n_0_1][3]\,
      O => \MULT_1[1,0][3]_i_2_n_0\
    );
\MULT_1[1,0][3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][0]\,
      I1 => \WINDOW_reg[0,_n_0_1][2]\,
      O => \MULT_1[1,0][3]_i_3_n_0\
    );
\MULT_1[1,0][3]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][1]\,
      O => \MULT_1[1,0][3]_i_4_n_0\
    );
\MULT_1[1,0][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Enable_MULT,
      I1 => EN_STREAM_IBUF,
      I2 => EN_LOC_STREAM_1_IBUF,
      I3 => \OUT_PIXEL_COUNT_reg__0\(4),
      O => Enable_STAGE_113_out
    );
\MULT_1[1,0][7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][7]\,
      I1 => \WINDOW_reg[0,_n_0_1][5]\,
      O => \MULT_1[1,0][7]_i_3_n_0\
    );
\MULT_1[1,0][7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][4]\,
      I1 => \WINDOW_reg[0,_n_0_1][6]\,
      O => \MULT_1[1,0][7]_i_4_n_0\
    );
\MULT_1[1,0][7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][3]\,
      I1 => \WINDOW_reg[0,_n_0_1][5]\,
      O => \MULT_1[1,0][7]_i_5_n_0\
    );
\MULT_1[1,0][7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \WINDOW_reg[0,_n_0_1][2]\,
      I1 => \WINDOW_reg[0,_n_0_1][4]\,
      O => \MULT_1[1,0][7]_i_6_n_0\
    );
\MULT_1_reg[0,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,1]__0\(3),
      Q => \MULT_1_reg[0,0]__0\(3),
      R => RST_IBUF
    );
\MULT_1_reg[0,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,1]__0\(4),
      Q => \MULT_1_reg[0,0]__0\(4),
      R => RST_IBUF
    );
\MULT_1_reg[0,0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,1]__0\(5),
      Q => \MULT_1_reg[0,0]__0\(5),
      R => RST_IBUF
    );
\MULT_1_reg[0,0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,1]__0\(6),
      Q => \MULT_1_reg[0,0]__0\(6),
      R => RST_IBUF
    );
\MULT_1_reg[0,0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,1]__0\(7),
      Q => \MULT_1_reg[0,0]__0\(7),
      R => RST_IBUF
    );
\MULT_1_reg[0,1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,0]__0\(2),
      Q => L(0),
      R => RST_IBUF
    );
\MULT_1_reg[0,1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,0]__0\(3),
      Q => L(1),
      R => RST_IBUF
    );
\MULT_1_reg[0,1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,0]__0\(4),
      Q => L(2),
      R => RST_IBUF
    );
\MULT_1_reg[0,1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,0]__0\(5),
      Q => L(3),
      R => RST_IBUF
    );
\MULT_1_reg[0,1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[1,0]__0\(6),
      Q => L(4),
      R => RST_IBUF
    );
\MULT_1_reg[1,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => multOp(3),
      Q => R(0),
      R => RST_IBUF
    );
\MULT_1_reg[1,0][3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \MULT_1_reg[1,0][3]_i_1_n_0\,
      CO(2) => \MULT_1_reg[1,0][3]_i_1_n_1\,
      CO(1) => \MULT_1_reg[1,0][3]_i_1_n_2\,
      CO(0) => \MULT_1_reg[1,0][3]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \WINDOW_reg[0,_n_0_1][1]\,
      DI(2) => \WINDOW_reg[0,_n_0_1][0]\,
      DI(1 downto 0) => B"01",
      O(3) => multOp(3),
      O(2 downto 0) => \NLW_MULT_1_reg[1,0][3]_i_1_O_UNCONNECTED\(2 downto 0),
      S(3) => \MULT_1[1,0][3]_i_2_n_0\,
      S(2) => \MULT_1[1,0][3]_i_3_n_0\,
      S(1) => \MULT_1[1,0][3]_i_4_n_0\,
      S(0) => \WINDOW_reg[0,_n_0_1][0]\
    );
\MULT_1_reg[1,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => multOp(4),
      Q => R(1),
      R => RST_IBUF
    );
\MULT_1_reg[1,0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => multOp(5),
      Q => R(2),
      R => RST_IBUF
    );
\MULT_1_reg[1,0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => multOp(6),
      Q => R(3),
      R => RST_IBUF
    );
\MULT_1_reg[1,0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => multOp(7),
      Q => R(4),
      R => RST_IBUF
    );
\MULT_1_reg[1,0][7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \MULT_1_reg[1,0][3]_i_1_n_0\,
      CO(3) => \NLW_MULT_1_reg[1,0][7]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \MULT_1_reg[1,0][7]_i_2_n_1\,
      CO(1) => \MULT_1_reg[1,0][7]_i_2_n_2\,
      CO(0) => \MULT_1_reg[1,0][7]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \WINDOW_reg[0,_n_0_1][4]\,
      DI(1) => \WINDOW_reg[0,_n_0_1][3]\,
      DI(0) => \WINDOW_reg[0,_n_0_1][2]\,
      O(3 downto 0) => multOp(7 downto 4),
      S(3) => \MULT_1[1,0][7]_i_3_n_0\,
      S(2) => \MULT_1[1,0][7]_i_4_n_0\,
      S(1) => \MULT_1[1,0][7]_i_5_n_0\,
      S(0) => \MULT_1[1,0][7]_i_6_n_0\
    );
\MULT_1_reg[1,1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[0,_n_0_0][2]\,
      Q => \MULT_1_reg[1,_n_0_1][3]\,
      R => RST_IBUF
    );
\MULT_1_reg[1,1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[0,_n_0_0][3]\,
      Q => \MULT_1_reg[1,_n_0_1][4]\,
      R => RST_IBUF
    );
\MULT_1_reg[1,1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[0,_n_0_0][4]\,
      Q => \MULT_1_reg[1,_n_0_1][5]\,
      R => RST_IBUF
    );
\MULT_1_reg[1,1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[0,_n_0_0][5]\,
      Q => \MULT_1_reg[1,_n_0_1][6]\,
      R => RST_IBUF
    );
\MULT_1_reg[1,1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => Enable_STAGE_113_out,
      D => \WINDOW_reg[0,_n_0_0][6]\,
      Q => \MULT_1_reg[1,_n_0_1][7]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      O => \p_0_in__2\(0)
    );
\OUT_PIXEL_COUNT[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      O => \p_0_in__2\(1)
    );
\OUT_PIXEL_COUNT[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      I2 => \OUT_PIXEL_COUNT_reg_n_0_[2]\,
      O => \p_0_in__2\(2)
    );
\OUT_PIXEL_COUNT[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[3]\,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I2 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      I3 => \OUT_PIXEL_COUNT_reg_n_0_[2]\,
      O => \p_0_in__2\(3)
    );
\OUT_PIXEL_COUNT[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      I3 => Enable_ReLU,
      I4 => \VALID_NXTLYR_PIX_reg_n_0_[2]\,
      O => FRST_TIM_EN_15_out
    );
\OUT_PIXEL_COUNT[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg_n_0_[2]\,
      I1 => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      I2 => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      I3 => \OUT_PIXEL_COUNT_reg_n_0_[3]\,
      O => \p_0_in__2\(4)
    );
\OUT_PIXEL_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => FRST_TIM_EN_15_out,
      D => \p_0_in__2\(0),
      Q => \OUT_PIXEL_COUNT_reg_n_0_[0]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => FRST_TIM_EN_15_out,
      D => \p_0_in__2\(1),
      Q => \OUT_PIXEL_COUNT_reg_n_0_[1]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => FRST_TIM_EN_15_out,
      D => \p_0_in__2\(2),
      Q => \OUT_PIXEL_COUNT_reg_n_0_[2]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => FRST_TIM_EN_15_out,
      D => \p_0_in__2\(3),
      Q => \OUT_PIXEL_COUNT_reg_n_0_[3]\,
      R => RST_IBUF
    );
\OUT_PIXEL_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => FRST_TIM_EN_15_out,
      D => \p_0_in__2\(4),
      Q => \OUT_PIXEL_COUNT_reg__0\(4),
      R => RST_IBUF
    );
\PIXEL_COUNT[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \PIXEL_COUNT_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\PIXEL_COUNT[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \PIXEL_COUNT_reg__0\(0),
      I1 => \PIXEL_COUNT_reg__0\(1),
      O => \p_0_in__0\(1)
    );
\PIXEL_COUNT[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \PIXEL_COUNT_reg__0\(0),
      I1 => \PIXEL_COUNT_reg__0\(1),
      I2 => \PIXEL_COUNT_reg__0\(2),
      O => \p_0_in__0\(2)
    );
\PIXEL_COUNT[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \PIXEL_COUNT_reg__0\(3),
      I1 => \PIXEL_COUNT_reg__0\(0),
      I2 => \PIXEL_COUNT_reg__0\(1),
      I3 => \PIXEL_COUNT_reg__0\(2),
      O => \p_0_in__0\(3)
    );
\PIXEL_COUNT[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => \PIXEL_COUNT_reg__0\(0),
      I1 => \PIXEL_COUNT_reg__0\(1),
      I2 => \PIXEL_COUNT_reg__0\(3),
      I3 => \PIXEL_COUNT_reg__0\(4),
      I4 => \PIXEL_COUNT_reg__0\(2),
      I5 => PIXEL_COUNT1,
      O => \PIXEL_COUNT[4]_i_1_n_0\
    );
\PIXEL_COUNT[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \PIXEL_COUNT_reg__0\(4),
      I1 => \PIXEL_COUNT_reg__0\(2),
      I2 => \PIXEL_COUNT_reg__0\(1),
      I3 => \PIXEL_COUNT_reg__0\(0),
      I4 => \PIXEL_COUNT_reg__0\(3),
      O => \p_0_in__0\(4)
    );
\PIXEL_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \PIXEL_COUNT[4]_i_1_n_0\,
      D => \p_0_in__0\(0),
      Q => \PIXEL_COUNT_reg__0\(0),
      R => RST_IBUF
    );
\PIXEL_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \PIXEL_COUNT[4]_i_1_n_0\,
      D => \p_0_in__0\(1),
      Q => \PIXEL_COUNT_reg__0\(1),
      R => RST_IBUF
    );
\PIXEL_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \PIXEL_COUNT[4]_i_1_n_0\,
      D => \p_0_in__0\(2),
      Q => \PIXEL_COUNT_reg__0\(2),
      R => RST_IBUF
    );
\PIXEL_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \PIXEL_COUNT[4]_i_1_n_0\,
      D => \p_0_in__0\(3),
      Q => \PIXEL_COUNT_reg__0\(3),
      R => RST_IBUF
    );
\PIXEL_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \PIXEL_COUNT[4]_i_1_n_0\,
      D => \p_0_in__0\(4),
      Q => \PIXEL_COUNT_reg__0\(4),
      R => RST_IBUF
    );
POOL_LYR_2: entity work.POOL_LAYER_2
     port map (
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      \DOUT_BUF_1_1_reg[4]\(4 downto 0) => DOUT_BUF_1_1(4 downto 0),
      EN_NXT_LYR_1_reg => EN_NXT_LYR_1_reg_n_0,
      EN_STREAM_IBUF => EN_STREAM_IBUF,
      Q(4 downto 0) => DOUT_2_1_OBUF(4 downto 0),
      RST_IBUF => RST_IBUF
    );
RST_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RST,
      O => RST_IBUF
    );
ReadEn_1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0080"
    )
        port map (
      I0 => PIXEL_COUNT1,
      I1 => WriteEn_1,
      I2 => \HEAD_1_reg_n_0_[1]\,
      I3 => \HEAD_1_reg_n_0_[0]\,
      I4 => Async_Mode_1,
      O => ReadEn_1_i_1_n_0
    );
ReadEn_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => ReadEn_1_i_1_n_0,
      Q => Async_Mode_1,
      R => RST_IBUF
    );
\TAIL_1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00004000"
    )
        port map (
      I0 => RST_IBUF,
      I1 => Async_Mode_1,
      I2 => EN_STREAM_IBUF,
      I3 => EN_LOC_STREAM_1_IBUF,
      I4 => \OUT_PIXEL_COUNT_reg__0\(4),
      I5 => \TAIL_1_reg_n_0_[0]\,
      O => \TAIL_1[0]_i_1_n_0\
    );
\TAIL_1[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F0080"
    )
        port map (
      I0 => \TAIL_1_reg_n_0_[0]\,
      I1 => PIXEL_COUNT1,
      I2 => Async_Mode_1,
      I3 => RST_IBUF,
      I4 => \TAIL_1_reg_n_0_[1]\,
      O => \TAIL_1[1]_i_1_n_0\
    );
\TAIL_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \TAIL_1[0]_i_1_n_0\,
      Q => \TAIL_1_reg_n_0_[0]\,
      R => '0'
    );
\TAIL_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \TAIL_1[1]_i_1_n_0\,
      Q => \TAIL_1_reg_n_0_[1]\,
      R => '0'
    );
\VALID_NXTLYR_PIX[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FFFD000"
    )
        port map (
      I0 => \VALID_NXTLYR_PIX_reg_n_0_[2]\,
      I1 => \VALID_NXTLYR_PIX_reg_n_0_[1]\,
      I2 => Enable_ReLU,
      I3 => PIXEL_COUNT1,
      I4 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      O => \VALID_NXTLYR_PIX[0]_i_1_n_0\
    );
\VALID_NXTLYR_PIX[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF7FFF00008000"
    )
        port map (
      I0 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      I1 => Enable_ReLU,
      I2 => EN_STREAM_IBUF,
      I3 => EN_LOC_STREAM_1_IBUF,
      I4 => \OUT_PIXEL_COUNT_reg__0\(4),
      I5 => \VALID_NXTLYR_PIX_reg_n_0_[1]\,
      O => \VALID_NXTLYR_PIX[1]_i_1_n_0\
    );
\VALID_NXTLYR_PIX[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6FFF8000"
    )
        port map (
      I0 => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      I1 => \VALID_NXTLYR_PIX_reg_n_0_[1]\,
      I2 => Enable_ReLU,
      I3 => PIXEL_COUNT1,
      I4 => \VALID_NXTLYR_PIX_reg_n_0_[2]\,
      O => \VALID_NXTLYR_PIX[2]_i_1_n_0\
    );
\VALID_NXTLYR_PIX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \VALID_NXTLYR_PIX[0]_i_1_n_0\,
      Q => \VALID_NXTLYR_PIX_reg_n_0_[0]\,
      R => RST_IBUF
    );
\VALID_NXTLYR_PIX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \VALID_NXTLYR_PIX[1]_i_1_n_0\,
      Q => \VALID_NXTLYR_PIX_reg_n_0_[1]\,
      R => RST_IBUF
    );
\VALID_NXTLYR_PIX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \VALID_NXTLYR_PIX[2]_i_1_n_0\,
      Q => \VALID_NXTLYR_PIX_reg_n_0_[2]\,
      R => RST_IBUF
    );
VALID_OUT_1_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => VALID_OUT_1,
      T => '1'
    );
\WINDOW[0,0][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \OUT_PIXEL_COUNT_reg__0\(4),
      I1 => EN_LOC_STREAM_1_IBUF,
      I2 => EN_STREAM_IBUF,
      O => PIXEL_COUNT1
    );
\WINDOW[1,0][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \FIFO_ROW_1_reg[1]__0\(2),
      I1 => \FIFO_ROW_1_reg[2]__0\(2),
      I2 => \FIFO_ROW_1_reg[0]__0\(2),
      I3 => \TAIL_1_reg_n_0_[0]\,
      I4 => \TAIL_1_reg_n_0_[1]\,
      I5 => \FIFO_ROW_1_reg[3]__0\(2),
      O => \WINDOW[1,0][2]_i_1_n_0\
    );
\WINDOW[1,0][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \FIFO_ROW_1_reg[0]__0\(3),
      I1 => \FIFO_ROW_1_reg[1]__0\(3),
      I2 => \FIFO_ROW_1_reg[2]__0\(3),
      I3 => \TAIL_1_reg_n_0_[1]\,
      I4 => \TAIL_1_reg_n_0_[0]\,
      I5 => \FIFO_ROW_1_reg[3]__0\(3),
      O => \WINDOW[1,0][3]_i_1_n_0\
    );
\WINDOW[1,0][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \FIFO_ROW_1_reg[0]__0\(4),
      I1 => \FIFO_ROW_1_reg[1]__0\(4),
      I2 => \FIFO_ROW_1_reg[3]__0\(4),
      I3 => \TAIL_1_reg_n_0_[0]\,
      I4 => \TAIL_1_reg_n_0_[1]\,
      I5 => \FIFO_ROW_1_reg[2]__0\(4),
      O => \WINDOW[1,0][4]_i_1_n_0\
    );
\WINDOW[1,0][5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \FIFO_ROW_1_reg[0]__0\(5),
      I1 => \FIFO_ROW_1_reg[1]__0\(5),
      I2 => \FIFO_ROW_1_reg[2]__0\(5),
      I3 => \TAIL_1_reg_n_0_[1]\,
      I4 => \TAIL_1_reg_n_0_[0]\,
      I5 => \FIFO_ROW_1_reg[3]__0\(5),
      O => \WINDOW[1,0][5]_i_1_n_0\
    );
\WINDOW[1,0][6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \FIFO_ROW_1_reg[1]__0\(6),
      I1 => \FIFO_ROW_1_reg[3]__0\(6),
      I2 => \FIFO_ROW_1_reg[0]__0\(6),
      I3 => \TAIL_1_reg_n_0_[0]\,
      I4 => \TAIL_1_reg_n_0_[1]\,
      I5 => \FIFO_ROW_1_reg[2]__0\(6),
      O => \WINDOW[1,0][6]_i_1_n_0\
    );
\WINDOW[1,0][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => Async_Mode_1,
      I1 => EN_STREAM_IBUF,
      I2 => EN_LOC_STREAM_1_IBUF,
      I3 => \OUT_PIXEL_COUNT_reg__0\(4),
      O => \WINDOW[1,0]\
    );
\WINDOW[1,0][7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \FIFO_ROW_1_reg[1]__0\(7),
      I1 => \FIFO_ROW_1_reg[2]__0\(7),
      I2 => \FIFO_ROW_1_reg[0]__0\(7),
      I3 => \TAIL_1_reg_n_0_[0]\,
      I4 => \TAIL_1_reg_n_0_[1]\,
      I5 => \FIFO_ROW_1_reg[3]__0\(7),
      O => \WINDOW[1,0][7]_i_2_n_0\
    );
\WINDOW_reg[0,0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => DIN_IBUF(0),
      Q => \WINDOW_reg[0,_n_0_0][0]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => DIN_IBUF(1),
      Q => \WINDOW_reg[0,_n_0_0][1]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => DIN_IBUF(2),
      Q => \WINDOW_reg[0,_n_0_0][2]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => DIN_IBUF(3),
      Q => \WINDOW_reg[0,_n_0_0][3]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => DIN_IBUF(4),
      Q => \WINDOW_reg[0,_n_0_0][4]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => DIN_IBUF(5),
      Q => \WINDOW_reg[0,_n_0_0][5]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => DIN_IBUF(6),
      Q => \WINDOW_reg[0,_n_0_0][6]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => DIN_IBUF(7),
      Q => \WINDOW_reg[0,_n_0_0][7]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[0,_n_0_0][0]\,
      Q => \WINDOW_reg[0,_n_0_1][0]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[0,_n_0_0][1]\,
      Q => \WINDOW_reg[0,_n_0_1][1]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[0,_n_0_0][2]\,
      Q => \WINDOW_reg[0,_n_0_1][2]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[0,_n_0_0][3]\,
      Q => \WINDOW_reg[0,_n_0_1][3]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[0,_n_0_0][4]\,
      Q => \WINDOW_reg[0,_n_0_1][4]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[0,_n_0_0][5]\,
      Q => \WINDOW_reg[0,_n_0_1][5]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[0,_n_0_0][6]\,
      Q => \WINDOW_reg[0,_n_0_1][6]\,
      R => RST_IBUF
    );
\WINDOW_reg[0,1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[0,_n_0_0][7]\,
      Q => \WINDOW_reg[0,_n_0_1][7]\,
      R => RST_IBUF
    );
\WINDOW_reg[1,0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[1,0]\,
      D => \WINDOW[1,0][2]_i_1_n_0\,
      Q => \WINDOW_reg[1,0]__0\(2),
      R => RST_IBUF
    );
\WINDOW_reg[1,0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[1,0]\,
      D => \WINDOW[1,0][3]_i_1_n_0\,
      Q => \WINDOW_reg[1,0]__0\(3),
      R => RST_IBUF
    );
\WINDOW_reg[1,0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[1,0]\,
      D => \WINDOW[1,0][4]_i_1_n_0\,
      Q => \WINDOW_reg[1,0]__0\(4),
      R => RST_IBUF
    );
\WINDOW_reg[1,0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[1,0]\,
      D => \WINDOW[1,0][5]_i_1_n_0\,
      Q => \WINDOW_reg[1,0]__0\(5),
      R => RST_IBUF
    );
\WINDOW_reg[1,0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[1,0]\,
      D => \WINDOW[1,0][6]_i_1_n_0\,
      Q => \WINDOW_reg[1,0]__0\(6),
      R => RST_IBUF
    );
\WINDOW_reg[1,0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \WINDOW[1,0]\,
      D => \WINDOW[1,0][7]_i_2_n_0\,
      Q => \WINDOW_reg[1,0]__0\(7),
      R => RST_IBUF
    );
\WINDOW_reg[1,1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[1,0]__0\(3),
      Q => \WINDOW_reg[1,1]__0\(3),
      R => RST_IBUF
    );
\WINDOW_reg[1,1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[1,0]__0\(4),
      Q => \WINDOW_reg[1,1]__0\(4),
      R => RST_IBUF
    );
\WINDOW_reg[1,1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[1,0]__0\(5),
      Q => \WINDOW_reg[1,1]__0\(5),
      R => RST_IBUF
    );
\WINDOW_reg[1,1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[1,0]__0\(6),
      Q => \WINDOW_reg[1,1]__0\(6),
      R => RST_IBUF
    );
\WINDOW_reg[1,1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => PIXEL_COUNT1,
      D => \WINDOW_reg[1,0]__0\(7),
      Q => \WINDOW_reg[1,1]__0\(7),
      R => RST_IBUF
    );
WriteEn_1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF1000"
    )
        port map (
      I0 => WriteEn_1_i_2_n_0,
      I1 => \OUT_PIXEL_COUNT_reg__0\(4),
      I2 => EN_LOC_STREAM_1_IBUF,
      I3 => EN_STREAM_IBUF,
      I4 => WriteEn_1,
      O => WriteEn_1_i_1_n_0
    );
WriteEn_1_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => \PIXEL_COUNT_reg__0\(2),
      I1 => \PIXEL_COUNT_reg__0\(4),
      I2 => \PIXEL_COUNT_reg__0\(3),
      I3 => \PIXEL_COUNT_reg__0\(1),
      I4 => \PIXEL_COUNT_reg__0\(0),
      O => WriteEn_1_i_2_n_0
    );
WriteEn_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => WriteEn_1_i_1_n_0,
      Q => WriteEn_1,
      R => RST_IBUF
    );
end STRUCTURE;
