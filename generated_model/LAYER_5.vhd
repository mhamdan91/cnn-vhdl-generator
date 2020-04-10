------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Thu Apr 09 20:05:50 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    Flatten - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Number of Total Operaiton: 4
-- Number of Clock Cycles: 8
-- Number of GOPS = 0.0
-- Number of Clock Cycles till FC1: 34
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity Flatten_LAYER_5 is

GENERIC
 	( 
	constant PERCISION      : positive := 5; 	
	constant DOUT_WIDTH     : positive := 5; 	
	constant BIAS_SIZE      : positive := 5;	
	constant PF_X2_SIZE     : positive := 25;
	constant MULT_SIZE      : positive := 10;	
	constant DIN_WIDTH      : positive := 5;	
	constant IMAGE_WIDTH    : positive := 5;	
	constant IMAGE_SIZE     : positive := 1024;	
	constant F_SIZE         : positive := 5;	
	constant WEIGHT_SIZE    : positive := 5;	
	constant BIASES_SIZE	: positive := 2;
	constant PADDING        : positive := 1;	
	constant STRIDE         : positive := 1;	
	constant FEATURE_MAPS   : positive := 16;	
	constant VALID_CYCLES   : positive := 25;	
	constant STRIDE_CYCLES  : positive := 4;	
	constant VALID_LOCAL_PIX: positive := 5;	
	constant ADD_TREE_DEPTH : positive := 5;	
	constant INPUT_DEPTH    : positive := 4;
	constant FIFO_DEPTH     : positive := 1;	
	constant MULT_SUM_D_1   : positive := 8;
	constant MULT_SUM_SIZE_1: positive := 6;
	constant MULT_SUM_D_2   : positive := 4;
	constant MULT_SUM_SIZE_2: positive := 6;
	constant MULT_SUM_D_3   : positive := 2;
	constant MULT_SUM_SIZE_3: positive := 6;
	constant MULT_SUM_D_4   : positive := 1;
	constant MULT_SUM_SIZE_4: positive := 6;
	constant ADD_1        : positive := 13;    	
	constant ADD_SIZE_1   : positive := 6;   	
	constant ADD_2        : positive := 7;    	
	constant ADD_SIZE_2   : positive := 6;   	
	constant ADD_3        : positive := 4;    	
	constant ADD_SIZE_3   : positive := 6;   	
	constant ADD_4        : positive := 2;    	
	constant ADD_SIZE_4   : positive := 6;   	
	constant ADD_5        : positive := 1;    	
	constant ADD_SIZE_5   : positive := 6;   	
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN_1_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_2_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_3_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_4_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_5_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_6_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_7_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_8_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_9_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_10_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_11_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_12_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_13_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_14_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_15_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_16_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	CLK,RST         :IN std_logic;
   	DIS_STREAM      :OUT std_logic; 					-- S_AXIS_TVALID  : Data in is valid
   	EN_STREAM       :IN std_logic; 						-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_5     :OUT std_logic; 				-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_5         :OUT std_logic;                             -- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_5 :IN std_logic;
	DOUT_1_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_3_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_4_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_5_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_6_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_7_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_8_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_9_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_10_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST        :OUT std_logic
	);	

end Flatten_LAYER_5;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of Flatten_LAYER_5 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(WEIGHT_SIZE- 1 downto 0);
type       FIFO_Memory             is array (0 to FIFO_DEPTH - 1)          of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
type       SLIDING_WINDOW          is array (0 to F_SIZE-1, 0 to F_SIZE-1) of STD_LOGIC_VECTOR(DIN_WIDTH- 1 downto 0);
signal     VALID_NXTLYR_PIX        :integer range 0 to STRIDE_CYCLES;
signal     PIXEL_COUNT             :integer range 0 to VALID_CYCLES;
signal     OUT_PIXEL_COUNT         :integer range 0 to VALID_CYCLES;
signal     EN_NXT_LYR_5            :std_logic;
signal     FRST_TIM_EN_5           :std_logic;
signal     Enable_ONEHOT             :std_logic;
signal     SIG_STRIDE              :integer range 0 to IMAGE_SIZE;
signal     PADDING_count           :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     ROW_COUNT               :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     WINDOW_1:SLIDING_WINDOW; 
signal     WINDOW_2:SLIDING_WINDOW; 
signal     WINDOW_3:SLIDING_WINDOW; 
signal     WINDOW_4:SLIDING_WINDOW; 
signal     WINDOW_5:SLIDING_WINDOW; 
signal     WINDOW_6:SLIDING_WINDOW; 
signal     WINDOW_7:SLIDING_WINDOW; 
signal     WINDOW_8:SLIDING_WINDOW; 
signal     WINDOW_9:SLIDING_WINDOW; 
signal     WINDOW_10:SLIDING_WINDOW; 
signal     WINDOW_11:SLIDING_WINDOW; 
signal     WINDOW_12:SLIDING_WINDOW; 
signal     WINDOW_13:SLIDING_WINDOW; 
signal     WINDOW_14:SLIDING_WINDOW; 
signal     WINDOW_15:SLIDING_WINDOW; 
signal     WINDOW_16:SLIDING_WINDOW; 


------------------------------ INTERNAL DYNAMIC SIGNALS DECLARATION ARRAY TYPE- START---------------------------------------------

signal DOUT_BUF_1_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_2_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_3_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_4_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_5_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_6_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_7_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_8_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_9_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_10_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_11_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_12_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_13_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_14_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_15_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_16_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_17_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_18_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_19_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_20_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_21_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_22_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_23_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_24_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_25_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_26_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_27_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_28_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_29_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_30_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_31_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_32_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_33_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_34_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_35_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_36_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_37_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_38_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_39_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_40_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_41_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_42_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_43_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_44_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_45_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_46_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_47_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_48_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_49_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_50_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_51_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_52_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_53_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_54_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_55_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_56_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_57_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_58_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_59_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_60_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_61_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_62_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_63_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_64_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_65_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_66_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_67_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_68_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_69_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_70_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_71_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_72_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_73_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_74_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_75_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_76_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_77_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_78_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_79_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_80_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_81_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_82_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_83_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_84_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_85_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_86_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_87_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_88_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_89_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_90_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_91_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_92_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_93_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_94_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_95_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_96_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_97_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_98_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_99_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_100_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_101_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_102_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_103_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_104_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_105_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_106_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_107_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_108_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_109_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_110_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_111_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_112_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_113_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_114_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_115_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_116_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_117_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_118_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_119_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_120_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_121_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_122_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_123_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_124_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_125_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_126_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_127_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_128_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_129_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_130_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_131_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_132_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_133_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_134_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_135_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_136_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_137_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_138_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_139_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_140_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_141_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_142_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_143_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_144_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_145_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_146_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_147_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_148_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_149_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_150_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_151_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_152_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_153_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_154_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_155_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_156_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_157_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_158_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_159_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_160_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_161_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_162_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_163_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_164_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_165_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_166_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_167_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_168_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_169_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_170_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_171_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_172_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_173_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_174_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_175_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_176_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_177_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_178_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_179_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_180_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_181_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_182_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_183_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_184_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_185_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_186_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_187_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_188_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_189_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_190_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_191_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_192_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_193_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_194_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_195_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_196_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_197_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_198_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_199_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_200_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_201_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_202_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_203_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_204_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_205_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_206_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_207_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_208_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_209_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_210_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_211_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_212_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_213_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_214_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_215_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_216_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_217_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_218_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_219_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_220_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_221_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_222_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_223_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_224_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_225_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_226_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_227_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_228_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_229_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_230_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_231_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_232_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_233_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_234_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_235_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_236_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_237_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_238_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_239_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_240_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_241_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_242_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_243_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_244_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_245_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_246_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_247_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_248_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_249_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_250_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_251_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_252_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_253_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_254_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_255_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_256_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_257_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_258_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_259_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_260_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_261_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_262_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_263_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_264_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_265_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_266_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_267_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_268_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_269_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_270_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_271_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_272_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_273_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_274_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_275_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_276_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_277_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_278_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_279_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_280_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_281_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_282_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_283_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_284_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_285_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_286_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_287_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_288_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_289_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_290_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_291_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_292_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_293_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_294_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_295_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_296_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_297_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_298_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_299_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_300_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_301_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_302_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_303_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_304_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_305_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_306_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_307_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_308_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_309_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_310_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_311_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_312_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_313_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_314_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_315_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_316_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_317_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_318_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_319_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_320_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_321_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_322_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_323_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_324_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_325_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_326_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_327_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_328_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_329_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_330_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_331_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_332_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_333_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_334_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_335_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_336_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_337_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_338_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_339_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_340_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_341_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_342_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_343_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_344_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_345_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_346_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_347_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_348_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_349_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_350_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_351_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_352_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_353_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_354_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_355_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_356_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_357_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_358_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_359_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_360_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_361_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_362_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_363_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_364_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_365_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_366_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_367_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_368_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_369_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_370_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_371_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_372_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_373_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_374_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_375_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_376_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_377_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_378_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_379_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_380_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_381_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_382_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_383_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_384_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_385_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_386_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_387_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_388_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_389_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_390_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_391_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_392_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_393_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_394_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_395_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_396_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_397_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_398_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_399_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_400_5	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);


-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_2_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_3_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_4_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_5_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_6_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_7_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_8_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_9_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_10_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal EN_STREAM_OUT_6	 : std_logic;
signal VALID_OUT_6       : std_logic;

---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT FC_LAYER_6
    port(	CLK,RST			:IN std_logic;
		DIN_1_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_2_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_3_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_4_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_5_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_6_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_7_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_8_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_9_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_10_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_11_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_12_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_13_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_14_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_15_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_16_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_17_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_18_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_19_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_20_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_21_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_22_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_23_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_24_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_25_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_26_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_27_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_28_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_29_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_30_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_31_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_32_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_33_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_34_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_35_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_36_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_37_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_38_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_39_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_40_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_41_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_42_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_43_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_44_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_45_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_46_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_47_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_48_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_49_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_50_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_51_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_52_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_53_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_54_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_55_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_56_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_57_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_58_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_59_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_60_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_61_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_62_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_63_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_64_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_65_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_66_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_67_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_68_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_69_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_70_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_71_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_72_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_73_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_74_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_75_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_76_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_77_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_78_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_79_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_80_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_81_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_82_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_83_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_84_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_85_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_86_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_87_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_88_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_89_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_90_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_91_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_92_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_93_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_94_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_95_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_96_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_97_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_98_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_99_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_100_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_101_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_102_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_103_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_104_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_105_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_106_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_107_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_108_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_109_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_110_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_111_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_112_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_113_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_114_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_115_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_116_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_117_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_118_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_119_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_120_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_121_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_122_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_123_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_124_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_125_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_126_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_127_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_128_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_129_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_130_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_131_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_132_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_133_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_134_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_135_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_136_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_137_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_138_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_139_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_140_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_141_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_142_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_143_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_144_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_145_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_146_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_147_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_148_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_149_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_150_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_151_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_152_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_153_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_154_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_155_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_156_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_157_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_158_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_159_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_160_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_161_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_162_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_163_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_164_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_165_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_166_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_167_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_168_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_169_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_170_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_171_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_172_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_173_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_174_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_175_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_176_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_177_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_178_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_179_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_180_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_181_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_182_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_183_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_184_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_185_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_186_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_187_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_188_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_189_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_190_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_191_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_192_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_193_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_194_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_195_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_196_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_197_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_198_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_199_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_200_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_201_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_202_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_203_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_204_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_205_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_206_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_207_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_208_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_209_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_210_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_211_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_212_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_213_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_214_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_215_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_216_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_217_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_218_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_219_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_220_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_221_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_222_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_223_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_224_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_225_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_226_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_227_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_228_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_229_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_230_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_231_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_232_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_233_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_234_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_235_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_236_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_237_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_238_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_239_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_240_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_241_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_242_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_243_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_244_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_245_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_246_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_247_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_248_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_249_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_250_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_251_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_252_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_253_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_254_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_255_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_256_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_257_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_258_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_259_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_260_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_261_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_262_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_263_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_264_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_265_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_266_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_267_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_268_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_269_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_270_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_271_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_272_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_273_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_274_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_275_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_276_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_277_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_278_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_279_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_280_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_281_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_282_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_283_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_284_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_285_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_286_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_287_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_288_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_289_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_290_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_291_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_292_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_293_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_294_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_295_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_296_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_297_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_298_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_299_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_300_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_301_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_302_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_303_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_304_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_305_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_306_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_307_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_308_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_309_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_310_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_311_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_312_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_313_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_314_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_315_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_316_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_317_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_318_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_319_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_320_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_321_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_322_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_323_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_324_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_325_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_326_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_327_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_328_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_329_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_330_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_331_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_332_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_333_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_334_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_335_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_336_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_337_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_338_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_339_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_340_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_341_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_342_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_343_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_344_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_345_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_346_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_347_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_348_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_349_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_350_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_351_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_352_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_353_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_354_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_355_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_356_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_357_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_358_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_359_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_360_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_361_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_362_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_363_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_364_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_365_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_366_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_367_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_368_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_369_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_370_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_371_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_372_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_373_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_374_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_375_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_376_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_377_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_378_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_379_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_380_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_381_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_382_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_383_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_384_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_385_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_386_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_387_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_388_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_389_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_390_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_391_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_392_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_393_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_394_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_395_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_396_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_397_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_398_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_399_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_400_6		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		EN_STREAM_OUT_6	:OUT std_logic;
		VALID_OUT_6		:OUT std_logic;
		DOUT_1_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_2_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_3_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_4_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_5_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_6_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_7_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_8_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_9_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_10_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		EN_STREAM		:IN std_logic;
		EN_LOC_STREAM_6	:IN std_logic
      			);
END COMPONENT FC_LAYER_6;

begin

FC_LYR_6 : FC_LAYER_6 
          port map(
          CLK                 => CLK,
          RST                 => RST,
          DIN_1_6             => DOUT_BUF_1_5,
          DIN_2_6             => DOUT_BUF_2_5,
          DIN_3_6             => DOUT_BUF_3_5,
          DIN_4_6             => DOUT_BUF_4_5,
          DIN_5_6             => DOUT_BUF_5_5,
          DIN_6_6             => DOUT_BUF_6_5,
          DIN_7_6             => DOUT_BUF_7_5,
          DIN_8_6             => DOUT_BUF_8_5,
          DIN_9_6             => DOUT_BUF_9_5,
          DIN_10_6             => DOUT_BUF_10_5,
          DIN_11_6             => DOUT_BUF_11_5,
          DIN_12_6             => DOUT_BUF_12_5,
          DIN_13_6             => DOUT_BUF_13_5,
          DIN_14_6             => DOUT_BUF_14_5,
          DIN_15_6             => DOUT_BUF_15_5,
          DIN_16_6             => DOUT_BUF_16_5,
          DIN_17_6             => DOUT_BUF_17_5,
          DIN_18_6             => DOUT_BUF_18_5,
          DIN_19_6             => DOUT_BUF_19_5,
          DIN_20_6             => DOUT_BUF_20_5,
          DIN_21_6             => DOUT_BUF_21_5,
          DIN_22_6             => DOUT_BUF_22_5,
          DIN_23_6             => DOUT_BUF_23_5,
          DIN_24_6             => DOUT_BUF_24_5,
          DIN_25_6             => DOUT_BUF_25_5,
          DIN_26_6             => DOUT_BUF_26_5,
          DIN_27_6             => DOUT_BUF_27_5,
          DIN_28_6             => DOUT_BUF_28_5,
          DIN_29_6             => DOUT_BUF_29_5,
          DIN_30_6             => DOUT_BUF_30_5,
          DIN_31_6             => DOUT_BUF_31_5,
          DIN_32_6             => DOUT_BUF_32_5,
          DIN_33_6             => DOUT_BUF_33_5,
          DIN_34_6             => DOUT_BUF_34_5,
          DIN_35_6             => DOUT_BUF_35_5,
          DIN_36_6             => DOUT_BUF_36_5,
          DIN_37_6             => DOUT_BUF_37_5,
          DIN_38_6             => DOUT_BUF_38_5,
          DIN_39_6             => DOUT_BUF_39_5,
          DIN_40_6             => DOUT_BUF_40_5,
          DIN_41_6             => DOUT_BUF_41_5,
          DIN_42_6             => DOUT_BUF_42_5,
          DIN_43_6             => DOUT_BUF_43_5,
          DIN_44_6             => DOUT_BUF_44_5,
          DIN_45_6             => DOUT_BUF_45_5,
          DIN_46_6             => DOUT_BUF_46_5,
          DIN_47_6             => DOUT_BUF_47_5,
          DIN_48_6             => DOUT_BUF_48_5,
          DIN_49_6             => DOUT_BUF_49_5,
          DIN_50_6             => DOUT_BUF_50_5,
          DIN_51_6             => DOUT_BUF_51_5,
          DIN_52_6             => DOUT_BUF_52_5,
          DIN_53_6             => DOUT_BUF_53_5,
          DIN_54_6             => DOUT_BUF_54_5,
          DIN_55_6             => DOUT_BUF_55_5,
          DIN_56_6             => DOUT_BUF_56_5,
          DIN_57_6             => DOUT_BUF_57_5,
          DIN_58_6             => DOUT_BUF_58_5,
          DIN_59_6             => DOUT_BUF_59_5,
          DIN_60_6             => DOUT_BUF_60_5,
          DIN_61_6             => DOUT_BUF_61_5,
          DIN_62_6             => DOUT_BUF_62_5,
          DIN_63_6             => DOUT_BUF_63_5,
          DIN_64_6             => DOUT_BUF_64_5,
          DIN_65_6             => DOUT_BUF_65_5,
          DIN_66_6             => DOUT_BUF_66_5,
          DIN_67_6             => DOUT_BUF_67_5,
          DIN_68_6             => DOUT_BUF_68_5,
          DIN_69_6             => DOUT_BUF_69_5,
          DIN_70_6             => DOUT_BUF_70_5,
          DIN_71_6             => DOUT_BUF_71_5,
          DIN_72_6             => DOUT_BUF_72_5,
          DIN_73_6             => DOUT_BUF_73_5,
          DIN_74_6             => DOUT_BUF_74_5,
          DIN_75_6             => DOUT_BUF_75_5,
          DIN_76_6             => DOUT_BUF_76_5,
          DIN_77_6             => DOUT_BUF_77_5,
          DIN_78_6             => DOUT_BUF_78_5,
          DIN_79_6             => DOUT_BUF_79_5,
          DIN_80_6             => DOUT_BUF_80_5,
          DIN_81_6             => DOUT_BUF_81_5,
          DIN_82_6             => DOUT_BUF_82_5,
          DIN_83_6             => DOUT_BUF_83_5,
          DIN_84_6             => DOUT_BUF_84_5,
          DIN_85_6             => DOUT_BUF_85_5,
          DIN_86_6             => DOUT_BUF_86_5,
          DIN_87_6             => DOUT_BUF_87_5,
          DIN_88_6             => DOUT_BUF_88_5,
          DIN_89_6             => DOUT_BUF_89_5,
          DIN_90_6             => DOUT_BUF_90_5,
          DIN_91_6             => DOUT_BUF_91_5,
          DIN_92_6             => DOUT_BUF_92_5,
          DIN_93_6             => DOUT_BUF_93_5,
          DIN_94_6             => DOUT_BUF_94_5,
          DIN_95_6             => DOUT_BUF_95_5,
          DIN_96_6             => DOUT_BUF_96_5,
          DIN_97_6             => DOUT_BUF_97_5,
          DIN_98_6             => DOUT_BUF_98_5,
          DIN_99_6             => DOUT_BUF_99_5,
          DIN_100_6             => DOUT_BUF_100_5,
          DIN_101_6             => DOUT_BUF_101_5,
          DIN_102_6             => DOUT_BUF_102_5,
          DIN_103_6             => DOUT_BUF_103_5,
          DIN_104_6             => DOUT_BUF_104_5,
          DIN_105_6             => DOUT_BUF_105_5,
          DIN_106_6             => DOUT_BUF_106_5,
          DIN_107_6             => DOUT_BUF_107_5,
          DIN_108_6             => DOUT_BUF_108_5,
          DIN_109_6             => DOUT_BUF_109_5,
          DIN_110_6             => DOUT_BUF_110_5,
          DIN_111_6             => DOUT_BUF_111_5,
          DIN_112_6             => DOUT_BUF_112_5,
          DIN_113_6             => DOUT_BUF_113_5,
          DIN_114_6             => DOUT_BUF_114_5,
          DIN_115_6             => DOUT_BUF_115_5,
          DIN_116_6             => DOUT_BUF_116_5,
          DIN_117_6             => DOUT_BUF_117_5,
          DIN_118_6             => DOUT_BUF_118_5,
          DIN_119_6             => DOUT_BUF_119_5,
          DIN_120_6             => DOUT_BUF_120_5,
          DIN_121_6             => DOUT_BUF_121_5,
          DIN_122_6             => DOUT_BUF_122_5,
          DIN_123_6             => DOUT_BUF_123_5,
          DIN_124_6             => DOUT_BUF_124_5,
          DIN_125_6             => DOUT_BUF_125_5,
          DIN_126_6             => DOUT_BUF_126_5,
          DIN_127_6             => DOUT_BUF_127_5,
          DIN_128_6             => DOUT_BUF_128_5,
          DIN_129_6             => DOUT_BUF_129_5,
          DIN_130_6             => DOUT_BUF_130_5,
          DIN_131_6             => DOUT_BUF_131_5,
          DIN_132_6             => DOUT_BUF_132_5,
          DIN_133_6             => DOUT_BUF_133_5,
          DIN_134_6             => DOUT_BUF_134_5,
          DIN_135_6             => DOUT_BUF_135_5,
          DIN_136_6             => DOUT_BUF_136_5,
          DIN_137_6             => DOUT_BUF_137_5,
          DIN_138_6             => DOUT_BUF_138_5,
          DIN_139_6             => DOUT_BUF_139_5,
          DIN_140_6             => DOUT_BUF_140_5,
          DIN_141_6             => DOUT_BUF_141_5,
          DIN_142_6             => DOUT_BUF_142_5,
          DIN_143_6             => DOUT_BUF_143_5,
          DIN_144_6             => DOUT_BUF_144_5,
          DIN_145_6             => DOUT_BUF_145_5,
          DIN_146_6             => DOUT_BUF_146_5,
          DIN_147_6             => DOUT_BUF_147_5,
          DIN_148_6             => DOUT_BUF_148_5,
          DIN_149_6             => DOUT_BUF_149_5,
          DIN_150_6             => DOUT_BUF_150_5,
          DIN_151_6             => DOUT_BUF_151_5,
          DIN_152_6             => DOUT_BUF_152_5,
          DIN_153_6             => DOUT_BUF_153_5,
          DIN_154_6             => DOUT_BUF_154_5,
          DIN_155_6             => DOUT_BUF_155_5,
          DIN_156_6             => DOUT_BUF_156_5,
          DIN_157_6             => DOUT_BUF_157_5,
          DIN_158_6             => DOUT_BUF_158_5,
          DIN_159_6             => DOUT_BUF_159_5,
          DIN_160_6             => DOUT_BUF_160_5,
          DIN_161_6             => DOUT_BUF_161_5,
          DIN_162_6             => DOUT_BUF_162_5,
          DIN_163_6             => DOUT_BUF_163_5,
          DIN_164_6             => DOUT_BUF_164_5,
          DIN_165_6             => DOUT_BUF_165_5,
          DIN_166_6             => DOUT_BUF_166_5,
          DIN_167_6             => DOUT_BUF_167_5,
          DIN_168_6             => DOUT_BUF_168_5,
          DIN_169_6             => DOUT_BUF_169_5,
          DIN_170_6             => DOUT_BUF_170_5,
          DIN_171_6             => DOUT_BUF_171_5,
          DIN_172_6             => DOUT_BUF_172_5,
          DIN_173_6             => DOUT_BUF_173_5,
          DIN_174_6             => DOUT_BUF_174_5,
          DIN_175_6             => DOUT_BUF_175_5,
          DIN_176_6             => DOUT_BUF_176_5,
          DIN_177_6             => DOUT_BUF_177_5,
          DIN_178_6             => DOUT_BUF_178_5,
          DIN_179_6             => DOUT_BUF_179_5,
          DIN_180_6             => DOUT_BUF_180_5,
          DIN_181_6             => DOUT_BUF_181_5,
          DIN_182_6             => DOUT_BUF_182_5,
          DIN_183_6             => DOUT_BUF_183_5,
          DIN_184_6             => DOUT_BUF_184_5,
          DIN_185_6             => DOUT_BUF_185_5,
          DIN_186_6             => DOUT_BUF_186_5,
          DIN_187_6             => DOUT_BUF_187_5,
          DIN_188_6             => DOUT_BUF_188_5,
          DIN_189_6             => DOUT_BUF_189_5,
          DIN_190_6             => DOUT_BUF_190_5,
          DIN_191_6             => DOUT_BUF_191_5,
          DIN_192_6             => DOUT_BUF_192_5,
          DIN_193_6             => DOUT_BUF_193_5,
          DIN_194_6             => DOUT_BUF_194_5,
          DIN_195_6             => DOUT_BUF_195_5,
          DIN_196_6             => DOUT_BUF_196_5,
          DIN_197_6             => DOUT_BUF_197_5,
          DIN_198_6             => DOUT_BUF_198_5,
          DIN_199_6             => DOUT_BUF_199_5,
          DIN_200_6             => DOUT_BUF_200_5,
          DIN_201_6             => DOUT_BUF_201_5,
          DIN_202_6             => DOUT_BUF_202_5,
          DIN_203_6             => DOUT_BUF_203_5,
          DIN_204_6             => DOUT_BUF_204_5,
          DIN_205_6             => DOUT_BUF_205_5,
          DIN_206_6             => DOUT_BUF_206_5,
          DIN_207_6             => DOUT_BUF_207_5,
          DIN_208_6             => DOUT_BUF_208_5,
          DIN_209_6             => DOUT_BUF_209_5,
          DIN_210_6             => DOUT_BUF_210_5,
          DIN_211_6             => DOUT_BUF_211_5,
          DIN_212_6             => DOUT_BUF_212_5,
          DIN_213_6             => DOUT_BUF_213_5,
          DIN_214_6             => DOUT_BUF_214_5,
          DIN_215_6             => DOUT_BUF_215_5,
          DIN_216_6             => DOUT_BUF_216_5,
          DIN_217_6             => DOUT_BUF_217_5,
          DIN_218_6             => DOUT_BUF_218_5,
          DIN_219_6             => DOUT_BUF_219_5,
          DIN_220_6             => DOUT_BUF_220_5,
          DIN_221_6             => DOUT_BUF_221_5,
          DIN_222_6             => DOUT_BUF_222_5,
          DIN_223_6             => DOUT_BUF_223_5,
          DIN_224_6             => DOUT_BUF_224_5,
          DIN_225_6             => DOUT_BUF_225_5,
          DIN_226_6             => DOUT_BUF_226_5,
          DIN_227_6             => DOUT_BUF_227_5,
          DIN_228_6             => DOUT_BUF_228_5,
          DIN_229_6             => DOUT_BUF_229_5,
          DIN_230_6             => DOUT_BUF_230_5,
          DIN_231_6             => DOUT_BUF_231_5,
          DIN_232_6             => DOUT_BUF_232_5,
          DIN_233_6             => DOUT_BUF_233_5,
          DIN_234_6             => DOUT_BUF_234_5,
          DIN_235_6             => DOUT_BUF_235_5,
          DIN_236_6             => DOUT_BUF_236_5,
          DIN_237_6             => DOUT_BUF_237_5,
          DIN_238_6             => DOUT_BUF_238_5,
          DIN_239_6             => DOUT_BUF_239_5,
          DIN_240_6             => DOUT_BUF_240_5,
          DIN_241_6             => DOUT_BUF_241_5,
          DIN_242_6             => DOUT_BUF_242_5,
          DIN_243_6             => DOUT_BUF_243_5,
          DIN_244_6             => DOUT_BUF_244_5,
          DIN_245_6             => DOUT_BUF_245_5,
          DIN_246_6             => DOUT_BUF_246_5,
          DIN_247_6             => DOUT_BUF_247_5,
          DIN_248_6             => DOUT_BUF_248_5,
          DIN_249_6             => DOUT_BUF_249_5,
          DIN_250_6             => DOUT_BUF_250_5,
          DIN_251_6             => DOUT_BUF_251_5,
          DIN_252_6             => DOUT_BUF_252_5,
          DIN_253_6             => DOUT_BUF_253_5,
          DIN_254_6             => DOUT_BUF_254_5,
          DIN_255_6             => DOUT_BUF_255_5,
          DIN_256_6             => DOUT_BUF_256_5,
          DIN_257_6             => DOUT_BUF_257_5,
          DIN_258_6             => DOUT_BUF_258_5,
          DIN_259_6             => DOUT_BUF_259_5,
          DIN_260_6             => DOUT_BUF_260_5,
          DIN_261_6             => DOUT_BUF_261_5,
          DIN_262_6             => DOUT_BUF_262_5,
          DIN_263_6             => DOUT_BUF_263_5,
          DIN_264_6             => DOUT_BUF_264_5,
          DIN_265_6             => DOUT_BUF_265_5,
          DIN_266_6             => DOUT_BUF_266_5,
          DIN_267_6             => DOUT_BUF_267_5,
          DIN_268_6             => DOUT_BUF_268_5,
          DIN_269_6             => DOUT_BUF_269_5,
          DIN_270_6             => DOUT_BUF_270_5,
          DIN_271_6             => DOUT_BUF_271_5,
          DIN_272_6             => DOUT_BUF_272_5,
          DIN_273_6             => DOUT_BUF_273_5,
          DIN_274_6             => DOUT_BUF_274_5,
          DIN_275_6             => DOUT_BUF_275_5,
          DIN_276_6             => DOUT_BUF_276_5,
          DIN_277_6             => DOUT_BUF_277_5,
          DIN_278_6             => DOUT_BUF_278_5,
          DIN_279_6             => DOUT_BUF_279_5,
          DIN_280_6             => DOUT_BUF_280_5,
          DIN_281_6             => DOUT_BUF_281_5,
          DIN_282_6             => DOUT_BUF_282_5,
          DIN_283_6             => DOUT_BUF_283_5,
          DIN_284_6             => DOUT_BUF_284_5,
          DIN_285_6             => DOUT_BUF_285_5,
          DIN_286_6             => DOUT_BUF_286_5,
          DIN_287_6             => DOUT_BUF_287_5,
          DIN_288_6             => DOUT_BUF_288_5,
          DIN_289_6             => DOUT_BUF_289_5,
          DIN_290_6             => DOUT_BUF_290_5,
          DIN_291_6             => DOUT_BUF_291_5,
          DIN_292_6             => DOUT_BUF_292_5,
          DIN_293_6             => DOUT_BUF_293_5,
          DIN_294_6             => DOUT_BUF_294_5,
          DIN_295_6             => DOUT_BUF_295_5,
          DIN_296_6             => DOUT_BUF_296_5,
          DIN_297_6             => DOUT_BUF_297_5,
          DIN_298_6             => DOUT_BUF_298_5,
          DIN_299_6             => DOUT_BUF_299_5,
          DIN_300_6             => DOUT_BUF_300_5,
          DIN_301_6             => DOUT_BUF_301_5,
          DIN_302_6             => DOUT_BUF_302_5,
          DIN_303_6             => DOUT_BUF_303_5,
          DIN_304_6             => DOUT_BUF_304_5,
          DIN_305_6             => DOUT_BUF_305_5,
          DIN_306_6             => DOUT_BUF_306_5,
          DIN_307_6             => DOUT_BUF_307_5,
          DIN_308_6             => DOUT_BUF_308_5,
          DIN_309_6             => DOUT_BUF_309_5,
          DIN_310_6             => DOUT_BUF_310_5,
          DIN_311_6             => DOUT_BUF_311_5,
          DIN_312_6             => DOUT_BUF_312_5,
          DIN_313_6             => DOUT_BUF_313_5,
          DIN_314_6             => DOUT_BUF_314_5,
          DIN_315_6             => DOUT_BUF_315_5,
          DIN_316_6             => DOUT_BUF_316_5,
          DIN_317_6             => DOUT_BUF_317_5,
          DIN_318_6             => DOUT_BUF_318_5,
          DIN_319_6             => DOUT_BUF_319_5,
          DIN_320_6             => DOUT_BUF_320_5,
          DIN_321_6             => DOUT_BUF_321_5,
          DIN_322_6             => DOUT_BUF_322_5,
          DIN_323_6             => DOUT_BUF_323_5,
          DIN_324_6             => DOUT_BUF_324_5,
          DIN_325_6             => DOUT_BUF_325_5,
          DIN_326_6             => DOUT_BUF_326_5,
          DIN_327_6             => DOUT_BUF_327_5,
          DIN_328_6             => DOUT_BUF_328_5,
          DIN_329_6             => DOUT_BUF_329_5,
          DIN_330_6             => DOUT_BUF_330_5,
          DIN_331_6             => DOUT_BUF_331_5,
          DIN_332_6             => DOUT_BUF_332_5,
          DIN_333_6             => DOUT_BUF_333_5,
          DIN_334_6             => DOUT_BUF_334_5,
          DIN_335_6             => DOUT_BUF_335_5,
          DIN_336_6             => DOUT_BUF_336_5,
          DIN_337_6             => DOUT_BUF_337_5,
          DIN_338_6             => DOUT_BUF_338_5,
          DIN_339_6             => DOUT_BUF_339_5,
          DIN_340_6             => DOUT_BUF_340_5,
          DIN_341_6             => DOUT_BUF_341_5,
          DIN_342_6             => DOUT_BUF_342_5,
          DIN_343_6             => DOUT_BUF_343_5,
          DIN_344_6             => DOUT_BUF_344_5,
          DIN_345_6             => DOUT_BUF_345_5,
          DIN_346_6             => DOUT_BUF_346_5,
          DIN_347_6             => DOUT_BUF_347_5,
          DIN_348_6             => DOUT_BUF_348_5,
          DIN_349_6             => DOUT_BUF_349_5,
          DIN_350_6             => DOUT_BUF_350_5,
          DIN_351_6             => DOUT_BUF_351_5,
          DIN_352_6             => DOUT_BUF_352_5,
          DIN_353_6             => DOUT_BUF_353_5,
          DIN_354_6             => DOUT_BUF_354_5,
          DIN_355_6             => DOUT_BUF_355_5,
          DIN_356_6             => DOUT_BUF_356_5,
          DIN_357_6             => DOUT_BUF_357_5,
          DIN_358_6             => DOUT_BUF_358_5,
          DIN_359_6             => DOUT_BUF_359_5,
          DIN_360_6             => DOUT_BUF_360_5,
          DIN_361_6             => DOUT_BUF_361_5,
          DIN_362_6             => DOUT_BUF_362_5,
          DIN_363_6             => DOUT_BUF_363_5,
          DIN_364_6             => DOUT_BUF_364_5,
          DIN_365_6             => DOUT_BUF_365_5,
          DIN_366_6             => DOUT_BUF_366_5,
          DIN_367_6             => DOUT_BUF_367_5,
          DIN_368_6             => DOUT_BUF_368_5,
          DIN_369_6             => DOUT_BUF_369_5,
          DIN_370_6             => DOUT_BUF_370_5,
          DIN_371_6             => DOUT_BUF_371_5,
          DIN_372_6             => DOUT_BUF_372_5,
          DIN_373_6             => DOUT_BUF_373_5,
          DIN_374_6             => DOUT_BUF_374_5,
          DIN_375_6             => DOUT_BUF_375_5,
          DIN_376_6             => DOUT_BUF_376_5,
          DIN_377_6             => DOUT_BUF_377_5,
          DIN_378_6             => DOUT_BUF_378_5,
          DIN_379_6             => DOUT_BUF_379_5,
          DIN_380_6             => DOUT_BUF_380_5,
          DIN_381_6             => DOUT_BUF_381_5,
          DIN_382_6             => DOUT_BUF_382_5,
          DIN_383_6             => DOUT_BUF_383_5,
          DIN_384_6             => DOUT_BUF_384_5,
          DIN_385_6             => DOUT_BUF_385_5,
          DIN_386_6             => DOUT_BUF_386_5,
          DIN_387_6             => DOUT_BUF_387_5,
          DIN_388_6             => DOUT_BUF_388_5,
          DIN_389_6             => DOUT_BUF_389_5,
          DIN_390_6             => DOUT_BUF_390_5,
          DIN_391_6             => DOUT_BUF_391_5,
          DIN_392_6             => DOUT_BUF_392_5,
          DIN_393_6             => DOUT_BUF_393_5,
          DIN_394_6             => DOUT_BUF_394_5,
          DIN_395_6             => DOUT_BUF_395_5,
          DIN_396_6             => DOUT_BUF_396_5,
          DIN_397_6             => DOUT_BUF_397_5,
          DIN_398_6             => DOUT_BUF_398_5,
          DIN_399_6             => DOUT_BUF_399_5,
          DIN_400_6             => DOUT_BUF_400_5,
          DOUT_1_6            => DOUT_1_6,
          DOUT_2_6            => DOUT_2_6,
          DOUT_3_6            => DOUT_3_6,
          DOUT_4_6            => DOUT_4_6,
          DOUT_5_6            => DOUT_5_6,
          DOUT_6_6            => DOUT_6_6,
          DOUT_7_6            => DOUT_7_6,
          DOUT_8_6            => DOUT_8_6,
          DOUT_9_6            => DOUT_9_6,
          DOUT_10_6            => DOUT_10_6,
          VALID_OUT_6         => VALID_OUT_6,
          EN_STREAM_OUT_6     => EN_STREAM_OUT_6,
          EN_LOC_STREAM_6     => EN_NXT_LYR_5,
          EN_STREAM           => EN_STREAM
                );

----------------------------------------------- MAP NEXT LAYER - COMPONENTS END----------------------------------------------------



-------------------------------------------------------- ARCHITECTURE BEGIN--------------------------------------------------------

LAYER_5: process(CLK)


begin
------------------------------------------------ RESET AND PROCESS TOP START ------------------------------------------------------
if rising_edge(CLK) then
  if RST = '1' then
	-------------------FIXED SIGNALS RESET------------------------
    PIXEL_COUNT<=0;VALID_NXTLYR_PIX<=0;OUT_PIXEL_COUNT<=0;
    EN_NXT_LYR_5<='0';FRST_TIM_EN_5<='0';
    Enable_ONEHOT<='0';
    INTERNAL_RST<='0';PADDING_count<=0;ROW_COUNT<=0;SIG_STRIDE<=STRIDE;

-------------------DYNAMIC SIGNALS RESET------------------------
    WINDOW_1<=((others=> (others=> (others=>'0'))));
    WINDOW_2<=((others=> (others=> (others=>'0'))));
    WINDOW_3<=((others=> (others=> (others=>'0'))));
    WINDOW_4<=((others=> (others=> (others=>'0'))));
    WINDOW_5<=((others=> (others=> (others=>'0'))));
    WINDOW_6<=((others=> (others=> (others=>'0'))));
    WINDOW_7<=((others=> (others=> (others=>'0'))));
    WINDOW_8<=((others=> (others=> (others=>'0'))));
    WINDOW_9<=((others=> (others=> (others=>'0'))));
    WINDOW_10<=((others=> (others=> (others=>'0'))));
    WINDOW_11<=((others=> (others=> (others=>'0'))));
    WINDOW_12<=((others=> (others=> (others=>'0'))));
    WINDOW_13<=((others=> (others=> (others=>'0'))));
    WINDOW_14<=((others=> (others=> (others=>'0'))));
    WINDOW_15<=((others=> (others=> (others=>'0'))));
    WINDOW_16<=((others=> (others=> (others=>'0'))));


    DOUT_BUF_1_5<=(others => '0');
    DOUT_BUF_2_5<=(others => '0');
    DOUT_BUF_3_5<=(others => '0');
    DOUT_BUF_4_5<=(others => '0');
    DOUT_BUF_5_5<=(others => '0');
    DOUT_BUF_6_5<=(others => '0');
    DOUT_BUF_7_5<=(others => '0');
    DOUT_BUF_8_5<=(others => '0');
    DOUT_BUF_9_5<=(others => '0');
    DOUT_BUF_10_5<=(others => '0');
    DOUT_BUF_11_5<=(others => '0');
    DOUT_BUF_12_5<=(others => '0');
    DOUT_BUF_13_5<=(others => '0');
    DOUT_BUF_14_5<=(others => '0');
    DOUT_BUF_15_5<=(others => '0');
    DOUT_BUF_16_5<=(others => '0');
    DOUT_BUF_17_5<=(others => '0');
    DOUT_BUF_18_5<=(others => '0');
    DOUT_BUF_19_5<=(others => '0');
    DOUT_BUF_20_5<=(others => '0');
    DOUT_BUF_21_5<=(others => '0');
    DOUT_BUF_22_5<=(others => '0');
    DOUT_BUF_23_5<=(others => '0');
    DOUT_BUF_24_5<=(others => '0');
    DOUT_BUF_25_5<=(others => '0');
    DOUT_BUF_26_5<=(others => '0');
    DOUT_BUF_27_5<=(others => '0');
    DOUT_BUF_28_5<=(others => '0');
    DOUT_BUF_29_5<=(others => '0');
    DOUT_BUF_30_5<=(others => '0');
    DOUT_BUF_31_5<=(others => '0');
    DOUT_BUF_32_5<=(others => '0');
    DOUT_BUF_33_5<=(others => '0');
    DOUT_BUF_34_5<=(others => '0');
    DOUT_BUF_35_5<=(others => '0');
    DOUT_BUF_36_5<=(others => '0');
    DOUT_BUF_37_5<=(others => '0');
    DOUT_BUF_38_5<=(others => '0');
    DOUT_BUF_39_5<=(others => '0');
    DOUT_BUF_40_5<=(others => '0');
    DOUT_BUF_41_5<=(others => '0');
    DOUT_BUF_42_5<=(others => '0');
    DOUT_BUF_43_5<=(others => '0');
    DOUT_BUF_44_5<=(others => '0');
    DOUT_BUF_45_5<=(others => '0');
    DOUT_BUF_46_5<=(others => '0');
    DOUT_BUF_47_5<=(others => '0');
    DOUT_BUF_48_5<=(others => '0');
    DOUT_BUF_49_5<=(others => '0');
    DOUT_BUF_50_5<=(others => '0');
    DOUT_BUF_51_5<=(others => '0');
    DOUT_BUF_52_5<=(others => '0');
    DOUT_BUF_53_5<=(others => '0');
    DOUT_BUF_54_5<=(others => '0');
    DOUT_BUF_55_5<=(others => '0');
    DOUT_BUF_56_5<=(others => '0');
    DOUT_BUF_57_5<=(others => '0');
    DOUT_BUF_58_5<=(others => '0');
    DOUT_BUF_59_5<=(others => '0');
    DOUT_BUF_60_5<=(others => '0');
    DOUT_BUF_61_5<=(others => '0');
    DOUT_BUF_62_5<=(others => '0');
    DOUT_BUF_63_5<=(others => '0');
    DOUT_BUF_64_5<=(others => '0');
    DOUT_BUF_65_5<=(others => '0');
    DOUT_BUF_66_5<=(others => '0');
    DOUT_BUF_67_5<=(others => '0');
    DOUT_BUF_68_5<=(others => '0');
    DOUT_BUF_69_5<=(others => '0');
    DOUT_BUF_70_5<=(others => '0');
    DOUT_BUF_71_5<=(others => '0');
    DOUT_BUF_72_5<=(others => '0');
    DOUT_BUF_73_5<=(others => '0');
    DOUT_BUF_74_5<=(others => '0');
    DOUT_BUF_75_5<=(others => '0');
    DOUT_BUF_76_5<=(others => '0');
    DOUT_BUF_77_5<=(others => '0');
    DOUT_BUF_78_5<=(others => '0');
    DOUT_BUF_79_5<=(others => '0');
    DOUT_BUF_80_5<=(others => '0');
    DOUT_BUF_81_5<=(others => '0');
    DOUT_BUF_82_5<=(others => '0');
    DOUT_BUF_83_5<=(others => '0');
    DOUT_BUF_84_5<=(others => '0');
    DOUT_BUF_85_5<=(others => '0');
    DOUT_BUF_86_5<=(others => '0');
    DOUT_BUF_87_5<=(others => '0');
    DOUT_BUF_88_5<=(others => '0');
    DOUT_BUF_89_5<=(others => '0');
    DOUT_BUF_90_5<=(others => '0');
    DOUT_BUF_91_5<=(others => '0');
    DOUT_BUF_92_5<=(others => '0');
    DOUT_BUF_93_5<=(others => '0');
    DOUT_BUF_94_5<=(others => '0');
    DOUT_BUF_95_5<=(others => '0');
    DOUT_BUF_96_5<=(others => '0');
    DOUT_BUF_97_5<=(others => '0');
    DOUT_BUF_98_5<=(others => '0');
    DOUT_BUF_99_5<=(others => '0');
    DOUT_BUF_100_5<=(others => '0');
    DOUT_BUF_101_5<=(others => '0');
    DOUT_BUF_102_5<=(others => '0');
    DOUT_BUF_103_5<=(others => '0');
    DOUT_BUF_104_5<=(others => '0');
    DOUT_BUF_105_5<=(others => '0');
    DOUT_BUF_106_5<=(others => '0');
    DOUT_BUF_107_5<=(others => '0');
    DOUT_BUF_108_5<=(others => '0');
    DOUT_BUF_109_5<=(others => '0');
    DOUT_BUF_110_5<=(others => '0');
    DOUT_BUF_111_5<=(others => '0');
    DOUT_BUF_112_5<=(others => '0');
    DOUT_BUF_113_5<=(others => '0');
    DOUT_BUF_114_5<=(others => '0');
    DOUT_BUF_115_5<=(others => '0');
    DOUT_BUF_116_5<=(others => '0');
    DOUT_BUF_117_5<=(others => '0');
    DOUT_BUF_118_5<=(others => '0');
    DOUT_BUF_119_5<=(others => '0');
    DOUT_BUF_120_5<=(others => '0');
    DOUT_BUF_121_5<=(others => '0');
    DOUT_BUF_122_5<=(others => '0');
    DOUT_BUF_123_5<=(others => '0');
    DOUT_BUF_124_5<=(others => '0');
    DOUT_BUF_125_5<=(others => '0');
    DOUT_BUF_126_5<=(others => '0');
    DOUT_BUF_127_5<=(others => '0');
    DOUT_BUF_128_5<=(others => '0');
    DOUT_BUF_129_5<=(others => '0');
    DOUT_BUF_130_5<=(others => '0');
    DOUT_BUF_131_5<=(others => '0');
    DOUT_BUF_132_5<=(others => '0');
    DOUT_BUF_133_5<=(others => '0');
    DOUT_BUF_134_5<=(others => '0');
    DOUT_BUF_135_5<=(others => '0');
    DOUT_BUF_136_5<=(others => '0');
    DOUT_BUF_137_5<=(others => '0');
    DOUT_BUF_138_5<=(others => '0');
    DOUT_BUF_139_5<=(others => '0');
    DOUT_BUF_140_5<=(others => '0');
    DOUT_BUF_141_5<=(others => '0');
    DOUT_BUF_142_5<=(others => '0');
    DOUT_BUF_143_5<=(others => '0');
    DOUT_BUF_144_5<=(others => '0');
    DOUT_BUF_145_5<=(others => '0');
    DOUT_BUF_146_5<=(others => '0');
    DOUT_BUF_147_5<=(others => '0');
    DOUT_BUF_148_5<=(others => '0');
    DOUT_BUF_149_5<=(others => '0');
    DOUT_BUF_150_5<=(others => '0');
    DOUT_BUF_151_5<=(others => '0');
    DOUT_BUF_152_5<=(others => '0');
    DOUT_BUF_153_5<=(others => '0');
    DOUT_BUF_154_5<=(others => '0');
    DOUT_BUF_155_5<=(others => '0');
    DOUT_BUF_156_5<=(others => '0');
    DOUT_BUF_157_5<=(others => '0');
    DOUT_BUF_158_5<=(others => '0');
    DOUT_BUF_159_5<=(others => '0');
    DOUT_BUF_160_5<=(others => '0');
    DOUT_BUF_161_5<=(others => '0');
    DOUT_BUF_162_5<=(others => '0');
    DOUT_BUF_163_5<=(others => '0');
    DOUT_BUF_164_5<=(others => '0');
    DOUT_BUF_165_5<=(others => '0');
    DOUT_BUF_166_5<=(others => '0');
    DOUT_BUF_167_5<=(others => '0');
    DOUT_BUF_168_5<=(others => '0');
    DOUT_BUF_169_5<=(others => '0');
    DOUT_BUF_170_5<=(others => '0');
    DOUT_BUF_171_5<=(others => '0');
    DOUT_BUF_172_5<=(others => '0');
    DOUT_BUF_173_5<=(others => '0');
    DOUT_BUF_174_5<=(others => '0');
    DOUT_BUF_175_5<=(others => '0');
    DOUT_BUF_176_5<=(others => '0');
    DOUT_BUF_177_5<=(others => '0');
    DOUT_BUF_178_5<=(others => '0');
    DOUT_BUF_179_5<=(others => '0');
    DOUT_BUF_180_5<=(others => '0');
    DOUT_BUF_181_5<=(others => '0');
    DOUT_BUF_182_5<=(others => '0');
    DOUT_BUF_183_5<=(others => '0');
    DOUT_BUF_184_5<=(others => '0');
    DOUT_BUF_185_5<=(others => '0');
    DOUT_BUF_186_5<=(others => '0');
    DOUT_BUF_187_5<=(others => '0');
    DOUT_BUF_188_5<=(others => '0');
    DOUT_BUF_189_5<=(others => '0');
    DOUT_BUF_190_5<=(others => '0');
    DOUT_BUF_191_5<=(others => '0');
    DOUT_BUF_192_5<=(others => '0');
    DOUT_BUF_193_5<=(others => '0');
    DOUT_BUF_194_5<=(others => '0');
    DOUT_BUF_195_5<=(others => '0');
    DOUT_BUF_196_5<=(others => '0');
    DOUT_BUF_197_5<=(others => '0');
    DOUT_BUF_198_5<=(others => '0');
    DOUT_BUF_199_5<=(others => '0');
    DOUT_BUF_200_5<=(others => '0');
    DOUT_BUF_201_5<=(others => '0');
    DOUT_BUF_202_5<=(others => '0');
    DOUT_BUF_203_5<=(others => '0');
    DOUT_BUF_204_5<=(others => '0');
    DOUT_BUF_205_5<=(others => '0');
    DOUT_BUF_206_5<=(others => '0');
    DOUT_BUF_207_5<=(others => '0');
    DOUT_BUF_208_5<=(others => '0');
    DOUT_BUF_209_5<=(others => '0');
    DOUT_BUF_210_5<=(others => '0');
    DOUT_BUF_211_5<=(others => '0');
    DOUT_BUF_212_5<=(others => '0');
    DOUT_BUF_213_5<=(others => '0');
    DOUT_BUF_214_5<=(others => '0');
    DOUT_BUF_215_5<=(others => '0');
    DOUT_BUF_216_5<=(others => '0');
    DOUT_BUF_217_5<=(others => '0');
    DOUT_BUF_218_5<=(others => '0');
    DOUT_BUF_219_5<=(others => '0');
    DOUT_BUF_220_5<=(others => '0');
    DOUT_BUF_221_5<=(others => '0');
    DOUT_BUF_222_5<=(others => '0');
    DOUT_BUF_223_5<=(others => '0');
    DOUT_BUF_224_5<=(others => '0');
    DOUT_BUF_225_5<=(others => '0');
    DOUT_BUF_226_5<=(others => '0');
    DOUT_BUF_227_5<=(others => '0');
    DOUT_BUF_228_5<=(others => '0');
    DOUT_BUF_229_5<=(others => '0');
    DOUT_BUF_230_5<=(others => '0');
    DOUT_BUF_231_5<=(others => '0');
    DOUT_BUF_232_5<=(others => '0');
    DOUT_BUF_233_5<=(others => '0');
    DOUT_BUF_234_5<=(others => '0');
    DOUT_BUF_235_5<=(others => '0');
    DOUT_BUF_236_5<=(others => '0');
    DOUT_BUF_237_5<=(others => '0');
    DOUT_BUF_238_5<=(others => '0');
    DOUT_BUF_239_5<=(others => '0');
    DOUT_BUF_240_5<=(others => '0');
    DOUT_BUF_241_5<=(others => '0');
    DOUT_BUF_242_5<=(others => '0');
    DOUT_BUF_243_5<=(others => '0');
    DOUT_BUF_244_5<=(others => '0');
    DOUT_BUF_245_5<=(others => '0');
    DOUT_BUF_246_5<=(others => '0');
    DOUT_BUF_247_5<=(others => '0');
    DOUT_BUF_248_5<=(others => '0');
    DOUT_BUF_249_5<=(others => '0');
    DOUT_BUF_250_5<=(others => '0');
    DOUT_BUF_251_5<=(others => '0');
    DOUT_BUF_252_5<=(others => '0');
    DOUT_BUF_253_5<=(others => '0');
    DOUT_BUF_254_5<=(others => '0');
    DOUT_BUF_255_5<=(others => '0');
    DOUT_BUF_256_5<=(others => '0');
    DOUT_BUF_257_5<=(others => '0');
    DOUT_BUF_258_5<=(others => '0');
    DOUT_BUF_259_5<=(others => '0');
    DOUT_BUF_260_5<=(others => '0');
    DOUT_BUF_261_5<=(others => '0');
    DOUT_BUF_262_5<=(others => '0');
    DOUT_BUF_263_5<=(others => '0');
    DOUT_BUF_264_5<=(others => '0');
    DOUT_BUF_265_5<=(others => '0');
    DOUT_BUF_266_5<=(others => '0');
    DOUT_BUF_267_5<=(others => '0');
    DOUT_BUF_268_5<=(others => '0');
    DOUT_BUF_269_5<=(others => '0');
    DOUT_BUF_270_5<=(others => '0');
    DOUT_BUF_271_5<=(others => '0');
    DOUT_BUF_272_5<=(others => '0');
    DOUT_BUF_273_5<=(others => '0');
    DOUT_BUF_274_5<=(others => '0');
    DOUT_BUF_275_5<=(others => '0');
    DOUT_BUF_276_5<=(others => '0');
    DOUT_BUF_277_5<=(others => '0');
    DOUT_BUF_278_5<=(others => '0');
    DOUT_BUF_279_5<=(others => '0');
    DOUT_BUF_280_5<=(others => '0');
    DOUT_BUF_281_5<=(others => '0');
    DOUT_BUF_282_5<=(others => '0');
    DOUT_BUF_283_5<=(others => '0');
    DOUT_BUF_284_5<=(others => '0');
    DOUT_BUF_285_5<=(others => '0');
    DOUT_BUF_286_5<=(others => '0');
    DOUT_BUF_287_5<=(others => '0');
    DOUT_BUF_288_5<=(others => '0');
    DOUT_BUF_289_5<=(others => '0');
    DOUT_BUF_290_5<=(others => '0');
    DOUT_BUF_291_5<=(others => '0');
    DOUT_BUF_292_5<=(others => '0');
    DOUT_BUF_293_5<=(others => '0');
    DOUT_BUF_294_5<=(others => '0');
    DOUT_BUF_295_5<=(others => '0');
    DOUT_BUF_296_5<=(others => '0');
    DOUT_BUF_297_5<=(others => '0');
    DOUT_BUF_298_5<=(others => '0');
    DOUT_BUF_299_5<=(others => '0');
    DOUT_BUF_300_5<=(others => '0');
    DOUT_BUF_301_5<=(others => '0');
    DOUT_BUF_302_5<=(others => '0');
    DOUT_BUF_303_5<=(others => '0');
    DOUT_BUF_304_5<=(others => '0');
    DOUT_BUF_305_5<=(others => '0');
    DOUT_BUF_306_5<=(others => '0');
    DOUT_BUF_307_5<=(others => '0');
    DOUT_BUF_308_5<=(others => '0');
    DOUT_BUF_309_5<=(others => '0');
    DOUT_BUF_310_5<=(others => '0');
    DOUT_BUF_311_5<=(others => '0');
    DOUT_BUF_312_5<=(others => '0');
    DOUT_BUF_313_5<=(others => '0');
    DOUT_BUF_314_5<=(others => '0');
    DOUT_BUF_315_5<=(others => '0');
    DOUT_BUF_316_5<=(others => '0');
    DOUT_BUF_317_5<=(others => '0');
    DOUT_BUF_318_5<=(others => '0');
    DOUT_BUF_319_5<=(others => '0');
    DOUT_BUF_320_5<=(others => '0');
    DOUT_BUF_321_5<=(others => '0');
    DOUT_BUF_322_5<=(others => '0');
    DOUT_BUF_323_5<=(others => '0');
    DOUT_BUF_324_5<=(others => '0');
    DOUT_BUF_325_5<=(others => '0');
    DOUT_BUF_326_5<=(others => '0');
    DOUT_BUF_327_5<=(others => '0');
    DOUT_BUF_328_5<=(others => '0');
    DOUT_BUF_329_5<=(others => '0');
    DOUT_BUF_330_5<=(others => '0');
    DOUT_BUF_331_5<=(others => '0');
    DOUT_BUF_332_5<=(others => '0');
    DOUT_BUF_333_5<=(others => '0');
    DOUT_BUF_334_5<=(others => '0');
    DOUT_BUF_335_5<=(others => '0');
    DOUT_BUF_336_5<=(others => '0');
    DOUT_BUF_337_5<=(others => '0');
    DOUT_BUF_338_5<=(others => '0');
    DOUT_BUF_339_5<=(others => '0');
    DOUT_BUF_340_5<=(others => '0');
    DOUT_BUF_341_5<=(others => '0');
    DOUT_BUF_342_5<=(others => '0');
    DOUT_BUF_343_5<=(others => '0');
    DOUT_BUF_344_5<=(others => '0');
    DOUT_BUF_345_5<=(others => '0');
    DOUT_BUF_346_5<=(others => '0');
    DOUT_BUF_347_5<=(others => '0');
    DOUT_BUF_348_5<=(others => '0');
    DOUT_BUF_349_5<=(others => '0');
    DOUT_BUF_350_5<=(others => '0');
    DOUT_BUF_351_5<=(others => '0');
    DOUT_BUF_352_5<=(others => '0');
    DOUT_BUF_353_5<=(others => '0');
    DOUT_BUF_354_5<=(others => '0');
    DOUT_BUF_355_5<=(others => '0');
    DOUT_BUF_356_5<=(others => '0');
    DOUT_BUF_357_5<=(others => '0');
    DOUT_BUF_358_5<=(others => '0');
    DOUT_BUF_359_5<=(others => '0');
    DOUT_BUF_360_5<=(others => '0');
    DOUT_BUF_361_5<=(others => '0');
    DOUT_BUF_362_5<=(others => '0');
    DOUT_BUF_363_5<=(others => '0');
    DOUT_BUF_364_5<=(others => '0');
    DOUT_BUF_365_5<=(others => '0');
    DOUT_BUF_366_5<=(others => '0');
    DOUT_BUF_367_5<=(others => '0');
    DOUT_BUF_368_5<=(others => '0');
    DOUT_BUF_369_5<=(others => '0');
    DOUT_BUF_370_5<=(others => '0');
    DOUT_BUF_371_5<=(others => '0');
    DOUT_BUF_372_5<=(others => '0');
    DOUT_BUF_373_5<=(others => '0');
    DOUT_BUF_374_5<=(others => '0');
    DOUT_BUF_375_5<=(others => '0');
    DOUT_BUF_376_5<=(others => '0');
    DOUT_BUF_377_5<=(others => '0');
    DOUT_BUF_378_5<=(others => '0');
    DOUT_BUF_379_5<=(others => '0');
    DOUT_BUF_380_5<=(others => '0');
    DOUT_BUF_381_5<=(others => '0');
    DOUT_BUF_382_5<=(others => '0');
    DOUT_BUF_383_5<=(others => '0');
    DOUT_BUF_384_5<=(others => '0');
    DOUT_BUF_385_5<=(others => '0');
    DOUT_BUF_386_5<=(others => '0');
    DOUT_BUF_387_5<=(others => '0');
    DOUT_BUF_388_5<=(others => '0');
    DOUT_BUF_389_5<=(others => '0');
    DOUT_BUF_390_5<=(others => '0');
    DOUT_BUF_391_5<=(others => '0');
    DOUT_BUF_392_5<=(others => '0');
    DOUT_BUF_393_5<=(others => '0');
    DOUT_BUF_394_5<=(others => '0');
    DOUT_BUF_395_5<=(others => '0');
    DOUT_BUF_396_5<=(others => '0');
    DOUT_BUF_397_5<=(others => '0');
    DOUT_BUF_398_5<=(others => '0');
    DOUT_BUF_399_5<=(others => '0');
    DOUT_BUF_400_5<=(others => '0');

------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_5='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_5='1' then EN_NXT_LYR_5<='1';end if;


               WINDOW_1(0,0)<=DIN_1_5;
               WINDOW_1(0,1)<=WINDOW_1(0,0);
               WINDOW_1(0,2)<=WINDOW_1(0,1);
               WINDOW_1(0,3)<=WINDOW_1(0,2);
               WINDOW_1(0,4)<=WINDOW_1(0,3);
               WINDOW_1(1,0)<=WINDOW_1(0,4);
               WINDOW_1(1,1)<=WINDOW_1(1,0);
               WINDOW_1(1,2)<=WINDOW_1(1,1);
               WINDOW_1(1,3)<=WINDOW_1(1,2);
               WINDOW_1(1,4)<=WINDOW_1(1,3);
               WINDOW_1(2,0)<=WINDOW_1(1,4);
               WINDOW_1(2,1)<=WINDOW_1(1,4);
               WINDOW_1(2,2)<=WINDOW_1(2,1);
               WINDOW_1(2,3)<=WINDOW_1(2,2);
               WINDOW_1(2,4)<=WINDOW_1(2,3);
               WINDOW_1(3,0)<=WINDOW_1(2,4);
               WINDOW_1(3,1)<=WINDOW_1(2,4);
               WINDOW_1(3,2)<=WINDOW_1(2,4);
               WINDOW_1(3,3)<=WINDOW_1(3,2);
               WINDOW_1(3,4)<=WINDOW_1(3,3);
               WINDOW_1(4,0)<=WINDOW_1(3,4);
               WINDOW_1(4,1)<=WINDOW_1(3,4);
               WINDOW_1(4,2)<=WINDOW_1(3,4);
               WINDOW_1(4,3)<=WINDOW_1(3,4);
               WINDOW_1(4,4)<=WINDOW_1(4,3);


               WINDOW_2(0,0)<=DIN_2_5;
               WINDOW_2(0,1)<=WINDOW_2(0,0);
               WINDOW_2(0,2)<=WINDOW_2(0,1);
               WINDOW_2(0,3)<=WINDOW_2(0,2);
               WINDOW_2(0,4)<=WINDOW_2(0,3);
               WINDOW_2(1,0)<=WINDOW_2(0,4);
               WINDOW_2(1,1)<=WINDOW_2(1,0);
               WINDOW_2(1,2)<=WINDOW_2(1,1);
               WINDOW_2(1,3)<=WINDOW_2(1,2);
               WINDOW_2(1,4)<=WINDOW_2(1,3);
               WINDOW_2(2,0)<=WINDOW_2(1,4);
               WINDOW_2(2,1)<=WINDOW_2(1,4);
               WINDOW_2(2,2)<=WINDOW_2(2,1);
               WINDOW_2(2,3)<=WINDOW_2(2,2);
               WINDOW_2(2,4)<=WINDOW_2(2,3);
               WINDOW_2(3,0)<=WINDOW_2(2,4);
               WINDOW_2(3,1)<=WINDOW_2(2,4);
               WINDOW_2(3,2)<=WINDOW_2(2,4);
               WINDOW_2(3,3)<=WINDOW_2(3,2);
               WINDOW_2(3,4)<=WINDOW_2(3,3);
               WINDOW_2(4,0)<=WINDOW_2(3,4);
               WINDOW_2(4,1)<=WINDOW_2(3,4);
               WINDOW_2(4,2)<=WINDOW_2(3,4);
               WINDOW_2(4,3)<=WINDOW_2(3,4);
               WINDOW_2(4,4)<=WINDOW_2(4,3);


               WINDOW_3(0,0)<=DIN_3_5;
               WINDOW_3(0,1)<=WINDOW_3(0,0);
               WINDOW_3(0,2)<=WINDOW_3(0,1);
               WINDOW_3(0,3)<=WINDOW_3(0,2);
               WINDOW_3(0,4)<=WINDOW_3(0,3);
               WINDOW_3(1,0)<=WINDOW_3(0,4);
               WINDOW_3(1,1)<=WINDOW_3(1,0);
               WINDOW_3(1,2)<=WINDOW_3(1,1);
               WINDOW_3(1,3)<=WINDOW_3(1,2);
               WINDOW_3(1,4)<=WINDOW_3(1,3);
               WINDOW_3(2,0)<=WINDOW_3(1,4);
               WINDOW_3(2,1)<=WINDOW_3(1,4);
               WINDOW_3(2,2)<=WINDOW_3(2,1);
               WINDOW_3(2,3)<=WINDOW_3(2,2);
               WINDOW_3(2,4)<=WINDOW_3(2,3);
               WINDOW_3(3,0)<=WINDOW_3(2,4);
               WINDOW_3(3,1)<=WINDOW_3(2,4);
               WINDOW_3(3,2)<=WINDOW_3(2,4);
               WINDOW_3(3,3)<=WINDOW_3(3,2);
               WINDOW_3(3,4)<=WINDOW_3(3,3);
               WINDOW_3(4,0)<=WINDOW_3(3,4);
               WINDOW_3(4,1)<=WINDOW_3(3,4);
               WINDOW_3(4,2)<=WINDOW_3(3,4);
               WINDOW_3(4,3)<=WINDOW_3(3,4);
               WINDOW_3(4,4)<=WINDOW_3(4,3);


               WINDOW_4(0,0)<=DIN_4_5;
               WINDOW_4(0,1)<=WINDOW_4(0,0);
               WINDOW_4(0,2)<=WINDOW_4(0,1);
               WINDOW_4(0,3)<=WINDOW_4(0,2);
               WINDOW_4(0,4)<=WINDOW_4(0,3);
               WINDOW_4(1,0)<=WINDOW_4(0,4);
               WINDOW_4(1,1)<=WINDOW_4(1,0);
               WINDOW_4(1,2)<=WINDOW_4(1,1);
               WINDOW_4(1,3)<=WINDOW_4(1,2);
               WINDOW_4(1,4)<=WINDOW_4(1,3);
               WINDOW_4(2,0)<=WINDOW_4(1,4);
               WINDOW_4(2,1)<=WINDOW_4(1,4);
               WINDOW_4(2,2)<=WINDOW_4(2,1);
               WINDOW_4(2,3)<=WINDOW_4(2,2);
               WINDOW_4(2,4)<=WINDOW_4(2,3);
               WINDOW_4(3,0)<=WINDOW_4(2,4);
               WINDOW_4(3,1)<=WINDOW_4(2,4);
               WINDOW_4(3,2)<=WINDOW_4(2,4);
               WINDOW_4(3,3)<=WINDOW_4(3,2);
               WINDOW_4(3,4)<=WINDOW_4(3,3);
               WINDOW_4(4,0)<=WINDOW_4(3,4);
               WINDOW_4(4,1)<=WINDOW_4(3,4);
               WINDOW_4(4,2)<=WINDOW_4(3,4);
               WINDOW_4(4,3)<=WINDOW_4(3,4);
               WINDOW_4(4,4)<=WINDOW_4(4,3);


               WINDOW_5(0,0)<=DIN_5_5;
               WINDOW_5(0,1)<=WINDOW_5(0,0);
               WINDOW_5(0,2)<=WINDOW_5(0,1);
               WINDOW_5(0,3)<=WINDOW_5(0,2);
               WINDOW_5(0,4)<=WINDOW_5(0,3);
               WINDOW_5(1,0)<=WINDOW_5(0,4);
               WINDOW_5(1,1)<=WINDOW_5(1,0);
               WINDOW_5(1,2)<=WINDOW_5(1,1);
               WINDOW_5(1,3)<=WINDOW_5(1,2);
               WINDOW_5(1,4)<=WINDOW_5(1,3);
               WINDOW_5(2,0)<=WINDOW_5(1,4);
               WINDOW_5(2,1)<=WINDOW_5(1,4);
               WINDOW_5(2,2)<=WINDOW_5(2,1);
               WINDOW_5(2,3)<=WINDOW_5(2,2);
               WINDOW_5(2,4)<=WINDOW_5(2,3);
               WINDOW_5(3,0)<=WINDOW_5(2,4);
               WINDOW_5(3,1)<=WINDOW_5(2,4);
               WINDOW_5(3,2)<=WINDOW_5(2,4);
               WINDOW_5(3,3)<=WINDOW_5(3,2);
               WINDOW_5(3,4)<=WINDOW_5(3,3);
               WINDOW_5(4,0)<=WINDOW_5(3,4);
               WINDOW_5(4,1)<=WINDOW_5(3,4);
               WINDOW_5(4,2)<=WINDOW_5(3,4);
               WINDOW_5(4,3)<=WINDOW_5(3,4);
               WINDOW_5(4,4)<=WINDOW_5(4,3);


               WINDOW_6(0,0)<=DIN_6_5;
               WINDOW_6(0,1)<=WINDOW_6(0,0);
               WINDOW_6(0,2)<=WINDOW_6(0,1);
               WINDOW_6(0,3)<=WINDOW_6(0,2);
               WINDOW_6(0,4)<=WINDOW_6(0,3);
               WINDOW_6(1,0)<=WINDOW_6(0,4);
               WINDOW_6(1,1)<=WINDOW_6(1,0);
               WINDOW_6(1,2)<=WINDOW_6(1,1);
               WINDOW_6(1,3)<=WINDOW_6(1,2);
               WINDOW_6(1,4)<=WINDOW_6(1,3);
               WINDOW_6(2,0)<=WINDOW_6(1,4);
               WINDOW_6(2,1)<=WINDOW_6(1,4);
               WINDOW_6(2,2)<=WINDOW_6(2,1);
               WINDOW_6(2,3)<=WINDOW_6(2,2);
               WINDOW_6(2,4)<=WINDOW_6(2,3);
               WINDOW_6(3,0)<=WINDOW_6(2,4);
               WINDOW_6(3,1)<=WINDOW_6(2,4);
               WINDOW_6(3,2)<=WINDOW_6(2,4);
               WINDOW_6(3,3)<=WINDOW_6(3,2);
               WINDOW_6(3,4)<=WINDOW_6(3,3);
               WINDOW_6(4,0)<=WINDOW_6(3,4);
               WINDOW_6(4,1)<=WINDOW_6(3,4);
               WINDOW_6(4,2)<=WINDOW_6(3,4);
               WINDOW_6(4,3)<=WINDOW_6(3,4);
               WINDOW_6(4,4)<=WINDOW_6(4,3);


               WINDOW_7(0,0)<=DIN_7_5;
               WINDOW_7(0,1)<=WINDOW_7(0,0);
               WINDOW_7(0,2)<=WINDOW_7(0,1);
               WINDOW_7(0,3)<=WINDOW_7(0,2);
               WINDOW_7(0,4)<=WINDOW_7(0,3);
               WINDOW_7(1,0)<=WINDOW_7(0,4);
               WINDOW_7(1,1)<=WINDOW_7(1,0);
               WINDOW_7(1,2)<=WINDOW_7(1,1);
               WINDOW_7(1,3)<=WINDOW_7(1,2);
               WINDOW_7(1,4)<=WINDOW_7(1,3);
               WINDOW_7(2,0)<=WINDOW_7(1,4);
               WINDOW_7(2,1)<=WINDOW_7(1,4);
               WINDOW_7(2,2)<=WINDOW_7(2,1);
               WINDOW_7(2,3)<=WINDOW_7(2,2);
               WINDOW_7(2,4)<=WINDOW_7(2,3);
               WINDOW_7(3,0)<=WINDOW_7(2,4);
               WINDOW_7(3,1)<=WINDOW_7(2,4);
               WINDOW_7(3,2)<=WINDOW_7(2,4);
               WINDOW_7(3,3)<=WINDOW_7(3,2);
               WINDOW_7(3,4)<=WINDOW_7(3,3);
               WINDOW_7(4,0)<=WINDOW_7(3,4);
               WINDOW_7(4,1)<=WINDOW_7(3,4);
               WINDOW_7(4,2)<=WINDOW_7(3,4);
               WINDOW_7(4,3)<=WINDOW_7(3,4);
               WINDOW_7(4,4)<=WINDOW_7(4,3);


               WINDOW_8(0,0)<=DIN_8_5;
               WINDOW_8(0,1)<=WINDOW_8(0,0);
               WINDOW_8(0,2)<=WINDOW_8(0,1);
               WINDOW_8(0,3)<=WINDOW_8(0,2);
               WINDOW_8(0,4)<=WINDOW_8(0,3);
               WINDOW_8(1,0)<=WINDOW_8(0,4);
               WINDOW_8(1,1)<=WINDOW_8(1,0);
               WINDOW_8(1,2)<=WINDOW_8(1,1);
               WINDOW_8(1,3)<=WINDOW_8(1,2);
               WINDOW_8(1,4)<=WINDOW_8(1,3);
               WINDOW_8(2,0)<=WINDOW_8(1,4);
               WINDOW_8(2,1)<=WINDOW_8(1,4);
               WINDOW_8(2,2)<=WINDOW_8(2,1);
               WINDOW_8(2,3)<=WINDOW_8(2,2);
               WINDOW_8(2,4)<=WINDOW_8(2,3);
               WINDOW_8(3,0)<=WINDOW_8(2,4);
               WINDOW_8(3,1)<=WINDOW_8(2,4);
               WINDOW_8(3,2)<=WINDOW_8(2,4);
               WINDOW_8(3,3)<=WINDOW_8(3,2);
               WINDOW_8(3,4)<=WINDOW_8(3,3);
               WINDOW_8(4,0)<=WINDOW_8(3,4);
               WINDOW_8(4,1)<=WINDOW_8(3,4);
               WINDOW_8(4,2)<=WINDOW_8(3,4);
               WINDOW_8(4,3)<=WINDOW_8(3,4);
               WINDOW_8(4,4)<=WINDOW_8(4,3);


               WINDOW_9(0,0)<=DIN_9_5;
               WINDOW_9(0,1)<=WINDOW_9(0,0);
               WINDOW_9(0,2)<=WINDOW_9(0,1);
               WINDOW_9(0,3)<=WINDOW_9(0,2);
               WINDOW_9(0,4)<=WINDOW_9(0,3);
               WINDOW_9(1,0)<=WINDOW_9(0,4);
               WINDOW_9(1,1)<=WINDOW_9(1,0);
               WINDOW_9(1,2)<=WINDOW_9(1,1);
               WINDOW_9(1,3)<=WINDOW_9(1,2);
               WINDOW_9(1,4)<=WINDOW_9(1,3);
               WINDOW_9(2,0)<=WINDOW_9(1,4);
               WINDOW_9(2,1)<=WINDOW_9(1,4);
               WINDOW_9(2,2)<=WINDOW_9(2,1);
               WINDOW_9(2,3)<=WINDOW_9(2,2);
               WINDOW_9(2,4)<=WINDOW_9(2,3);
               WINDOW_9(3,0)<=WINDOW_9(2,4);
               WINDOW_9(3,1)<=WINDOW_9(2,4);
               WINDOW_9(3,2)<=WINDOW_9(2,4);
               WINDOW_9(3,3)<=WINDOW_9(3,2);
               WINDOW_9(3,4)<=WINDOW_9(3,3);
               WINDOW_9(4,0)<=WINDOW_9(3,4);
               WINDOW_9(4,1)<=WINDOW_9(3,4);
               WINDOW_9(4,2)<=WINDOW_9(3,4);
               WINDOW_9(4,3)<=WINDOW_9(3,4);
               WINDOW_9(4,4)<=WINDOW_9(4,3);


               WINDOW_10(0,0)<=DIN_10_5;
               WINDOW_10(0,1)<=WINDOW_10(0,0);
               WINDOW_10(0,2)<=WINDOW_10(0,1);
               WINDOW_10(0,3)<=WINDOW_10(0,2);
               WINDOW_10(0,4)<=WINDOW_10(0,3);
               WINDOW_10(1,0)<=WINDOW_10(0,4);
               WINDOW_10(1,1)<=WINDOW_10(1,0);
               WINDOW_10(1,2)<=WINDOW_10(1,1);
               WINDOW_10(1,3)<=WINDOW_10(1,2);
               WINDOW_10(1,4)<=WINDOW_10(1,3);
               WINDOW_10(2,0)<=WINDOW_10(1,4);
               WINDOW_10(2,1)<=WINDOW_10(1,4);
               WINDOW_10(2,2)<=WINDOW_10(2,1);
               WINDOW_10(2,3)<=WINDOW_10(2,2);
               WINDOW_10(2,4)<=WINDOW_10(2,3);
               WINDOW_10(3,0)<=WINDOW_10(2,4);
               WINDOW_10(3,1)<=WINDOW_10(2,4);
               WINDOW_10(3,2)<=WINDOW_10(2,4);
               WINDOW_10(3,3)<=WINDOW_10(3,2);
               WINDOW_10(3,4)<=WINDOW_10(3,3);
               WINDOW_10(4,0)<=WINDOW_10(3,4);
               WINDOW_10(4,1)<=WINDOW_10(3,4);
               WINDOW_10(4,2)<=WINDOW_10(3,4);
               WINDOW_10(4,3)<=WINDOW_10(3,4);
               WINDOW_10(4,4)<=WINDOW_10(4,3);


               WINDOW_11(0,0)<=DIN_11_5;
               WINDOW_11(0,1)<=WINDOW_11(0,0);
               WINDOW_11(0,2)<=WINDOW_11(0,1);
               WINDOW_11(0,3)<=WINDOW_11(0,2);
               WINDOW_11(0,4)<=WINDOW_11(0,3);
               WINDOW_11(1,0)<=WINDOW_11(0,4);
               WINDOW_11(1,1)<=WINDOW_11(1,0);
               WINDOW_11(1,2)<=WINDOW_11(1,1);
               WINDOW_11(1,3)<=WINDOW_11(1,2);
               WINDOW_11(1,4)<=WINDOW_11(1,3);
               WINDOW_11(2,0)<=WINDOW_11(1,4);
               WINDOW_11(2,1)<=WINDOW_11(1,4);
               WINDOW_11(2,2)<=WINDOW_11(2,1);
               WINDOW_11(2,3)<=WINDOW_11(2,2);
               WINDOW_11(2,4)<=WINDOW_11(2,3);
               WINDOW_11(3,0)<=WINDOW_11(2,4);
               WINDOW_11(3,1)<=WINDOW_11(2,4);
               WINDOW_11(3,2)<=WINDOW_11(2,4);
               WINDOW_11(3,3)<=WINDOW_11(3,2);
               WINDOW_11(3,4)<=WINDOW_11(3,3);
               WINDOW_11(4,0)<=WINDOW_11(3,4);
               WINDOW_11(4,1)<=WINDOW_11(3,4);
               WINDOW_11(4,2)<=WINDOW_11(3,4);
               WINDOW_11(4,3)<=WINDOW_11(3,4);
               WINDOW_11(4,4)<=WINDOW_11(4,3);


               WINDOW_12(0,0)<=DIN_12_5;
               WINDOW_12(0,1)<=WINDOW_12(0,0);
               WINDOW_12(0,2)<=WINDOW_12(0,1);
               WINDOW_12(0,3)<=WINDOW_12(0,2);
               WINDOW_12(0,4)<=WINDOW_12(0,3);
               WINDOW_12(1,0)<=WINDOW_12(0,4);
               WINDOW_12(1,1)<=WINDOW_12(1,0);
               WINDOW_12(1,2)<=WINDOW_12(1,1);
               WINDOW_12(1,3)<=WINDOW_12(1,2);
               WINDOW_12(1,4)<=WINDOW_12(1,3);
               WINDOW_12(2,0)<=WINDOW_12(1,4);
               WINDOW_12(2,1)<=WINDOW_12(1,4);
               WINDOW_12(2,2)<=WINDOW_12(2,1);
               WINDOW_12(2,3)<=WINDOW_12(2,2);
               WINDOW_12(2,4)<=WINDOW_12(2,3);
               WINDOW_12(3,0)<=WINDOW_12(2,4);
               WINDOW_12(3,1)<=WINDOW_12(2,4);
               WINDOW_12(3,2)<=WINDOW_12(2,4);
               WINDOW_12(3,3)<=WINDOW_12(3,2);
               WINDOW_12(3,4)<=WINDOW_12(3,3);
               WINDOW_12(4,0)<=WINDOW_12(3,4);
               WINDOW_12(4,1)<=WINDOW_12(3,4);
               WINDOW_12(4,2)<=WINDOW_12(3,4);
               WINDOW_12(4,3)<=WINDOW_12(3,4);
               WINDOW_12(4,4)<=WINDOW_12(4,3);


               WINDOW_13(0,0)<=DIN_13_5;
               WINDOW_13(0,1)<=WINDOW_13(0,0);
               WINDOW_13(0,2)<=WINDOW_13(0,1);
               WINDOW_13(0,3)<=WINDOW_13(0,2);
               WINDOW_13(0,4)<=WINDOW_13(0,3);
               WINDOW_13(1,0)<=WINDOW_13(0,4);
               WINDOW_13(1,1)<=WINDOW_13(1,0);
               WINDOW_13(1,2)<=WINDOW_13(1,1);
               WINDOW_13(1,3)<=WINDOW_13(1,2);
               WINDOW_13(1,4)<=WINDOW_13(1,3);
               WINDOW_13(2,0)<=WINDOW_13(1,4);
               WINDOW_13(2,1)<=WINDOW_13(1,4);
               WINDOW_13(2,2)<=WINDOW_13(2,1);
               WINDOW_13(2,3)<=WINDOW_13(2,2);
               WINDOW_13(2,4)<=WINDOW_13(2,3);
               WINDOW_13(3,0)<=WINDOW_13(2,4);
               WINDOW_13(3,1)<=WINDOW_13(2,4);
               WINDOW_13(3,2)<=WINDOW_13(2,4);
               WINDOW_13(3,3)<=WINDOW_13(3,2);
               WINDOW_13(3,4)<=WINDOW_13(3,3);
               WINDOW_13(4,0)<=WINDOW_13(3,4);
               WINDOW_13(4,1)<=WINDOW_13(3,4);
               WINDOW_13(4,2)<=WINDOW_13(3,4);
               WINDOW_13(4,3)<=WINDOW_13(3,4);
               WINDOW_13(4,4)<=WINDOW_13(4,3);


               WINDOW_14(0,0)<=DIN_14_5;
               WINDOW_14(0,1)<=WINDOW_14(0,0);
               WINDOW_14(0,2)<=WINDOW_14(0,1);
               WINDOW_14(0,3)<=WINDOW_14(0,2);
               WINDOW_14(0,4)<=WINDOW_14(0,3);
               WINDOW_14(1,0)<=WINDOW_14(0,4);
               WINDOW_14(1,1)<=WINDOW_14(1,0);
               WINDOW_14(1,2)<=WINDOW_14(1,1);
               WINDOW_14(1,3)<=WINDOW_14(1,2);
               WINDOW_14(1,4)<=WINDOW_14(1,3);
               WINDOW_14(2,0)<=WINDOW_14(1,4);
               WINDOW_14(2,1)<=WINDOW_14(1,4);
               WINDOW_14(2,2)<=WINDOW_14(2,1);
               WINDOW_14(2,3)<=WINDOW_14(2,2);
               WINDOW_14(2,4)<=WINDOW_14(2,3);
               WINDOW_14(3,0)<=WINDOW_14(2,4);
               WINDOW_14(3,1)<=WINDOW_14(2,4);
               WINDOW_14(3,2)<=WINDOW_14(2,4);
               WINDOW_14(3,3)<=WINDOW_14(3,2);
               WINDOW_14(3,4)<=WINDOW_14(3,3);
               WINDOW_14(4,0)<=WINDOW_14(3,4);
               WINDOW_14(4,1)<=WINDOW_14(3,4);
               WINDOW_14(4,2)<=WINDOW_14(3,4);
               WINDOW_14(4,3)<=WINDOW_14(3,4);
               WINDOW_14(4,4)<=WINDOW_14(4,3);


               WINDOW_15(0,0)<=DIN_15_5;
               WINDOW_15(0,1)<=WINDOW_15(0,0);
               WINDOW_15(0,2)<=WINDOW_15(0,1);
               WINDOW_15(0,3)<=WINDOW_15(0,2);
               WINDOW_15(0,4)<=WINDOW_15(0,3);
               WINDOW_15(1,0)<=WINDOW_15(0,4);
               WINDOW_15(1,1)<=WINDOW_15(1,0);
               WINDOW_15(1,2)<=WINDOW_15(1,1);
               WINDOW_15(1,3)<=WINDOW_15(1,2);
               WINDOW_15(1,4)<=WINDOW_15(1,3);
               WINDOW_15(2,0)<=WINDOW_15(1,4);
               WINDOW_15(2,1)<=WINDOW_15(1,4);
               WINDOW_15(2,2)<=WINDOW_15(2,1);
               WINDOW_15(2,3)<=WINDOW_15(2,2);
               WINDOW_15(2,4)<=WINDOW_15(2,3);
               WINDOW_15(3,0)<=WINDOW_15(2,4);
               WINDOW_15(3,1)<=WINDOW_15(2,4);
               WINDOW_15(3,2)<=WINDOW_15(2,4);
               WINDOW_15(3,3)<=WINDOW_15(3,2);
               WINDOW_15(3,4)<=WINDOW_15(3,3);
               WINDOW_15(4,0)<=WINDOW_15(3,4);
               WINDOW_15(4,1)<=WINDOW_15(3,4);
               WINDOW_15(4,2)<=WINDOW_15(3,4);
               WINDOW_15(4,3)<=WINDOW_15(3,4);
               WINDOW_15(4,4)<=WINDOW_15(4,3);


               WINDOW_16(0,0)<=DIN_16_5;
               WINDOW_16(0,1)<=WINDOW_16(0,0);
               WINDOW_16(0,2)<=WINDOW_16(0,1);
               WINDOW_16(0,3)<=WINDOW_16(0,2);
               WINDOW_16(0,4)<=WINDOW_16(0,3);
               WINDOW_16(1,0)<=WINDOW_16(0,4);
               WINDOW_16(1,1)<=WINDOW_16(1,0);
               WINDOW_16(1,2)<=WINDOW_16(1,1);
               WINDOW_16(1,3)<=WINDOW_16(1,2);
               WINDOW_16(1,4)<=WINDOW_16(1,3);
               WINDOW_16(2,0)<=WINDOW_16(1,4);
               WINDOW_16(2,1)<=WINDOW_16(1,4);
               WINDOW_16(2,2)<=WINDOW_16(2,1);
               WINDOW_16(2,3)<=WINDOW_16(2,2);
               WINDOW_16(2,4)<=WINDOW_16(2,3);
               WINDOW_16(3,0)<=WINDOW_16(2,4);
               WINDOW_16(3,1)<=WINDOW_16(2,4);
               WINDOW_16(3,2)<=WINDOW_16(2,4);
               WINDOW_16(3,3)<=WINDOW_16(3,2);
               WINDOW_16(3,4)<=WINDOW_16(3,3);
               WINDOW_16(4,0)<=WINDOW_16(3,4);
               WINDOW_16(4,1)<=WINDOW_16(3,4);
               WINDOW_16(4,2)<=WINDOW_16(3,4);
               WINDOW_16(4,3)<=WINDOW_16(3,4);
               WINDOW_16(4,4)<=WINDOW_16(4,3);

                if PIXEL_COUNT=(PF_X2_SIZE-1) then
                Enable_ONEHOT<='1';
                else
                PIXEL_COUNT<=PIXEL_COUNT+1;
                end if;

      -------------------------------------------- Enable ONE_HOT START --------------------------------------------				
	
		if Enable_ONEHOT='1' then


               DOUT_BUF_1_5<=std_logic_vector(signed(WINDOW_1(0,0)));
               DOUT_BUF_2_5<=std_logic_vector(signed(WINDOW_1(0,1)));
               DOUT_BUF_3_5<=std_logic_vector(signed(WINDOW_1(0,2)));
               DOUT_BUF_4_5<=std_logic_vector(signed(WINDOW_1(0,3)));
               DOUT_BUF_5_5<=std_logic_vector(signed(WINDOW_1(0,4)));
               DOUT_BUF_6_5<=std_logic_vector(signed(WINDOW_1(1,0)));
               DOUT_BUF_7_5<=std_logic_vector(signed(WINDOW_1(1,1)));
               DOUT_BUF_8_5<=std_logic_vector(signed(WINDOW_1(1,2)));
               DOUT_BUF_9_5<=std_logic_vector(signed(WINDOW_1(1,3)));
               DOUT_BUF_10_5<=std_logic_vector(signed(WINDOW_1(1,4)));
               DOUT_BUF_11_5<=std_logic_vector(signed(WINDOW_1(2,0)));
               DOUT_BUF_12_5<=std_logic_vector(signed(WINDOW_1(2,1)));
               DOUT_BUF_13_5<=std_logic_vector(signed(WINDOW_1(2,2)));
               DOUT_BUF_14_5<=std_logic_vector(signed(WINDOW_1(2,3)));
               DOUT_BUF_15_5<=std_logic_vector(signed(WINDOW_1(2,4)));
               DOUT_BUF_16_5<=std_logic_vector(signed(WINDOW_1(3,0)));
               DOUT_BUF_17_5<=std_logic_vector(signed(WINDOW_1(3,1)));
               DOUT_BUF_18_5<=std_logic_vector(signed(WINDOW_1(3,2)));
               DOUT_BUF_19_5<=std_logic_vector(signed(WINDOW_1(3,3)));
               DOUT_BUF_20_5<=std_logic_vector(signed(WINDOW_1(3,4)));
               DOUT_BUF_21_5<=std_logic_vector(signed(WINDOW_1(4,0)));
               DOUT_BUF_22_5<=std_logic_vector(signed(WINDOW_1(4,1)));
               DOUT_BUF_23_5<=std_logic_vector(signed(WINDOW_1(4,2)));
               DOUT_BUF_24_5<=std_logic_vector(signed(WINDOW_1(4,3)));
               DOUT_BUF_25_5<=std_logic_vector(signed(WINDOW_1(4,4)));

               DOUT_BUF_26_5<=std_logic_vector(signed(WINDOW_2(0,0)));
               DOUT_BUF_27_5<=std_logic_vector(signed(WINDOW_2(0,1)));
               DOUT_BUF_28_5<=std_logic_vector(signed(WINDOW_2(0,2)));
               DOUT_BUF_29_5<=std_logic_vector(signed(WINDOW_2(0,3)));
               DOUT_BUF_30_5<=std_logic_vector(signed(WINDOW_2(0,4)));
               DOUT_BUF_31_5<=std_logic_vector(signed(WINDOW_2(1,0)));
               DOUT_BUF_32_5<=std_logic_vector(signed(WINDOW_2(1,1)));
               DOUT_BUF_33_5<=std_logic_vector(signed(WINDOW_2(1,2)));
               DOUT_BUF_34_5<=std_logic_vector(signed(WINDOW_2(1,3)));
               DOUT_BUF_35_5<=std_logic_vector(signed(WINDOW_2(1,4)));
               DOUT_BUF_36_5<=std_logic_vector(signed(WINDOW_2(2,0)));
               DOUT_BUF_37_5<=std_logic_vector(signed(WINDOW_2(2,1)));
               DOUT_BUF_38_5<=std_logic_vector(signed(WINDOW_2(2,2)));
               DOUT_BUF_39_5<=std_logic_vector(signed(WINDOW_2(2,3)));
               DOUT_BUF_40_5<=std_logic_vector(signed(WINDOW_2(2,4)));
               DOUT_BUF_41_5<=std_logic_vector(signed(WINDOW_2(3,0)));
               DOUT_BUF_42_5<=std_logic_vector(signed(WINDOW_2(3,1)));
               DOUT_BUF_43_5<=std_logic_vector(signed(WINDOW_2(3,2)));
               DOUT_BUF_44_5<=std_logic_vector(signed(WINDOW_2(3,3)));
               DOUT_BUF_45_5<=std_logic_vector(signed(WINDOW_2(3,4)));
               DOUT_BUF_46_5<=std_logic_vector(signed(WINDOW_2(4,0)));
               DOUT_BUF_47_5<=std_logic_vector(signed(WINDOW_2(4,1)));
               DOUT_BUF_48_5<=std_logic_vector(signed(WINDOW_2(4,2)));
               DOUT_BUF_49_5<=std_logic_vector(signed(WINDOW_2(4,3)));
               DOUT_BUF_50_5<=std_logic_vector(signed(WINDOW_2(4,4)));

               DOUT_BUF_51_5<=std_logic_vector(signed(WINDOW_3(0,0)));
               DOUT_BUF_52_5<=std_logic_vector(signed(WINDOW_3(0,1)));
               DOUT_BUF_53_5<=std_logic_vector(signed(WINDOW_3(0,2)));
               DOUT_BUF_54_5<=std_logic_vector(signed(WINDOW_3(0,3)));
               DOUT_BUF_55_5<=std_logic_vector(signed(WINDOW_3(0,4)));
               DOUT_BUF_56_5<=std_logic_vector(signed(WINDOW_3(1,0)));
               DOUT_BUF_57_5<=std_logic_vector(signed(WINDOW_3(1,1)));
               DOUT_BUF_58_5<=std_logic_vector(signed(WINDOW_3(1,2)));
               DOUT_BUF_59_5<=std_logic_vector(signed(WINDOW_3(1,3)));
               DOUT_BUF_60_5<=std_logic_vector(signed(WINDOW_3(1,4)));
               DOUT_BUF_61_5<=std_logic_vector(signed(WINDOW_3(2,0)));
               DOUT_BUF_62_5<=std_logic_vector(signed(WINDOW_3(2,1)));
               DOUT_BUF_63_5<=std_logic_vector(signed(WINDOW_3(2,2)));
               DOUT_BUF_64_5<=std_logic_vector(signed(WINDOW_3(2,3)));
               DOUT_BUF_65_5<=std_logic_vector(signed(WINDOW_3(2,4)));
               DOUT_BUF_66_5<=std_logic_vector(signed(WINDOW_3(3,0)));
               DOUT_BUF_67_5<=std_logic_vector(signed(WINDOW_3(3,1)));
               DOUT_BUF_68_5<=std_logic_vector(signed(WINDOW_3(3,2)));
               DOUT_BUF_69_5<=std_logic_vector(signed(WINDOW_3(3,3)));
               DOUT_BUF_70_5<=std_logic_vector(signed(WINDOW_3(3,4)));
               DOUT_BUF_71_5<=std_logic_vector(signed(WINDOW_3(4,0)));
               DOUT_BUF_72_5<=std_logic_vector(signed(WINDOW_3(4,1)));
               DOUT_BUF_73_5<=std_logic_vector(signed(WINDOW_3(4,2)));
               DOUT_BUF_74_5<=std_logic_vector(signed(WINDOW_3(4,3)));
               DOUT_BUF_75_5<=std_logic_vector(signed(WINDOW_3(4,4)));

               DOUT_BUF_76_5<=std_logic_vector(signed(WINDOW_4(0,0)));
               DOUT_BUF_77_5<=std_logic_vector(signed(WINDOW_4(0,1)));
               DOUT_BUF_78_5<=std_logic_vector(signed(WINDOW_4(0,2)));
               DOUT_BUF_79_5<=std_logic_vector(signed(WINDOW_4(0,3)));
               DOUT_BUF_80_5<=std_logic_vector(signed(WINDOW_4(0,4)));
               DOUT_BUF_81_5<=std_logic_vector(signed(WINDOW_4(1,0)));
               DOUT_BUF_82_5<=std_logic_vector(signed(WINDOW_4(1,1)));
               DOUT_BUF_83_5<=std_logic_vector(signed(WINDOW_4(1,2)));
               DOUT_BUF_84_5<=std_logic_vector(signed(WINDOW_4(1,3)));
               DOUT_BUF_85_5<=std_logic_vector(signed(WINDOW_4(1,4)));
               DOUT_BUF_86_5<=std_logic_vector(signed(WINDOW_4(2,0)));
               DOUT_BUF_87_5<=std_logic_vector(signed(WINDOW_4(2,1)));
               DOUT_BUF_88_5<=std_logic_vector(signed(WINDOW_4(2,2)));
               DOUT_BUF_89_5<=std_logic_vector(signed(WINDOW_4(2,3)));
               DOUT_BUF_90_5<=std_logic_vector(signed(WINDOW_4(2,4)));
               DOUT_BUF_91_5<=std_logic_vector(signed(WINDOW_4(3,0)));
               DOUT_BUF_92_5<=std_logic_vector(signed(WINDOW_4(3,1)));
               DOUT_BUF_93_5<=std_logic_vector(signed(WINDOW_4(3,2)));
               DOUT_BUF_94_5<=std_logic_vector(signed(WINDOW_4(3,3)));
               DOUT_BUF_95_5<=std_logic_vector(signed(WINDOW_4(3,4)));
               DOUT_BUF_96_5<=std_logic_vector(signed(WINDOW_4(4,0)));
               DOUT_BUF_97_5<=std_logic_vector(signed(WINDOW_4(4,1)));
               DOUT_BUF_98_5<=std_logic_vector(signed(WINDOW_4(4,2)));
               DOUT_BUF_99_5<=std_logic_vector(signed(WINDOW_4(4,3)));
               DOUT_BUF_100_5<=std_logic_vector(signed(WINDOW_4(4,4)));

               DOUT_BUF_101_5<=std_logic_vector(signed(WINDOW_5(0,0)));
               DOUT_BUF_102_5<=std_logic_vector(signed(WINDOW_5(0,1)));
               DOUT_BUF_103_5<=std_logic_vector(signed(WINDOW_5(0,2)));
               DOUT_BUF_104_5<=std_logic_vector(signed(WINDOW_5(0,3)));
               DOUT_BUF_105_5<=std_logic_vector(signed(WINDOW_5(0,4)));
               DOUT_BUF_106_5<=std_logic_vector(signed(WINDOW_5(1,0)));
               DOUT_BUF_107_5<=std_logic_vector(signed(WINDOW_5(1,1)));
               DOUT_BUF_108_5<=std_logic_vector(signed(WINDOW_5(1,2)));
               DOUT_BUF_109_5<=std_logic_vector(signed(WINDOW_5(1,3)));
               DOUT_BUF_110_5<=std_logic_vector(signed(WINDOW_5(1,4)));
               DOUT_BUF_111_5<=std_logic_vector(signed(WINDOW_5(2,0)));
               DOUT_BUF_112_5<=std_logic_vector(signed(WINDOW_5(2,1)));
               DOUT_BUF_113_5<=std_logic_vector(signed(WINDOW_5(2,2)));
               DOUT_BUF_114_5<=std_logic_vector(signed(WINDOW_5(2,3)));
               DOUT_BUF_115_5<=std_logic_vector(signed(WINDOW_5(2,4)));
               DOUT_BUF_116_5<=std_logic_vector(signed(WINDOW_5(3,0)));
               DOUT_BUF_117_5<=std_logic_vector(signed(WINDOW_5(3,1)));
               DOUT_BUF_118_5<=std_logic_vector(signed(WINDOW_5(3,2)));
               DOUT_BUF_119_5<=std_logic_vector(signed(WINDOW_5(3,3)));
               DOUT_BUF_120_5<=std_logic_vector(signed(WINDOW_5(3,4)));
               DOUT_BUF_121_5<=std_logic_vector(signed(WINDOW_5(4,0)));
               DOUT_BUF_122_5<=std_logic_vector(signed(WINDOW_5(4,1)));
               DOUT_BUF_123_5<=std_logic_vector(signed(WINDOW_5(4,2)));
               DOUT_BUF_124_5<=std_logic_vector(signed(WINDOW_5(4,3)));
               DOUT_BUF_125_5<=std_logic_vector(signed(WINDOW_5(4,4)));

               DOUT_BUF_126_5<=std_logic_vector(signed(WINDOW_6(0,0)));
               DOUT_BUF_127_5<=std_logic_vector(signed(WINDOW_6(0,1)));
               DOUT_BUF_128_5<=std_logic_vector(signed(WINDOW_6(0,2)));
               DOUT_BUF_129_5<=std_logic_vector(signed(WINDOW_6(0,3)));
               DOUT_BUF_130_5<=std_logic_vector(signed(WINDOW_6(0,4)));
               DOUT_BUF_131_5<=std_logic_vector(signed(WINDOW_6(1,0)));
               DOUT_BUF_132_5<=std_logic_vector(signed(WINDOW_6(1,1)));
               DOUT_BUF_133_5<=std_logic_vector(signed(WINDOW_6(1,2)));
               DOUT_BUF_134_5<=std_logic_vector(signed(WINDOW_6(1,3)));
               DOUT_BUF_135_5<=std_logic_vector(signed(WINDOW_6(1,4)));
               DOUT_BUF_136_5<=std_logic_vector(signed(WINDOW_6(2,0)));
               DOUT_BUF_137_5<=std_logic_vector(signed(WINDOW_6(2,1)));
               DOUT_BUF_138_5<=std_logic_vector(signed(WINDOW_6(2,2)));
               DOUT_BUF_139_5<=std_logic_vector(signed(WINDOW_6(2,3)));
               DOUT_BUF_140_5<=std_logic_vector(signed(WINDOW_6(2,4)));
               DOUT_BUF_141_5<=std_logic_vector(signed(WINDOW_6(3,0)));
               DOUT_BUF_142_5<=std_logic_vector(signed(WINDOW_6(3,1)));
               DOUT_BUF_143_5<=std_logic_vector(signed(WINDOW_6(3,2)));
               DOUT_BUF_144_5<=std_logic_vector(signed(WINDOW_6(3,3)));
               DOUT_BUF_145_5<=std_logic_vector(signed(WINDOW_6(3,4)));
               DOUT_BUF_146_5<=std_logic_vector(signed(WINDOW_6(4,0)));
               DOUT_BUF_147_5<=std_logic_vector(signed(WINDOW_6(4,1)));
               DOUT_BUF_148_5<=std_logic_vector(signed(WINDOW_6(4,2)));
               DOUT_BUF_149_5<=std_logic_vector(signed(WINDOW_6(4,3)));
               DOUT_BUF_150_5<=std_logic_vector(signed(WINDOW_6(4,4)));

               DOUT_BUF_151_5<=std_logic_vector(signed(WINDOW_7(0,0)));
               DOUT_BUF_152_5<=std_logic_vector(signed(WINDOW_7(0,1)));
               DOUT_BUF_153_5<=std_logic_vector(signed(WINDOW_7(0,2)));
               DOUT_BUF_154_5<=std_logic_vector(signed(WINDOW_7(0,3)));
               DOUT_BUF_155_5<=std_logic_vector(signed(WINDOW_7(0,4)));
               DOUT_BUF_156_5<=std_logic_vector(signed(WINDOW_7(1,0)));
               DOUT_BUF_157_5<=std_logic_vector(signed(WINDOW_7(1,1)));
               DOUT_BUF_158_5<=std_logic_vector(signed(WINDOW_7(1,2)));
               DOUT_BUF_159_5<=std_logic_vector(signed(WINDOW_7(1,3)));
               DOUT_BUF_160_5<=std_logic_vector(signed(WINDOW_7(1,4)));
               DOUT_BUF_161_5<=std_logic_vector(signed(WINDOW_7(2,0)));
               DOUT_BUF_162_5<=std_logic_vector(signed(WINDOW_7(2,1)));
               DOUT_BUF_163_5<=std_logic_vector(signed(WINDOW_7(2,2)));
               DOUT_BUF_164_5<=std_logic_vector(signed(WINDOW_7(2,3)));
               DOUT_BUF_165_5<=std_logic_vector(signed(WINDOW_7(2,4)));
               DOUT_BUF_166_5<=std_logic_vector(signed(WINDOW_7(3,0)));
               DOUT_BUF_167_5<=std_logic_vector(signed(WINDOW_7(3,1)));
               DOUT_BUF_168_5<=std_logic_vector(signed(WINDOW_7(3,2)));
               DOUT_BUF_169_5<=std_logic_vector(signed(WINDOW_7(3,3)));
               DOUT_BUF_170_5<=std_logic_vector(signed(WINDOW_7(3,4)));
               DOUT_BUF_171_5<=std_logic_vector(signed(WINDOW_7(4,0)));
               DOUT_BUF_172_5<=std_logic_vector(signed(WINDOW_7(4,1)));
               DOUT_BUF_173_5<=std_logic_vector(signed(WINDOW_7(4,2)));
               DOUT_BUF_174_5<=std_logic_vector(signed(WINDOW_7(4,3)));
               DOUT_BUF_175_5<=std_logic_vector(signed(WINDOW_7(4,4)));

               DOUT_BUF_176_5<=std_logic_vector(signed(WINDOW_8(0,0)));
               DOUT_BUF_177_5<=std_logic_vector(signed(WINDOW_8(0,1)));
               DOUT_BUF_178_5<=std_logic_vector(signed(WINDOW_8(0,2)));
               DOUT_BUF_179_5<=std_logic_vector(signed(WINDOW_8(0,3)));
               DOUT_BUF_180_5<=std_logic_vector(signed(WINDOW_8(0,4)));
               DOUT_BUF_181_5<=std_logic_vector(signed(WINDOW_8(1,0)));
               DOUT_BUF_182_5<=std_logic_vector(signed(WINDOW_8(1,1)));
               DOUT_BUF_183_5<=std_logic_vector(signed(WINDOW_8(1,2)));
               DOUT_BUF_184_5<=std_logic_vector(signed(WINDOW_8(1,3)));
               DOUT_BUF_185_5<=std_logic_vector(signed(WINDOW_8(1,4)));
               DOUT_BUF_186_5<=std_logic_vector(signed(WINDOW_8(2,0)));
               DOUT_BUF_187_5<=std_logic_vector(signed(WINDOW_8(2,1)));
               DOUT_BUF_188_5<=std_logic_vector(signed(WINDOW_8(2,2)));
               DOUT_BUF_189_5<=std_logic_vector(signed(WINDOW_8(2,3)));
               DOUT_BUF_190_5<=std_logic_vector(signed(WINDOW_8(2,4)));
               DOUT_BUF_191_5<=std_logic_vector(signed(WINDOW_8(3,0)));
               DOUT_BUF_192_5<=std_logic_vector(signed(WINDOW_8(3,1)));
               DOUT_BUF_193_5<=std_logic_vector(signed(WINDOW_8(3,2)));
               DOUT_BUF_194_5<=std_logic_vector(signed(WINDOW_8(3,3)));
               DOUT_BUF_195_5<=std_logic_vector(signed(WINDOW_8(3,4)));
               DOUT_BUF_196_5<=std_logic_vector(signed(WINDOW_8(4,0)));
               DOUT_BUF_197_5<=std_logic_vector(signed(WINDOW_8(4,1)));
               DOUT_BUF_198_5<=std_logic_vector(signed(WINDOW_8(4,2)));
               DOUT_BUF_199_5<=std_logic_vector(signed(WINDOW_8(4,3)));
               DOUT_BUF_200_5<=std_logic_vector(signed(WINDOW_8(4,4)));

               DOUT_BUF_201_5<=std_logic_vector(signed(WINDOW_9(0,0)));
               DOUT_BUF_202_5<=std_logic_vector(signed(WINDOW_9(0,1)));
               DOUT_BUF_203_5<=std_logic_vector(signed(WINDOW_9(0,2)));
               DOUT_BUF_204_5<=std_logic_vector(signed(WINDOW_9(0,3)));
               DOUT_BUF_205_5<=std_logic_vector(signed(WINDOW_9(0,4)));
               DOUT_BUF_206_5<=std_logic_vector(signed(WINDOW_9(1,0)));
               DOUT_BUF_207_5<=std_logic_vector(signed(WINDOW_9(1,1)));
               DOUT_BUF_208_5<=std_logic_vector(signed(WINDOW_9(1,2)));
               DOUT_BUF_209_5<=std_logic_vector(signed(WINDOW_9(1,3)));
               DOUT_BUF_210_5<=std_logic_vector(signed(WINDOW_9(1,4)));
               DOUT_BUF_211_5<=std_logic_vector(signed(WINDOW_9(2,0)));
               DOUT_BUF_212_5<=std_logic_vector(signed(WINDOW_9(2,1)));
               DOUT_BUF_213_5<=std_logic_vector(signed(WINDOW_9(2,2)));
               DOUT_BUF_214_5<=std_logic_vector(signed(WINDOW_9(2,3)));
               DOUT_BUF_215_5<=std_logic_vector(signed(WINDOW_9(2,4)));
               DOUT_BUF_216_5<=std_logic_vector(signed(WINDOW_9(3,0)));
               DOUT_BUF_217_5<=std_logic_vector(signed(WINDOW_9(3,1)));
               DOUT_BUF_218_5<=std_logic_vector(signed(WINDOW_9(3,2)));
               DOUT_BUF_219_5<=std_logic_vector(signed(WINDOW_9(3,3)));
               DOUT_BUF_220_5<=std_logic_vector(signed(WINDOW_9(3,4)));
               DOUT_BUF_221_5<=std_logic_vector(signed(WINDOW_9(4,0)));
               DOUT_BUF_222_5<=std_logic_vector(signed(WINDOW_9(4,1)));
               DOUT_BUF_223_5<=std_logic_vector(signed(WINDOW_9(4,2)));
               DOUT_BUF_224_5<=std_logic_vector(signed(WINDOW_9(4,3)));
               DOUT_BUF_225_5<=std_logic_vector(signed(WINDOW_9(4,4)));

               DOUT_BUF_226_5<=std_logic_vector(signed(WINDOW_10(0,0)));
               DOUT_BUF_227_5<=std_logic_vector(signed(WINDOW_10(0,1)));
               DOUT_BUF_228_5<=std_logic_vector(signed(WINDOW_10(0,2)));
               DOUT_BUF_229_5<=std_logic_vector(signed(WINDOW_10(0,3)));
               DOUT_BUF_230_5<=std_logic_vector(signed(WINDOW_10(0,4)));
               DOUT_BUF_231_5<=std_logic_vector(signed(WINDOW_10(1,0)));
               DOUT_BUF_232_5<=std_logic_vector(signed(WINDOW_10(1,1)));
               DOUT_BUF_233_5<=std_logic_vector(signed(WINDOW_10(1,2)));
               DOUT_BUF_234_5<=std_logic_vector(signed(WINDOW_10(1,3)));
               DOUT_BUF_235_5<=std_logic_vector(signed(WINDOW_10(1,4)));
               DOUT_BUF_236_5<=std_logic_vector(signed(WINDOW_10(2,0)));
               DOUT_BUF_237_5<=std_logic_vector(signed(WINDOW_10(2,1)));
               DOUT_BUF_238_5<=std_logic_vector(signed(WINDOW_10(2,2)));
               DOUT_BUF_239_5<=std_logic_vector(signed(WINDOW_10(2,3)));
               DOUT_BUF_240_5<=std_logic_vector(signed(WINDOW_10(2,4)));
               DOUT_BUF_241_5<=std_logic_vector(signed(WINDOW_10(3,0)));
               DOUT_BUF_242_5<=std_logic_vector(signed(WINDOW_10(3,1)));
               DOUT_BUF_243_5<=std_logic_vector(signed(WINDOW_10(3,2)));
               DOUT_BUF_244_5<=std_logic_vector(signed(WINDOW_10(3,3)));
               DOUT_BUF_245_5<=std_logic_vector(signed(WINDOW_10(3,4)));
               DOUT_BUF_246_5<=std_logic_vector(signed(WINDOW_10(4,0)));
               DOUT_BUF_247_5<=std_logic_vector(signed(WINDOW_10(4,1)));
               DOUT_BUF_248_5<=std_logic_vector(signed(WINDOW_10(4,2)));
               DOUT_BUF_249_5<=std_logic_vector(signed(WINDOW_10(4,3)));
               DOUT_BUF_250_5<=std_logic_vector(signed(WINDOW_10(4,4)));

               DOUT_BUF_251_5<=std_logic_vector(signed(WINDOW_11(0,0)));
               DOUT_BUF_252_5<=std_logic_vector(signed(WINDOW_11(0,1)));
               DOUT_BUF_253_5<=std_logic_vector(signed(WINDOW_11(0,2)));
               DOUT_BUF_254_5<=std_logic_vector(signed(WINDOW_11(0,3)));
               DOUT_BUF_255_5<=std_logic_vector(signed(WINDOW_11(0,4)));
               DOUT_BUF_256_5<=std_logic_vector(signed(WINDOW_11(1,0)));
               DOUT_BUF_257_5<=std_logic_vector(signed(WINDOW_11(1,1)));
               DOUT_BUF_258_5<=std_logic_vector(signed(WINDOW_11(1,2)));
               DOUT_BUF_259_5<=std_logic_vector(signed(WINDOW_11(1,3)));
               DOUT_BUF_260_5<=std_logic_vector(signed(WINDOW_11(1,4)));
               DOUT_BUF_261_5<=std_logic_vector(signed(WINDOW_11(2,0)));
               DOUT_BUF_262_5<=std_logic_vector(signed(WINDOW_11(2,1)));
               DOUT_BUF_263_5<=std_logic_vector(signed(WINDOW_11(2,2)));
               DOUT_BUF_264_5<=std_logic_vector(signed(WINDOW_11(2,3)));
               DOUT_BUF_265_5<=std_logic_vector(signed(WINDOW_11(2,4)));
               DOUT_BUF_266_5<=std_logic_vector(signed(WINDOW_11(3,0)));
               DOUT_BUF_267_5<=std_logic_vector(signed(WINDOW_11(3,1)));
               DOUT_BUF_268_5<=std_logic_vector(signed(WINDOW_11(3,2)));
               DOUT_BUF_269_5<=std_logic_vector(signed(WINDOW_11(3,3)));
               DOUT_BUF_270_5<=std_logic_vector(signed(WINDOW_11(3,4)));
               DOUT_BUF_271_5<=std_logic_vector(signed(WINDOW_11(4,0)));
               DOUT_BUF_272_5<=std_logic_vector(signed(WINDOW_11(4,1)));
               DOUT_BUF_273_5<=std_logic_vector(signed(WINDOW_11(4,2)));
               DOUT_BUF_274_5<=std_logic_vector(signed(WINDOW_11(4,3)));
               DOUT_BUF_275_5<=std_logic_vector(signed(WINDOW_11(4,4)));

               DOUT_BUF_276_5<=std_logic_vector(signed(WINDOW_12(0,0)));
               DOUT_BUF_277_5<=std_logic_vector(signed(WINDOW_12(0,1)));
               DOUT_BUF_278_5<=std_logic_vector(signed(WINDOW_12(0,2)));
               DOUT_BUF_279_5<=std_logic_vector(signed(WINDOW_12(0,3)));
               DOUT_BUF_280_5<=std_logic_vector(signed(WINDOW_12(0,4)));
               DOUT_BUF_281_5<=std_logic_vector(signed(WINDOW_12(1,0)));
               DOUT_BUF_282_5<=std_logic_vector(signed(WINDOW_12(1,1)));
               DOUT_BUF_283_5<=std_logic_vector(signed(WINDOW_12(1,2)));
               DOUT_BUF_284_5<=std_logic_vector(signed(WINDOW_12(1,3)));
               DOUT_BUF_285_5<=std_logic_vector(signed(WINDOW_12(1,4)));
               DOUT_BUF_286_5<=std_logic_vector(signed(WINDOW_12(2,0)));
               DOUT_BUF_287_5<=std_logic_vector(signed(WINDOW_12(2,1)));
               DOUT_BUF_288_5<=std_logic_vector(signed(WINDOW_12(2,2)));
               DOUT_BUF_289_5<=std_logic_vector(signed(WINDOW_12(2,3)));
               DOUT_BUF_290_5<=std_logic_vector(signed(WINDOW_12(2,4)));
               DOUT_BUF_291_5<=std_logic_vector(signed(WINDOW_12(3,0)));
               DOUT_BUF_292_5<=std_logic_vector(signed(WINDOW_12(3,1)));
               DOUT_BUF_293_5<=std_logic_vector(signed(WINDOW_12(3,2)));
               DOUT_BUF_294_5<=std_logic_vector(signed(WINDOW_12(3,3)));
               DOUT_BUF_295_5<=std_logic_vector(signed(WINDOW_12(3,4)));
               DOUT_BUF_296_5<=std_logic_vector(signed(WINDOW_12(4,0)));
               DOUT_BUF_297_5<=std_logic_vector(signed(WINDOW_12(4,1)));
               DOUT_BUF_298_5<=std_logic_vector(signed(WINDOW_12(4,2)));
               DOUT_BUF_299_5<=std_logic_vector(signed(WINDOW_12(4,3)));
               DOUT_BUF_300_5<=std_logic_vector(signed(WINDOW_12(4,4)));

               DOUT_BUF_301_5<=std_logic_vector(signed(WINDOW_13(0,0)));
               DOUT_BUF_302_5<=std_logic_vector(signed(WINDOW_13(0,1)));
               DOUT_BUF_303_5<=std_logic_vector(signed(WINDOW_13(0,2)));
               DOUT_BUF_304_5<=std_logic_vector(signed(WINDOW_13(0,3)));
               DOUT_BUF_305_5<=std_logic_vector(signed(WINDOW_13(0,4)));
               DOUT_BUF_306_5<=std_logic_vector(signed(WINDOW_13(1,0)));
               DOUT_BUF_307_5<=std_logic_vector(signed(WINDOW_13(1,1)));
               DOUT_BUF_308_5<=std_logic_vector(signed(WINDOW_13(1,2)));
               DOUT_BUF_309_5<=std_logic_vector(signed(WINDOW_13(1,3)));
               DOUT_BUF_310_5<=std_logic_vector(signed(WINDOW_13(1,4)));
               DOUT_BUF_311_5<=std_logic_vector(signed(WINDOW_13(2,0)));
               DOUT_BUF_312_5<=std_logic_vector(signed(WINDOW_13(2,1)));
               DOUT_BUF_313_5<=std_logic_vector(signed(WINDOW_13(2,2)));
               DOUT_BUF_314_5<=std_logic_vector(signed(WINDOW_13(2,3)));
               DOUT_BUF_315_5<=std_logic_vector(signed(WINDOW_13(2,4)));
               DOUT_BUF_316_5<=std_logic_vector(signed(WINDOW_13(3,0)));
               DOUT_BUF_317_5<=std_logic_vector(signed(WINDOW_13(3,1)));
               DOUT_BUF_318_5<=std_logic_vector(signed(WINDOW_13(3,2)));
               DOUT_BUF_319_5<=std_logic_vector(signed(WINDOW_13(3,3)));
               DOUT_BUF_320_5<=std_logic_vector(signed(WINDOW_13(3,4)));
               DOUT_BUF_321_5<=std_logic_vector(signed(WINDOW_13(4,0)));
               DOUT_BUF_322_5<=std_logic_vector(signed(WINDOW_13(4,1)));
               DOUT_BUF_323_5<=std_logic_vector(signed(WINDOW_13(4,2)));
               DOUT_BUF_324_5<=std_logic_vector(signed(WINDOW_13(4,3)));
               DOUT_BUF_325_5<=std_logic_vector(signed(WINDOW_13(4,4)));

               DOUT_BUF_326_5<=std_logic_vector(signed(WINDOW_14(0,0)));
               DOUT_BUF_327_5<=std_logic_vector(signed(WINDOW_14(0,1)));
               DOUT_BUF_328_5<=std_logic_vector(signed(WINDOW_14(0,2)));
               DOUT_BUF_329_5<=std_logic_vector(signed(WINDOW_14(0,3)));
               DOUT_BUF_330_5<=std_logic_vector(signed(WINDOW_14(0,4)));
               DOUT_BUF_331_5<=std_logic_vector(signed(WINDOW_14(1,0)));
               DOUT_BUF_332_5<=std_logic_vector(signed(WINDOW_14(1,1)));
               DOUT_BUF_333_5<=std_logic_vector(signed(WINDOW_14(1,2)));
               DOUT_BUF_334_5<=std_logic_vector(signed(WINDOW_14(1,3)));
               DOUT_BUF_335_5<=std_logic_vector(signed(WINDOW_14(1,4)));
               DOUT_BUF_336_5<=std_logic_vector(signed(WINDOW_14(2,0)));
               DOUT_BUF_337_5<=std_logic_vector(signed(WINDOW_14(2,1)));
               DOUT_BUF_338_5<=std_logic_vector(signed(WINDOW_14(2,2)));
               DOUT_BUF_339_5<=std_logic_vector(signed(WINDOW_14(2,3)));
               DOUT_BUF_340_5<=std_logic_vector(signed(WINDOW_14(2,4)));
               DOUT_BUF_341_5<=std_logic_vector(signed(WINDOW_14(3,0)));
               DOUT_BUF_342_5<=std_logic_vector(signed(WINDOW_14(3,1)));
               DOUT_BUF_343_5<=std_logic_vector(signed(WINDOW_14(3,2)));
               DOUT_BUF_344_5<=std_logic_vector(signed(WINDOW_14(3,3)));
               DOUT_BUF_345_5<=std_logic_vector(signed(WINDOW_14(3,4)));
               DOUT_BUF_346_5<=std_logic_vector(signed(WINDOW_14(4,0)));
               DOUT_BUF_347_5<=std_logic_vector(signed(WINDOW_14(4,1)));
               DOUT_BUF_348_5<=std_logic_vector(signed(WINDOW_14(4,2)));
               DOUT_BUF_349_5<=std_logic_vector(signed(WINDOW_14(4,3)));
               DOUT_BUF_350_5<=std_logic_vector(signed(WINDOW_14(4,4)));

               DOUT_BUF_351_5<=std_logic_vector(signed(WINDOW_15(0,0)));
               DOUT_BUF_352_5<=std_logic_vector(signed(WINDOW_15(0,1)));
               DOUT_BUF_353_5<=std_logic_vector(signed(WINDOW_15(0,2)));
               DOUT_BUF_354_5<=std_logic_vector(signed(WINDOW_15(0,3)));
               DOUT_BUF_355_5<=std_logic_vector(signed(WINDOW_15(0,4)));
               DOUT_BUF_356_5<=std_logic_vector(signed(WINDOW_15(1,0)));
               DOUT_BUF_357_5<=std_logic_vector(signed(WINDOW_15(1,1)));
               DOUT_BUF_358_5<=std_logic_vector(signed(WINDOW_15(1,2)));
               DOUT_BUF_359_5<=std_logic_vector(signed(WINDOW_15(1,3)));
               DOUT_BUF_360_5<=std_logic_vector(signed(WINDOW_15(1,4)));
               DOUT_BUF_361_5<=std_logic_vector(signed(WINDOW_15(2,0)));
               DOUT_BUF_362_5<=std_logic_vector(signed(WINDOW_15(2,1)));
               DOUT_BUF_363_5<=std_logic_vector(signed(WINDOW_15(2,2)));
               DOUT_BUF_364_5<=std_logic_vector(signed(WINDOW_15(2,3)));
               DOUT_BUF_365_5<=std_logic_vector(signed(WINDOW_15(2,4)));
               DOUT_BUF_366_5<=std_logic_vector(signed(WINDOW_15(3,0)));
               DOUT_BUF_367_5<=std_logic_vector(signed(WINDOW_15(3,1)));
               DOUT_BUF_368_5<=std_logic_vector(signed(WINDOW_15(3,2)));
               DOUT_BUF_369_5<=std_logic_vector(signed(WINDOW_15(3,3)));
               DOUT_BUF_370_5<=std_logic_vector(signed(WINDOW_15(3,4)));
               DOUT_BUF_371_5<=std_logic_vector(signed(WINDOW_15(4,0)));
               DOUT_BUF_372_5<=std_logic_vector(signed(WINDOW_15(4,1)));
               DOUT_BUF_373_5<=std_logic_vector(signed(WINDOW_15(4,2)));
               DOUT_BUF_374_5<=std_logic_vector(signed(WINDOW_15(4,3)));
               DOUT_BUF_375_5<=std_logic_vector(signed(WINDOW_15(4,4)));

               DOUT_BUF_376_5<=std_logic_vector(signed(WINDOW_16(0,0)));
               DOUT_BUF_377_5<=std_logic_vector(signed(WINDOW_16(0,1)));
               DOUT_BUF_378_5<=std_logic_vector(signed(WINDOW_16(0,2)));
               DOUT_BUF_379_5<=std_logic_vector(signed(WINDOW_16(0,3)));
               DOUT_BUF_380_5<=std_logic_vector(signed(WINDOW_16(0,4)));
               DOUT_BUF_381_5<=std_logic_vector(signed(WINDOW_16(1,0)));
               DOUT_BUF_382_5<=std_logic_vector(signed(WINDOW_16(1,1)));
               DOUT_BUF_383_5<=std_logic_vector(signed(WINDOW_16(1,2)));
               DOUT_BUF_384_5<=std_logic_vector(signed(WINDOW_16(1,3)));
               DOUT_BUF_385_5<=std_logic_vector(signed(WINDOW_16(1,4)));
               DOUT_BUF_386_5<=std_logic_vector(signed(WINDOW_16(2,0)));
               DOUT_BUF_387_5<=std_logic_vector(signed(WINDOW_16(2,1)));
               DOUT_BUF_388_5<=std_logic_vector(signed(WINDOW_16(2,2)));
               DOUT_BUF_389_5<=std_logic_vector(signed(WINDOW_16(2,3)));
               DOUT_BUF_390_5<=std_logic_vector(signed(WINDOW_16(2,4)));
               DOUT_BUF_391_5<=std_logic_vector(signed(WINDOW_16(3,0)));
               DOUT_BUF_392_5<=std_logic_vector(signed(WINDOW_16(3,1)));
               DOUT_BUF_393_5<=std_logic_vector(signed(WINDOW_16(3,2)));
               DOUT_BUF_394_5<=std_logic_vector(signed(WINDOW_16(3,3)));
               DOUT_BUF_395_5<=std_logic_vector(signed(WINDOW_16(3,4)));
               DOUT_BUF_396_5<=std_logic_vector(signed(WINDOW_16(4,0)));
               DOUT_BUF_397_5<=std_logic_vector(signed(WINDOW_16(4,1)));
               DOUT_BUF_398_5<=std_logic_vector(signed(WINDOW_16(4,2)));
               DOUT_BUF_399_5<=std_logic_vector(signed(WINDOW_16(4,3)));
               DOUT_BUF_400_5<=std_logic_vector(signed(WINDOW_16(4,4)));


		------------------------- Enable ONE_HOT END -----------------------

		------------------------------------STAGE-PIXEL--------------------------------------
		if SIG_STRIDE>1 then
                 SIG_STRIDE<=SIG_STRIDE-1;
        elsif VALID_NXTLYR_PIX<(IMAGE_WIDTH-F_SIZE) then
                   SIG_STRIDE<=STRIDE; end if;

		if SIG_STRIDE>(STRIDE-1) and VALID_NXTLYR_PIX<=(IMAGE_WIDTH-F_SIZE) then          --VALID_NXTLYR_PIX<IMAGE_WIDTH and  VALID_LOCAL_PIX

			EN_NXT_LYR_5<='1';FRST_TIM_EN_5<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
               EN_NXT_LYR_5<='0';
		end if; -- VALIDPIXELS

		if VALID_NXTLYR_PIX=((IMAGE_WIDTH*STRIDE)-1) then VALID_NXTLYR_PIX<=0;SIG_STRIDE<=STRIDE;   -- reset sride and valid pixels
		else VALID_NXTLYR_PIX<=VALID_NXTLYR_PIX+1;end if; 

	end if;  --Enable ONEHOT 

 elsif OUT_PIXEL_COUNT>=VALID_CYCLES  then INTERNAL_RST<='1';SIG_STRIDE<=STRIDE;EN_NXT_LYR_5<='1';  -- order is very important
else  EN_NXT_LYR_5<='0';-- In case stream stopped

end if; -- end enable 
end if; -- for RST	
end if; -- rising edge
end process LAYER_5;

EN_STREAM_OUT_5<= EN_STREAM_OUT_6;
VALID_OUT_5<= VALID_OUT_6;
DOUT_1_5<=DOUT_1_6;
DOUT_2_5<=DOUT_2_6;
DOUT_3_5<=DOUT_3_6;
DOUT_4_5<=DOUT_4_6;
DOUT_5_5<=DOUT_5_6;
DOUT_6_5<=DOUT_6_6;
DOUT_7_5<=DOUT_7_6;
DOUT_8_5<=DOUT_8_6;
DOUT_9_5<=DOUT_9_6;
DOUT_10_5<=DOUT_10_6;

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

