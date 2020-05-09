------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Fri May 08 19:45:09 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    FC - Behavioral 
-- Project Name:   CNN accelerator
-- Number of Total Operaiton: 16
-- Number of Clock Cycles: 30
-- Number of GOPS = 0.0
-------------------------------------------------Total Number of Operations for the Entire Model:4
-- Target Devices: Zynq-XC7Z020
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity FC_LAYER_6 is

GENERIC
 	( 
	constant PRECISION      : positive := 5; 	
	constant WHOLE          : positive := 2; 	
	constant DECIMAL        : positive := 3; 	
	constant DOUT_WIDTH     : positive := 5; 	
	constant BIAS_SIZE      : positive := 5;
	constant MULT_SIZE      : positive := 10;
	constant BASE_DIN_WIDTH : positive := 5;
	constant DIN_WIDTH      : positive := 5;
	constant IMAGE_WIDTH    : positive := 1;
	constant IMAGE_SIZE     : positive := 225;	
	constant F_SIZE         : positive := 1;
	constant PF_X2_SIZE     : positive := 9;
	constant WEIGHT_SIZE    : positive := 5;
	constant BIASES_SIZE	: positive := 2;
	constant PADDING        : positive := 1;
	constant STRIDE         : positive := 1;
	constant FEATURE_MAPS   : positive := 4;
	constant VALID_CYCLES   : positive := 9;
	constant VALID_LOCAL_PIX: positive := 3;
	constant ADD_TREE_DEPTH : positive := 1;
	constant INPUT_DEPTH    : positive := 6;
	constant INNER_PXL_SUM  : positive := 1;
	constant SUM_PEXILS     : positive := 14;
	constant MULT_SUM_D_1   : positive := 23;
	constant MULT_SUM_SIZE_1: positive := 6;
	constant MULT_SUM_D_2   : positive := 12;
	constant MULT_SUM_SIZE_2: positive := 6;
	constant MULT_SUM_D_3   : positive := 6;
	constant MULT_SUM_SIZE_3: positive := 6;
	constant MULT_SUM_D_4   : positive := 3;
	constant MULT_SUM_SIZE_4: positive := 6;
	constant MULT_SUM_D_5   : positive := 2;
	constant MULT_SUM_SIZE_5: positive := 6;
	constant MULT_SUM_D_6   : positive := 1;
	constant MULT_SUM_SIZE_6: positive := 6;
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN_1_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_2_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_3_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_4_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_5_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_6_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_7_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_8_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_9_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_10_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_11_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_12_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_13_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_14_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_15_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_16_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_17_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_18_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_19_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_20_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_21_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_22_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_23_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_24_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_25_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_26_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_27_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_28_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_29_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_30_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_31_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_32_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_33_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_34_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_35_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_36_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_37_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_38_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_39_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_40_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_41_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_42_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_43_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_44_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_45_6         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	CLK,RST         :IN std_logic;
   	DIS_STREAM      :OUT std_logic; 				-- S_AXIS_TVALID  : Data in is valid
   	EN_STREAM       :IN std_logic; 					-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_6 :OUT std_logic; 			-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_6     :OUT std_logic;                         -- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_6 :IN std_logic;
	DOUT_1_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST    :OUT std_logic
	);	

end FC_LAYER_6;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of FC_LAYER_6 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to PF_X2_SIZE-1) of signed(WEIGHT_SIZE- 1 downto 0);
signal     VALID_NXTLYR_PIX        :integer range 0 to VALID_CYCLES;
signal     PIXEL_COUNT             :integer range 0 to VALID_CYCLES;
signal     OUT_PIXEL_COUNT         :integer range 0 to VALID_CYCLES;
signal     EN_NXT_LYR_6            :std_logic;
signal     FRST_TIM_EN_6           :std_logic;
signal     Enable_MULT             :std_logic;
signal     Enable_ADDER            :std_logic;
signal     Enable_ReLU             :std_logic;
signal     Enable_BIAS             :std_logic;
signal     COUNT_PIX               :integer range 0 to PF_X2_SIZE;
signal     SIG_STRIDE              :integer range 0 to IMAGE_SIZE;
signal     PADDING_count           :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     ROW_COUNT               :integer range 0 to IMAGE_SIZE; -- TEMPORARY


------------------------------ INTERNAL DYNAMIC SIGNALS DECLARATION ARRAY TYPE- START---------------------------------------------


type   MULT_X		is array (0 to FEATURE_MAPS-1) of signed(MULT_SIZE-1 downto 0);
signal MULT_1:MULT_X;
signal MULT_2:MULT_X;
signal MULT_3:MULT_X;
signal MULT_4:MULT_X;
signal MULT_5:MULT_X;
signal MULT_6:MULT_X;
signal MULT_7:MULT_X;
signal MULT_8:MULT_X;
signal MULT_9:MULT_X;
signal MULT_10:MULT_X;
signal MULT_11:MULT_X;
signal MULT_12:MULT_X;
signal MULT_13:MULT_X;
signal MULT_14:MULT_X;
signal MULT_15:MULT_X;
signal MULT_16:MULT_X;
signal MULT_17:MULT_X;
signal MULT_18:MULT_X;
signal MULT_19:MULT_X;
signal MULT_20:MULT_X;
signal MULT_21:MULT_X;
signal MULT_22:MULT_X;
signal MULT_23:MULT_X;
signal MULT_24:MULT_X;
signal MULT_25:MULT_X;
signal MULT_26:MULT_X;
signal MULT_27:MULT_X;
signal MULT_28:MULT_X;
signal MULT_29:MULT_X;
signal MULT_30:MULT_X;
signal MULT_31:MULT_X;
signal MULT_32:MULT_X;
signal MULT_33:MULT_X;
signal MULT_34:MULT_X;
signal MULT_35:MULT_X;
signal MULT_36:MULT_X;
signal MULT_37:MULT_X;
signal MULT_38:MULT_X;
signal MULT_39:MULT_X;
signal MULT_40:MULT_X;
signal MULT_41:MULT_X;
signal MULT_42:MULT_X;
signal MULT_43:MULT_X;
signal MULT_44:MULT_X;
signal MULT_45:MULT_X;
signal DOUT_BUF_1_6	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_1		: signed(PRECISION-1 downto 0);
signal ReLU_1		: signed(PRECISION-1 downto 0);
signal DOUT_BUF_2_6	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_2		: signed(PRECISION-1 downto 0);
signal ReLU_2		: signed(PRECISION-1 downto 0);
signal DOUT_BUF_3_6	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_3		: signed(PRECISION-1 downto 0);
signal ReLU_3		: signed(PRECISION-1 downto 0);
signal DOUT_BUF_4_6	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_4		: signed(PRECISION-1 downto 0);
signal ReLU_4		: signed(PRECISION-1 downto 0);


------------------------------------------------------ MULT SUMMATION DECLARATION-----------------------------------------------------------
signal SUM_PIXELS_1: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_2: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_3: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_4: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_5: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_6: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_7: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_8: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_9: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_10: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_11: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_12: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_13: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_14: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_15: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_16: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_17: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_18: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_19: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_20: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_21: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_22: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_23: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_24: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_25: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_26: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_27: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_28: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_29: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_30: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_31: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_32: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_33: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_34: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_35: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_36: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_37: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_38: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_39: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_40: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_41: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_42: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_43: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_44: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_45: signed(PRECISION-1 downto 0);
type    MULT_X_SUM_1	is array (0 to FEATURE_MAPS-1) of signed(PRECISION-1 downto 0);
signal  EN_SUM_MULT_1	: std_logic;
signal  MULTS_1_1:MULT_X_SUM_1;
signal  MULTS_1_2:MULT_X_SUM_1;
signal  MULTS_1_3:MULT_X_SUM_1;
signal  MULTS_1_4:MULT_X_SUM_1;
signal  MULTS_1_5:MULT_X_SUM_1;
signal  MULTS_1_6:MULT_X_SUM_1;
signal  MULTS_1_7:MULT_X_SUM_1;
signal  MULTS_1_8:MULT_X_SUM_1;
signal  MULTS_1_9:MULT_X_SUM_1;
signal  MULTS_1_10:MULT_X_SUM_1;
signal  MULTS_1_11:MULT_X_SUM_1;
signal  MULTS_1_12:MULT_X_SUM_1;
signal  MULTS_1_13:MULT_X_SUM_1;
signal  MULTS_1_14:MULT_X_SUM_1;
signal  MULTS_1_15:MULT_X_SUM_1;
signal  MULTS_1_16:MULT_X_SUM_1;
signal  MULTS_1_17:MULT_X_SUM_1;
signal  MULTS_1_18:MULT_X_SUM_1;
signal  MULTS_1_19:MULT_X_SUM_1;
signal  MULTS_1_20:MULT_X_SUM_1;
signal  MULTS_1_21:MULT_X_SUM_1;
signal  MULTS_1_22:MULT_X_SUM_1;
signal  MULTS_1_23:MULT_X_SUM_1;
signal  MULTS_1_24:MULT_X_SUM_1;
signal  MULTS_1_25:MULT_X_SUM_1;
signal  MULTS_1_26:MULT_X_SUM_1;
signal  MULTS_1_27:MULT_X_SUM_1;
signal  MULTS_1_28:MULT_X_SUM_1;
signal  MULTS_1_29:MULT_X_SUM_1;
signal  MULTS_1_30:MULT_X_SUM_1;
signal  MULTS_1_31:MULT_X_SUM_1;
signal  MULTS_1_32:MULT_X_SUM_1;
signal  MULTS_1_33:MULT_X_SUM_1;
signal  MULTS_1_34:MULT_X_SUM_1;
signal  MULTS_1_35:MULT_X_SUM_1;
signal  MULTS_1_36:MULT_X_SUM_1;
signal  MULTS_1_37:MULT_X_SUM_1;
signal  MULTS_1_38:MULT_X_SUM_1;
signal  MULTS_1_39:MULT_X_SUM_1;
signal  MULTS_1_40:MULT_X_SUM_1;
signal  MULTS_1_41:MULT_X_SUM_1;
signal  MULTS_1_42:MULT_X_SUM_1;
signal  MULTS_1_43:MULT_X_SUM_1;
signal  MULTS_1_44:MULT_X_SUM_1;
signal  MULTS_1_45:MULT_X_SUM_1;
type    MULT_X_SUM_2	is array (0 to FEATURE_MAPS-1) of signed(PRECISION-1 downto 0);
signal  EN_SUM_MULT_2	: std_logic;
signal  MULTS_2_1:MULT_X_SUM_2;
signal  MULTS_2_2:MULT_X_SUM_2;
signal  MULTS_2_3:MULT_X_SUM_2;
signal  MULTS_2_4:MULT_X_SUM_2;
signal  MULTS_2_5:MULT_X_SUM_2;
signal  MULTS_2_6:MULT_X_SUM_2;
signal  MULTS_2_7:MULT_X_SUM_2;
signal  MULTS_2_8:MULT_X_SUM_2;
signal  MULTS_2_9:MULT_X_SUM_2;
signal  MULTS_2_10:MULT_X_SUM_2;
signal  MULTS_2_11:MULT_X_SUM_2;
signal  MULTS_2_12:MULT_X_SUM_2;
signal  MULTS_2_13:MULT_X_SUM_2;
signal  MULTS_2_14:MULT_X_SUM_2;
signal  MULTS_2_15:MULT_X_SUM_2;
signal  MULTS_2_16:MULT_X_SUM_2;
signal  MULTS_2_17:MULT_X_SUM_2;
signal  MULTS_2_18:MULT_X_SUM_2;
signal  MULTS_2_19:MULT_X_SUM_2;
signal  MULTS_2_20:MULT_X_SUM_2;
signal  MULTS_2_21:MULT_X_SUM_2;
signal  MULTS_2_22:MULT_X_SUM_2;
signal  MULTS_2_23:MULT_X_SUM_2;
signal  MULTS_2_24:MULT_X_SUM_2;
signal  MULTS_2_25:MULT_X_SUM_2;
signal  MULTS_2_26:MULT_X_SUM_2;
signal  MULTS_2_27:MULT_X_SUM_2;
signal  MULTS_2_28:MULT_X_SUM_2;
signal  MULTS_2_29:MULT_X_SUM_2;
signal  MULTS_2_30:MULT_X_SUM_2;
signal  MULTS_2_31:MULT_X_SUM_2;
signal  MULTS_2_32:MULT_X_SUM_2;
signal  MULTS_2_33:MULT_X_SUM_2;
signal  MULTS_2_34:MULT_X_SUM_2;
signal  MULTS_2_35:MULT_X_SUM_2;
signal  MULTS_2_36:MULT_X_SUM_2;
signal  MULTS_2_37:MULT_X_SUM_2;
signal  MULTS_2_38:MULT_X_SUM_2;
signal  MULTS_2_39:MULT_X_SUM_2;
signal  MULTS_2_40:MULT_X_SUM_2;
signal  MULTS_2_41:MULT_X_SUM_2;
signal  MULTS_2_42:MULT_X_SUM_2;
signal  MULTS_2_43:MULT_X_SUM_2;
signal  MULTS_2_44:MULT_X_SUM_2;
signal  MULTS_2_45:MULT_X_SUM_2;
type    MULT_X_SUM_3	is array (0 to FEATURE_MAPS-1) of signed(PRECISION-1 downto 0);
signal  EN_SUM_MULT_3	: std_logic;
signal  MULTS_3_1:MULT_X_SUM_3;
signal  MULTS_3_2:MULT_X_SUM_3;
signal  MULTS_3_3:MULT_X_SUM_3;
signal  MULTS_3_4:MULT_X_SUM_3;
signal  MULTS_3_5:MULT_X_SUM_3;
signal  MULTS_3_6:MULT_X_SUM_3;
signal  MULTS_3_7:MULT_X_SUM_3;
signal  MULTS_3_8:MULT_X_SUM_3;
signal  MULTS_3_9:MULT_X_SUM_3;
signal  MULTS_3_10:MULT_X_SUM_3;
signal  MULTS_3_11:MULT_X_SUM_3;
signal  MULTS_3_12:MULT_X_SUM_3;
signal  MULTS_3_13:MULT_X_SUM_3;
signal  MULTS_3_14:MULT_X_SUM_3;
signal  MULTS_3_15:MULT_X_SUM_3;
signal  MULTS_3_16:MULT_X_SUM_3;
signal  MULTS_3_17:MULT_X_SUM_3;
signal  MULTS_3_18:MULT_X_SUM_3;
signal  MULTS_3_19:MULT_X_SUM_3;
signal  MULTS_3_20:MULT_X_SUM_3;
signal  MULTS_3_21:MULT_X_SUM_3;
signal  MULTS_3_22:MULT_X_SUM_3;
signal  MULTS_3_23:MULT_X_SUM_3;
signal  MULTS_3_24:MULT_X_SUM_3;
signal  MULTS_3_25:MULT_X_SUM_3;
signal  MULTS_3_26:MULT_X_SUM_3;
signal  MULTS_3_27:MULT_X_SUM_3;
signal  MULTS_3_28:MULT_X_SUM_3;
signal  MULTS_3_29:MULT_X_SUM_3;
signal  MULTS_3_30:MULT_X_SUM_3;
signal  MULTS_3_31:MULT_X_SUM_3;
signal  MULTS_3_32:MULT_X_SUM_3;
signal  MULTS_3_33:MULT_X_SUM_3;
signal  MULTS_3_34:MULT_X_SUM_3;
signal  MULTS_3_35:MULT_X_SUM_3;
signal  MULTS_3_36:MULT_X_SUM_3;
signal  MULTS_3_37:MULT_X_SUM_3;
signal  MULTS_3_38:MULT_X_SUM_3;
signal  MULTS_3_39:MULT_X_SUM_3;
signal  MULTS_3_40:MULT_X_SUM_3;
signal  MULTS_3_41:MULT_X_SUM_3;
signal  MULTS_3_42:MULT_X_SUM_3;
signal  MULTS_3_43:MULT_X_SUM_3;
signal  MULTS_3_44:MULT_X_SUM_3;
signal  MULTS_3_45:MULT_X_SUM_3;
type    MULT_X_SUM_4	is array (0 to FEATURE_MAPS-1) of signed(PRECISION-1 downto 0);
signal  EN_SUM_MULT_4	: std_logic;
signal  MULTS_4_1:MULT_X_SUM_4;
signal  MULTS_4_2:MULT_X_SUM_4;
signal  MULTS_4_3:MULT_X_SUM_4;
signal  MULTS_4_4:MULT_X_SUM_4;
signal  MULTS_4_5:MULT_X_SUM_4;
signal  MULTS_4_6:MULT_X_SUM_4;
signal  MULTS_4_7:MULT_X_SUM_4;
signal  MULTS_4_8:MULT_X_SUM_4;
signal  MULTS_4_9:MULT_X_SUM_4;
signal  MULTS_4_10:MULT_X_SUM_4;
signal  MULTS_4_11:MULT_X_SUM_4;
signal  MULTS_4_12:MULT_X_SUM_4;
signal  MULTS_4_13:MULT_X_SUM_4;
signal  MULTS_4_14:MULT_X_SUM_4;
signal  MULTS_4_15:MULT_X_SUM_4;
signal  MULTS_4_16:MULT_X_SUM_4;
signal  MULTS_4_17:MULT_X_SUM_4;
signal  MULTS_4_18:MULT_X_SUM_4;
signal  MULTS_4_19:MULT_X_SUM_4;
signal  MULTS_4_20:MULT_X_SUM_4;
signal  MULTS_4_21:MULT_X_SUM_4;
signal  MULTS_4_22:MULT_X_SUM_4;
signal  MULTS_4_23:MULT_X_SUM_4;
signal  MULTS_4_24:MULT_X_SUM_4;
signal  MULTS_4_25:MULT_X_SUM_4;
signal  MULTS_4_26:MULT_X_SUM_4;
signal  MULTS_4_27:MULT_X_SUM_4;
signal  MULTS_4_28:MULT_X_SUM_4;
signal  MULTS_4_29:MULT_X_SUM_4;
signal  MULTS_4_30:MULT_X_SUM_4;
signal  MULTS_4_31:MULT_X_SUM_4;
signal  MULTS_4_32:MULT_X_SUM_4;
signal  MULTS_4_33:MULT_X_SUM_4;
signal  MULTS_4_34:MULT_X_SUM_4;
signal  MULTS_4_35:MULT_X_SUM_4;
signal  MULTS_4_36:MULT_X_SUM_4;
signal  MULTS_4_37:MULT_X_SUM_4;
signal  MULTS_4_38:MULT_X_SUM_4;
signal  MULTS_4_39:MULT_X_SUM_4;
signal  MULTS_4_40:MULT_X_SUM_4;
signal  MULTS_4_41:MULT_X_SUM_4;
signal  MULTS_4_42:MULT_X_SUM_4;
signal  MULTS_4_43:MULT_X_SUM_4;
signal  MULTS_4_44:MULT_X_SUM_4;
signal  MULTS_4_45:MULT_X_SUM_4;
type    MULT_X_SUM_5	is array (0 to FEATURE_MAPS-1) of signed(PRECISION-1 downto 0);
signal  EN_SUM_MULT_5	: std_logic;
signal  MULTS_5_1:MULT_X_SUM_5;
signal  MULTS_5_2:MULT_X_SUM_5;
signal  MULTS_5_3:MULT_X_SUM_5;
signal  MULTS_5_4:MULT_X_SUM_5;
signal  MULTS_5_5:MULT_X_SUM_5;
signal  MULTS_5_6:MULT_X_SUM_5;
signal  MULTS_5_7:MULT_X_SUM_5;
signal  MULTS_5_8:MULT_X_SUM_5;
signal  MULTS_5_9:MULT_X_SUM_5;
signal  MULTS_5_10:MULT_X_SUM_5;
signal  MULTS_5_11:MULT_X_SUM_5;
signal  MULTS_5_12:MULT_X_SUM_5;
signal  MULTS_5_13:MULT_X_SUM_5;
signal  MULTS_5_14:MULT_X_SUM_5;
signal  MULTS_5_15:MULT_X_SUM_5;
signal  MULTS_5_16:MULT_X_SUM_5;
signal  MULTS_5_17:MULT_X_SUM_5;
signal  MULTS_5_18:MULT_X_SUM_5;
signal  MULTS_5_19:MULT_X_SUM_5;
signal  MULTS_5_20:MULT_X_SUM_5;
signal  MULTS_5_21:MULT_X_SUM_5;
signal  MULTS_5_22:MULT_X_SUM_5;
signal  MULTS_5_23:MULT_X_SUM_5;
signal  MULTS_5_24:MULT_X_SUM_5;
signal  MULTS_5_25:MULT_X_SUM_5;
signal  MULTS_5_26:MULT_X_SUM_5;
signal  MULTS_5_27:MULT_X_SUM_5;
signal  MULTS_5_28:MULT_X_SUM_5;
signal  MULTS_5_29:MULT_X_SUM_5;
signal  MULTS_5_30:MULT_X_SUM_5;
signal  MULTS_5_31:MULT_X_SUM_5;
signal  MULTS_5_32:MULT_X_SUM_5;
signal  MULTS_5_33:MULT_X_SUM_5;
signal  MULTS_5_34:MULT_X_SUM_5;
signal  MULTS_5_35:MULT_X_SUM_5;
signal  MULTS_5_36:MULT_X_SUM_5;
signal  MULTS_5_37:MULT_X_SUM_5;
signal  MULTS_5_38:MULT_X_SUM_5;
signal  MULTS_5_39:MULT_X_SUM_5;
signal  MULTS_5_40:MULT_X_SUM_5;
signal  MULTS_5_41:MULT_X_SUM_5;
signal  MULTS_5_42:MULT_X_SUM_5;
signal  MULTS_5_43:MULT_X_SUM_5;
signal  MULTS_5_44:MULT_X_SUM_5;
signal  MULTS_5_45:MULT_X_SUM_5;
type    MULT_X_SUM_6	is array (0 to FEATURE_MAPS-1) of signed(PRECISION-1 downto 0);
signal  EN_SUM_MULT_6	: std_logic;
signal  MULTS_6_1:MULT_X_SUM_6;
signal  MULTS_6_2:MULT_X_SUM_6;
signal  MULTS_6_3:MULT_X_SUM_6;
signal  MULTS_6_4:MULT_X_SUM_6;
signal  MULTS_6_5:MULT_X_SUM_6;
signal  MULTS_6_6:MULT_X_SUM_6;
signal  MULTS_6_7:MULT_X_SUM_6;
signal  MULTS_6_8:MULT_X_SUM_6;
signal  MULTS_6_9:MULT_X_SUM_6;
signal  MULTS_6_10:MULT_X_SUM_6;
signal  MULTS_6_11:MULT_X_SUM_6;
signal  MULTS_6_12:MULT_X_SUM_6;
signal  MULTS_6_13:MULT_X_SUM_6;
signal  MULTS_6_14:MULT_X_SUM_6;
signal  MULTS_6_15:MULT_X_SUM_6;
signal  MULTS_6_16:MULT_X_SUM_6;
signal  MULTS_6_17:MULT_X_SUM_6;
signal  MULTS_6_18:MULT_X_SUM_6;
signal  MULTS_6_19:MULT_X_SUM_6;
signal  MULTS_6_20:MULT_X_SUM_6;
signal  MULTS_6_21:MULT_X_SUM_6;
signal  MULTS_6_22:MULT_X_SUM_6;
signal  MULTS_6_23:MULT_X_SUM_6;
signal  MULTS_6_24:MULT_X_SUM_6;
signal  MULTS_6_25:MULT_X_SUM_6;
signal  MULTS_6_26:MULT_X_SUM_6;
signal  MULTS_6_27:MULT_X_SUM_6;
signal  MULTS_6_28:MULT_X_SUM_6;
signal  MULTS_6_29:MULT_X_SUM_6;
signal  MULTS_6_30:MULT_X_SUM_6;
signal  MULTS_6_31:MULT_X_SUM_6;
signal  MULTS_6_32:MULT_X_SUM_6;
signal  MULTS_6_33:MULT_X_SUM_6;
signal  MULTS_6_34:MULT_X_SUM_6;
signal  MULTS_6_35:MULT_X_SUM_6;
signal  MULTS_6_36:MULT_X_SUM_6;
signal  MULTS_6_37:MULT_X_SUM_6;
signal  MULTS_6_38:MULT_X_SUM_6;
signal  MULTS_6_39:MULT_X_SUM_6;
signal  MULTS_6_40:MULT_X_SUM_6;
signal  MULTS_6_41:MULT_X_SUM_6;
signal  MULTS_6_42:MULT_X_SUM_6;
signal  MULTS_6_43:MULT_X_SUM_6;
signal  MULTS_6_44:MULT_X_SUM_6;
signal  MULTS_6_45:MULT_X_SUM_6;


-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_7          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_2_7          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal EN_STREAM_OUT_7	 : std_logic;
signal VALID_OUT_7       : std_logic;

--------------------------------------------- FILTER HARDCODED CONSTANTS -WEIGHTS START--------------------------------

constant FMAP_1_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_5: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_6: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_7: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_8: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_9: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_10: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_11: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_12: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_13: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_14: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_15: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_16: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_17: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_18: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_19: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_20: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_21: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_22: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_23: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_24: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_25: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_26: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_27: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_28: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_29: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_30: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_31: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_32: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_33: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_34: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_35: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_36: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_37: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_38: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_39: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_40: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_41: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_42: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_43: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_44: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_45: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_5: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_6: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_7: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_8: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_9: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_10: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_11: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_12: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_13: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_14: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_15: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_16: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_17: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_18: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_19: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_20: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_21: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_22: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_23: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_24: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_25: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_26: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_27: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_28: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_29: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_30: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_31: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_32: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_33: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_34: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_35: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_36: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_37: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_38: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_39: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_40: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_41: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_42: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_43: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_44: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_45: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_5: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_6: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_7: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_8: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_9: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_10: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_11: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_12: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_13: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_14: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_15: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_16: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_17: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_18: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_19: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_20: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_21: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_22: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_23: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_24: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_25: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_26: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_27: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_28: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_29: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_30: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_31: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_32: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_33: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_34: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_35: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_36: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_37: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_38: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_39: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_40: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_41: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_42: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_43: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_44: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_45: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_5: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_6: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_7: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_8: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_9: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_10: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_11: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_12: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_13: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_14: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_15: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_16: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_17: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_18: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_19: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_20: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_21: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_22: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_23: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_24: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_25: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_26: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_27: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_28: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_29: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_30: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_31: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_32: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_33: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_34: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_35: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_36: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_37: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_38: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_39: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_40: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_41: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_42: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_43: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_44: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_45: signed(WEIGHT_SIZE- 1 downto 0):= "00001";

constant BIAS_VAL_1: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_2: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_3: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_4: signed (BIASES_SIZE-1 downto 0):="01";


---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT FC_LAYER_7
    port(	CLK,RST			:IN std_logic;
		DIN_1_7		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_2_7		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_3_7		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_4_7		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		EN_STREAM_OUT_7	:OUT std_logic;
		VALID_OUT_7		:OUT std_logic;
		DOUT_1_7        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_2_7        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		EN_STREAM		:IN std_logic;
		EN_LOC_STREAM_7	:IN std_logic
      			);
END COMPONENT FC_LAYER_7;

begin

FC_LYR_7 : FC_LAYER_7 
          port map(
          CLK                 => CLK,
          RST                 => RST,
          DIN_1_7             => DOUT_BUF_1_6,
          DIN_2_7             => DOUT_BUF_2_6,
          DIN_3_7             => DOUT_BUF_3_6,
          DIN_4_7             => DOUT_BUF_4_6,
          DOUT_1_7            => DOUT_1_7,
          DOUT_2_7            => DOUT_2_7,
          VALID_OUT_7         => VALID_OUT_7,
          EN_STREAM_OUT_7     => EN_STREAM_OUT_7,
          EN_LOC_STREAM_7     => EN_NXT_LYR_6,
          EN_STREAM           => EN_STREAM
                );

----------------------------------------------- MAP NEXT LAYER - COMPONENTS END----------------------------------------------------



-------------------------------------------------------- ARCHITECTURE BEGIN--------------------------------------------------------

LAYER_6: process(CLK)


begin
------------------------------------------------ RESET AND PROCESS TOP START ------------------------------------------------------
if rising_edge(CLK) then
  if RST = '1' then
	-------------------FIXED SIGNALS RESET------------------------
    PIXEL_COUNT<=0;VALID_NXTLYR_PIX<=0;OUT_PIXEL_COUNT<=0;
    EN_NXT_LYR_6<='0';FRST_TIM_EN_6<='0';INTERNAL_RST<='0';
    Enable_MULT<='0';Enable_ADDER<='0';Enable_ReLU<='0';Enable_BIAS<='0';
    PADDING_count<=0;ROW_COUNT<=0;SIG_STRIDE<=STRIDE;COUNT_PIX<=0;

-------------------DYNAMIC SIGNALS RESET------------------------
    DOUT_BUF_1_6<=(others => '0');BIAS_1<=(others => '0');ReLU_1<=(others => '0');
    DOUT_BUF_2_6<=(others => '0');BIAS_2<=(others => '0');ReLU_2<=(others => '0');
    DOUT_BUF_3_6<=(others => '0');BIAS_3<=(others => '0');ReLU_3<=(others => '0');
    DOUT_BUF_4_6<=(others => '0');BIAS_4<=(others => '0');ReLU_4<=(others => '0');

    SUM_PIXELS_1<=(others=>'0');MULT_1<=((others=> (others=>'0')));
    SUM_PIXELS_2<=(others=>'0');MULT_2<=((others=> (others=>'0')));
    SUM_PIXELS_3<=(others=>'0');MULT_3<=((others=> (others=>'0')));
    SUM_PIXELS_4<=(others=>'0');MULT_4<=((others=> (others=>'0')));
    SUM_PIXELS_5<=(others=>'0');MULT_5<=((others=> (others=>'0')));
    SUM_PIXELS_6<=(others=>'0');MULT_6<=((others=> (others=>'0')));
    SUM_PIXELS_7<=(others=>'0');MULT_7<=((others=> (others=>'0')));
    SUM_PIXELS_8<=(others=>'0');MULT_8<=((others=> (others=>'0')));
    SUM_PIXELS_9<=(others=>'0');MULT_9<=((others=> (others=>'0')));
    SUM_PIXELS_10<=(others=>'0');MULT_10<=((others=> (others=>'0')));
    SUM_PIXELS_11<=(others=>'0');MULT_11<=((others=> (others=>'0')));
    SUM_PIXELS_12<=(others=>'0');MULT_12<=((others=> (others=>'0')));
    SUM_PIXELS_13<=(others=>'0');MULT_13<=((others=> (others=>'0')));
    SUM_PIXELS_14<=(others=>'0');MULT_14<=((others=> (others=>'0')));
    SUM_PIXELS_15<=(others=>'0');MULT_15<=((others=> (others=>'0')));
    SUM_PIXELS_16<=(others=>'0');MULT_16<=((others=> (others=>'0')));
    SUM_PIXELS_17<=(others=>'0');MULT_17<=((others=> (others=>'0')));
    SUM_PIXELS_18<=(others=>'0');MULT_18<=((others=> (others=>'0')));
    SUM_PIXELS_19<=(others=>'0');MULT_19<=((others=> (others=>'0')));
    SUM_PIXELS_20<=(others=>'0');MULT_20<=((others=> (others=>'0')));
    SUM_PIXELS_21<=(others=>'0');MULT_21<=((others=> (others=>'0')));
    SUM_PIXELS_22<=(others=>'0');MULT_22<=((others=> (others=>'0')));
    SUM_PIXELS_23<=(others=>'0');MULT_23<=((others=> (others=>'0')));
    SUM_PIXELS_24<=(others=>'0');MULT_24<=((others=> (others=>'0')));
    SUM_PIXELS_25<=(others=>'0');MULT_25<=((others=> (others=>'0')));
    SUM_PIXELS_26<=(others=>'0');MULT_26<=((others=> (others=>'0')));
    SUM_PIXELS_27<=(others=>'0');MULT_27<=((others=> (others=>'0')));
    SUM_PIXELS_28<=(others=>'0');MULT_28<=((others=> (others=>'0')));
    SUM_PIXELS_29<=(others=>'0');MULT_29<=((others=> (others=>'0')));
    SUM_PIXELS_30<=(others=>'0');MULT_30<=((others=> (others=>'0')));
    SUM_PIXELS_31<=(others=>'0');MULT_31<=((others=> (others=>'0')));
    SUM_PIXELS_32<=(others=>'0');MULT_32<=((others=> (others=>'0')));
    SUM_PIXELS_33<=(others=>'0');MULT_33<=((others=> (others=>'0')));
    SUM_PIXELS_34<=(others=>'0');MULT_34<=((others=> (others=>'0')));
    SUM_PIXELS_35<=(others=>'0');MULT_35<=((others=> (others=>'0')));
    SUM_PIXELS_36<=(others=>'0');MULT_36<=((others=> (others=>'0')));
    SUM_PIXELS_37<=(others=>'0');MULT_37<=((others=> (others=>'0')));
    SUM_PIXELS_38<=(others=>'0');MULT_38<=((others=> (others=>'0')));
    SUM_PIXELS_39<=(others=>'0');MULT_39<=((others=> (others=>'0')));
    SUM_PIXELS_40<=(others=>'0');MULT_40<=((others=> (others=>'0')));
    SUM_PIXELS_41<=(others=>'0');MULT_41<=((others=> (others=>'0')));
    SUM_PIXELS_42<=(others=>'0');MULT_42<=((others=> (others=>'0')));
    SUM_PIXELS_43<=(others=>'0');MULT_43<=((others=> (others=>'0')));
    SUM_PIXELS_44<=(others=>'0');MULT_44<=((others=> (others=>'0')));
    SUM_PIXELS_45<=(others=>'0');MULT_45<=((others=> (others=>'0')));

    EN_SUM_MULT_1<='0';
    MULTS_1_1<=((others=> (others=>'0')));
    MULTS_1_2<=((others=> (others=>'0')));
    MULTS_1_3<=((others=> (others=>'0')));
    MULTS_1_4<=((others=> (others=>'0')));
    MULTS_1_5<=((others=> (others=>'0')));
    MULTS_1_6<=((others=> (others=>'0')));
    MULTS_1_7<=((others=> (others=>'0')));
    MULTS_1_8<=((others=> (others=>'0')));
    MULTS_1_9<=((others=> (others=>'0')));
    MULTS_1_10<=((others=> (others=>'0')));
    MULTS_1_11<=((others=> (others=>'0')));
    MULTS_1_12<=((others=> (others=>'0')));
    MULTS_1_13<=((others=> (others=>'0')));
    MULTS_1_14<=((others=> (others=>'0')));
    MULTS_1_15<=((others=> (others=>'0')));
    MULTS_1_16<=((others=> (others=>'0')));
    MULTS_1_17<=((others=> (others=>'0')));
    MULTS_1_18<=((others=> (others=>'0')));
    MULTS_1_19<=((others=> (others=>'0')));
    MULTS_1_20<=((others=> (others=>'0')));
    MULTS_1_21<=((others=> (others=>'0')));
    MULTS_1_22<=((others=> (others=>'0')));
    MULTS_1_23<=((others=> (others=>'0')));
    MULTS_1_24<=((others=> (others=>'0')));
    MULTS_1_25<=((others=> (others=>'0')));
    MULTS_1_26<=((others=> (others=>'0')));
    MULTS_1_27<=((others=> (others=>'0')));
    MULTS_1_28<=((others=> (others=>'0')));
    MULTS_1_29<=((others=> (others=>'0')));
    MULTS_1_30<=((others=> (others=>'0')));
    MULTS_1_31<=((others=> (others=>'0')));
    MULTS_1_32<=((others=> (others=>'0')));
    MULTS_1_33<=((others=> (others=>'0')));
    MULTS_1_34<=((others=> (others=>'0')));
    MULTS_1_35<=((others=> (others=>'0')));
    MULTS_1_36<=((others=> (others=>'0')));
    MULTS_1_37<=((others=> (others=>'0')));
    MULTS_1_38<=((others=> (others=>'0')));
    MULTS_1_39<=((others=> (others=>'0')));
    MULTS_1_40<=((others=> (others=>'0')));
    MULTS_1_41<=((others=> (others=>'0')));
    MULTS_1_42<=((others=> (others=>'0')));
    MULTS_1_43<=((others=> (others=>'0')));
    MULTS_1_44<=((others=> (others=>'0')));
    MULTS_1_45<=((others=> (others=>'0')));
    EN_SUM_MULT_2<='0';
    MULTS_2_1<=((others=> (others=>'0')));
    MULTS_2_2<=((others=> (others=>'0')));
    MULTS_2_3<=((others=> (others=>'0')));
    MULTS_2_4<=((others=> (others=>'0')));
    MULTS_2_5<=((others=> (others=>'0')));
    MULTS_2_6<=((others=> (others=>'0')));
    MULTS_2_7<=((others=> (others=>'0')));
    MULTS_2_8<=((others=> (others=>'0')));
    MULTS_2_9<=((others=> (others=>'0')));
    MULTS_2_10<=((others=> (others=>'0')));
    MULTS_2_11<=((others=> (others=>'0')));
    MULTS_2_12<=((others=> (others=>'0')));
    MULTS_2_13<=((others=> (others=>'0')));
    MULTS_2_14<=((others=> (others=>'0')));
    MULTS_2_15<=((others=> (others=>'0')));
    MULTS_2_16<=((others=> (others=>'0')));
    MULTS_2_17<=((others=> (others=>'0')));
    MULTS_2_18<=((others=> (others=>'0')));
    MULTS_2_19<=((others=> (others=>'0')));
    MULTS_2_20<=((others=> (others=>'0')));
    MULTS_2_21<=((others=> (others=>'0')));
    MULTS_2_22<=((others=> (others=>'0')));
    MULTS_2_23<=((others=> (others=>'0')));
    MULTS_2_24<=((others=> (others=>'0')));
    MULTS_2_25<=((others=> (others=>'0')));
    MULTS_2_26<=((others=> (others=>'0')));
    MULTS_2_27<=((others=> (others=>'0')));
    MULTS_2_28<=((others=> (others=>'0')));
    MULTS_2_29<=((others=> (others=>'0')));
    MULTS_2_30<=((others=> (others=>'0')));
    MULTS_2_31<=((others=> (others=>'0')));
    MULTS_2_32<=((others=> (others=>'0')));
    MULTS_2_33<=((others=> (others=>'0')));
    MULTS_2_34<=((others=> (others=>'0')));
    MULTS_2_35<=((others=> (others=>'0')));
    MULTS_2_36<=((others=> (others=>'0')));
    MULTS_2_37<=((others=> (others=>'0')));
    MULTS_2_38<=((others=> (others=>'0')));
    MULTS_2_39<=((others=> (others=>'0')));
    MULTS_2_40<=((others=> (others=>'0')));
    MULTS_2_41<=((others=> (others=>'0')));
    MULTS_2_42<=((others=> (others=>'0')));
    MULTS_2_43<=((others=> (others=>'0')));
    MULTS_2_44<=((others=> (others=>'0')));
    MULTS_2_45<=((others=> (others=>'0')));
    EN_SUM_MULT_3<='0';
    MULTS_3_1<=((others=> (others=>'0')));
    MULTS_3_2<=((others=> (others=>'0')));
    MULTS_3_3<=((others=> (others=>'0')));
    MULTS_3_4<=((others=> (others=>'0')));
    MULTS_3_5<=((others=> (others=>'0')));
    MULTS_3_6<=((others=> (others=>'0')));
    MULTS_3_7<=((others=> (others=>'0')));
    MULTS_3_8<=((others=> (others=>'0')));
    MULTS_3_9<=((others=> (others=>'0')));
    MULTS_3_10<=((others=> (others=>'0')));
    MULTS_3_11<=((others=> (others=>'0')));
    MULTS_3_12<=((others=> (others=>'0')));
    MULTS_3_13<=((others=> (others=>'0')));
    MULTS_3_14<=((others=> (others=>'0')));
    MULTS_3_15<=((others=> (others=>'0')));
    MULTS_3_16<=((others=> (others=>'0')));
    MULTS_3_17<=((others=> (others=>'0')));
    MULTS_3_18<=((others=> (others=>'0')));
    MULTS_3_19<=((others=> (others=>'0')));
    MULTS_3_20<=((others=> (others=>'0')));
    MULTS_3_21<=((others=> (others=>'0')));
    MULTS_3_22<=((others=> (others=>'0')));
    MULTS_3_23<=((others=> (others=>'0')));
    MULTS_3_24<=((others=> (others=>'0')));
    MULTS_3_25<=((others=> (others=>'0')));
    MULTS_3_26<=((others=> (others=>'0')));
    MULTS_3_27<=((others=> (others=>'0')));
    MULTS_3_28<=((others=> (others=>'0')));
    MULTS_3_29<=((others=> (others=>'0')));
    MULTS_3_30<=((others=> (others=>'0')));
    MULTS_3_31<=((others=> (others=>'0')));
    MULTS_3_32<=((others=> (others=>'0')));
    MULTS_3_33<=((others=> (others=>'0')));
    MULTS_3_34<=((others=> (others=>'0')));
    MULTS_3_35<=((others=> (others=>'0')));
    MULTS_3_36<=((others=> (others=>'0')));
    MULTS_3_37<=((others=> (others=>'0')));
    MULTS_3_38<=((others=> (others=>'0')));
    MULTS_3_39<=((others=> (others=>'0')));
    MULTS_3_40<=((others=> (others=>'0')));
    MULTS_3_41<=((others=> (others=>'0')));
    MULTS_3_42<=((others=> (others=>'0')));
    MULTS_3_43<=((others=> (others=>'0')));
    MULTS_3_44<=((others=> (others=>'0')));
    MULTS_3_45<=((others=> (others=>'0')));
    EN_SUM_MULT_4<='0';
    MULTS_4_1<=((others=> (others=>'0')));
    MULTS_4_2<=((others=> (others=>'0')));
    MULTS_4_3<=((others=> (others=>'0')));
    MULTS_4_4<=((others=> (others=>'0')));
    MULTS_4_5<=((others=> (others=>'0')));
    MULTS_4_6<=((others=> (others=>'0')));
    MULTS_4_7<=((others=> (others=>'0')));
    MULTS_4_8<=((others=> (others=>'0')));
    MULTS_4_9<=((others=> (others=>'0')));
    MULTS_4_10<=((others=> (others=>'0')));
    MULTS_4_11<=((others=> (others=>'0')));
    MULTS_4_12<=((others=> (others=>'0')));
    MULTS_4_13<=((others=> (others=>'0')));
    MULTS_4_14<=((others=> (others=>'0')));
    MULTS_4_15<=((others=> (others=>'0')));
    MULTS_4_16<=((others=> (others=>'0')));
    MULTS_4_17<=((others=> (others=>'0')));
    MULTS_4_18<=((others=> (others=>'0')));
    MULTS_4_19<=((others=> (others=>'0')));
    MULTS_4_20<=((others=> (others=>'0')));
    MULTS_4_21<=((others=> (others=>'0')));
    MULTS_4_22<=((others=> (others=>'0')));
    MULTS_4_23<=((others=> (others=>'0')));
    MULTS_4_24<=((others=> (others=>'0')));
    MULTS_4_25<=((others=> (others=>'0')));
    MULTS_4_26<=((others=> (others=>'0')));
    MULTS_4_27<=((others=> (others=>'0')));
    MULTS_4_28<=((others=> (others=>'0')));
    MULTS_4_29<=((others=> (others=>'0')));
    MULTS_4_30<=((others=> (others=>'0')));
    MULTS_4_31<=((others=> (others=>'0')));
    MULTS_4_32<=((others=> (others=>'0')));
    MULTS_4_33<=((others=> (others=>'0')));
    MULTS_4_34<=((others=> (others=>'0')));
    MULTS_4_35<=((others=> (others=>'0')));
    MULTS_4_36<=((others=> (others=>'0')));
    MULTS_4_37<=((others=> (others=>'0')));
    MULTS_4_38<=((others=> (others=>'0')));
    MULTS_4_39<=((others=> (others=>'0')));
    MULTS_4_40<=((others=> (others=>'0')));
    MULTS_4_41<=((others=> (others=>'0')));
    MULTS_4_42<=((others=> (others=>'0')));
    MULTS_4_43<=((others=> (others=>'0')));
    MULTS_4_44<=((others=> (others=>'0')));
    MULTS_4_45<=((others=> (others=>'0')));
    EN_SUM_MULT_5<='0';
    MULTS_5_1<=((others=> (others=>'0')));
    MULTS_5_2<=((others=> (others=>'0')));
    MULTS_5_3<=((others=> (others=>'0')));
    MULTS_5_4<=((others=> (others=>'0')));
    MULTS_5_5<=((others=> (others=>'0')));
    MULTS_5_6<=((others=> (others=>'0')));
    MULTS_5_7<=((others=> (others=>'0')));
    MULTS_5_8<=((others=> (others=>'0')));
    MULTS_5_9<=((others=> (others=>'0')));
    MULTS_5_10<=((others=> (others=>'0')));
    MULTS_5_11<=((others=> (others=>'0')));
    MULTS_5_12<=((others=> (others=>'0')));
    MULTS_5_13<=((others=> (others=>'0')));
    MULTS_5_14<=((others=> (others=>'0')));
    MULTS_5_15<=((others=> (others=>'0')));
    MULTS_5_16<=((others=> (others=>'0')));
    MULTS_5_17<=((others=> (others=>'0')));
    MULTS_5_18<=((others=> (others=>'0')));
    MULTS_5_19<=((others=> (others=>'0')));
    MULTS_5_20<=((others=> (others=>'0')));
    MULTS_5_21<=((others=> (others=>'0')));
    MULTS_5_22<=((others=> (others=>'0')));
    MULTS_5_23<=((others=> (others=>'0')));
    MULTS_5_24<=((others=> (others=>'0')));
    MULTS_5_25<=((others=> (others=>'0')));
    MULTS_5_26<=((others=> (others=>'0')));
    MULTS_5_27<=((others=> (others=>'0')));
    MULTS_5_28<=((others=> (others=>'0')));
    MULTS_5_29<=((others=> (others=>'0')));
    MULTS_5_30<=((others=> (others=>'0')));
    MULTS_5_31<=((others=> (others=>'0')));
    MULTS_5_32<=((others=> (others=>'0')));
    MULTS_5_33<=((others=> (others=>'0')));
    MULTS_5_34<=((others=> (others=>'0')));
    MULTS_5_35<=((others=> (others=>'0')));
    MULTS_5_36<=((others=> (others=>'0')));
    MULTS_5_37<=((others=> (others=>'0')));
    MULTS_5_38<=((others=> (others=>'0')));
    MULTS_5_39<=((others=> (others=>'0')));
    MULTS_5_40<=((others=> (others=>'0')));
    MULTS_5_41<=((others=> (others=>'0')));
    MULTS_5_42<=((others=> (others=>'0')));
    MULTS_5_43<=((others=> (others=>'0')));
    MULTS_5_44<=((others=> (others=>'0')));
    MULTS_5_45<=((others=> (others=>'0')));
    EN_SUM_MULT_6<='0';
    MULTS_6_1<=((others=> (others=>'0')));
    MULTS_6_2<=((others=> (others=>'0')));
    MULTS_6_3<=((others=> (others=>'0')));
    MULTS_6_4<=((others=> (others=>'0')));
    MULTS_6_5<=((others=> (others=>'0')));
    MULTS_6_6<=((others=> (others=>'0')));
    MULTS_6_7<=((others=> (others=>'0')));
    MULTS_6_8<=((others=> (others=>'0')));
    MULTS_6_9<=((others=> (others=>'0')));
    MULTS_6_10<=((others=> (others=>'0')));
    MULTS_6_11<=((others=> (others=>'0')));
    MULTS_6_12<=((others=> (others=>'0')));
    MULTS_6_13<=((others=> (others=>'0')));
    MULTS_6_14<=((others=> (others=>'0')));
    MULTS_6_15<=((others=> (others=>'0')));
    MULTS_6_16<=((others=> (others=>'0')));
    MULTS_6_17<=((others=> (others=>'0')));
    MULTS_6_18<=((others=> (others=>'0')));
    MULTS_6_19<=((others=> (others=>'0')));
    MULTS_6_20<=((others=> (others=>'0')));
    MULTS_6_21<=((others=> (others=>'0')));
    MULTS_6_22<=((others=> (others=>'0')));
    MULTS_6_23<=((others=> (others=>'0')));
    MULTS_6_24<=((others=> (others=>'0')));
    MULTS_6_25<=((others=> (others=>'0')));
    MULTS_6_26<=((others=> (others=>'0')));
    MULTS_6_27<=((others=> (others=>'0')));
    MULTS_6_28<=((others=> (others=>'0')));
    MULTS_6_29<=((others=> (others=>'0')));
    MULTS_6_30<=((others=> (others=>'0')));
    MULTS_6_31<=((others=> (others=>'0')));
    MULTS_6_32<=((others=> (others=>'0')));
    MULTS_6_33<=((others=> (others=>'0')));
    MULTS_6_34<=((others=> (others=>'0')));
    MULTS_6_35<=((others=> (others=>'0')));
    MULTS_6_36<=((others=> (others=>'0')));
    MULTS_6_37<=((others=> (others=>'0')));
    MULTS_6_38<=((others=> (others=>'0')));
    MULTS_6_39<=((others=> (others=>'0')));
    MULTS_6_40<=((others=> (others=>'0')));
    MULTS_6_41<=((others=> (others=>'0')));
    MULTS_6_42<=((others=> (others=>'0')));
    MULTS_6_43<=((others=> (others=>'0')));
    MULTS_6_44<=((others=> (others=>'0')));
    MULTS_6_45<=((others=> (others=>'0')));

------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_6='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_6='1' then EN_NXT_LYR_6<='1';end if;

			MULT_1(0)<=signed(DIN_1_6)*signed(FMAP_1_1);
			MULT_2(0)<=signed(DIN_2_6)*signed(FMAP_1_2);
			MULT_3(0)<=signed(DIN_3_6)*signed(FMAP_1_3);
			MULT_4(0)<=signed(DIN_4_6)*signed(FMAP_1_4);
			MULT_5(0)<=signed(DIN_5_6)*signed(FMAP_1_5);
			MULT_6(0)<=signed(DIN_6_6)*signed(FMAP_1_6);
			MULT_7(0)<=signed(DIN_7_6)*signed(FMAP_1_7);
			MULT_8(0)<=signed(DIN_8_6)*signed(FMAP_1_8);
			MULT_9(0)<=signed(DIN_9_6)*signed(FMAP_1_9);
			MULT_10(0)<=signed(DIN_10_6)*signed(FMAP_1_10);
			MULT_11(0)<=signed(DIN_11_6)*signed(FMAP_1_11);
			MULT_12(0)<=signed(DIN_12_6)*signed(FMAP_1_12);
			MULT_13(0)<=signed(DIN_13_6)*signed(FMAP_1_13);
			MULT_14(0)<=signed(DIN_14_6)*signed(FMAP_1_14);
			MULT_15(0)<=signed(DIN_15_6)*signed(FMAP_1_15);
			MULT_16(0)<=signed(DIN_16_6)*signed(FMAP_1_16);
			MULT_17(0)<=signed(DIN_17_6)*signed(FMAP_1_17);
			MULT_18(0)<=signed(DIN_18_6)*signed(FMAP_1_18);
			MULT_19(0)<=signed(DIN_19_6)*signed(FMAP_1_19);
			MULT_20(0)<=signed(DIN_20_6)*signed(FMAP_1_20);
			MULT_21(0)<=signed(DIN_21_6)*signed(FMAP_1_21);
			MULT_22(0)<=signed(DIN_22_6)*signed(FMAP_1_22);
			MULT_23(0)<=signed(DIN_23_6)*signed(FMAP_1_23);
			MULT_24(0)<=signed(DIN_24_6)*signed(FMAP_1_24);
			MULT_25(0)<=signed(DIN_25_6)*signed(FMAP_1_25);
			MULT_26(0)<=signed(DIN_26_6)*signed(FMAP_1_26);
			MULT_27(0)<=signed(DIN_27_6)*signed(FMAP_1_27);
			MULT_28(0)<=signed(DIN_28_6)*signed(FMAP_1_28);
			MULT_29(0)<=signed(DIN_29_6)*signed(FMAP_1_29);
			MULT_30(0)<=signed(DIN_30_6)*signed(FMAP_1_30);
			MULT_31(0)<=signed(DIN_31_6)*signed(FMAP_1_31);
			MULT_32(0)<=signed(DIN_32_6)*signed(FMAP_1_32);
			MULT_33(0)<=signed(DIN_33_6)*signed(FMAP_1_33);
			MULT_34(0)<=signed(DIN_34_6)*signed(FMAP_1_34);
			MULT_35(0)<=signed(DIN_35_6)*signed(FMAP_1_35);
			MULT_36(0)<=signed(DIN_36_6)*signed(FMAP_1_36);
			MULT_37(0)<=signed(DIN_37_6)*signed(FMAP_1_37);
			MULT_38(0)<=signed(DIN_38_6)*signed(FMAP_1_38);
			MULT_39(0)<=signed(DIN_39_6)*signed(FMAP_1_39);
			MULT_40(0)<=signed(DIN_40_6)*signed(FMAP_1_40);
			MULT_41(0)<=signed(DIN_41_6)*signed(FMAP_1_41);
			MULT_42(0)<=signed(DIN_42_6)*signed(FMAP_1_42);
			MULT_43(0)<=signed(DIN_43_6)*signed(FMAP_1_43);
			MULT_44(0)<=signed(DIN_44_6)*signed(FMAP_1_44);
			MULT_45(0)<=signed(DIN_45_6)*signed(FMAP_1_45);

			MULT_1(1)<=signed(DIN_1_6)*signed(FMAP_2_1);
			MULT_2(1)<=signed(DIN_2_6)*signed(FMAP_2_2);
			MULT_3(1)<=signed(DIN_3_6)*signed(FMAP_2_3);
			MULT_4(1)<=signed(DIN_4_6)*signed(FMAP_2_4);
			MULT_5(1)<=signed(DIN_5_6)*signed(FMAP_2_5);
			MULT_6(1)<=signed(DIN_6_6)*signed(FMAP_2_6);
			MULT_7(1)<=signed(DIN_7_6)*signed(FMAP_2_7);
			MULT_8(1)<=signed(DIN_8_6)*signed(FMAP_2_8);
			MULT_9(1)<=signed(DIN_9_6)*signed(FMAP_2_9);
			MULT_10(1)<=signed(DIN_10_6)*signed(FMAP_2_10);
			MULT_11(1)<=signed(DIN_11_6)*signed(FMAP_2_11);
			MULT_12(1)<=signed(DIN_12_6)*signed(FMAP_2_12);
			MULT_13(1)<=signed(DIN_13_6)*signed(FMAP_2_13);
			MULT_14(1)<=signed(DIN_14_6)*signed(FMAP_2_14);
			MULT_15(1)<=signed(DIN_15_6)*signed(FMAP_2_15);
			MULT_16(1)<=signed(DIN_16_6)*signed(FMAP_2_16);
			MULT_17(1)<=signed(DIN_17_6)*signed(FMAP_2_17);
			MULT_18(1)<=signed(DIN_18_6)*signed(FMAP_2_18);
			MULT_19(1)<=signed(DIN_19_6)*signed(FMAP_2_19);
			MULT_20(1)<=signed(DIN_20_6)*signed(FMAP_2_20);
			MULT_21(1)<=signed(DIN_21_6)*signed(FMAP_2_21);
			MULT_22(1)<=signed(DIN_22_6)*signed(FMAP_2_22);
			MULT_23(1)<=signed(DIN_23_6)*signed(FMAP_2_23);
			MULT_24(1)<=signed(DIN_24_6)*signed(FMAP_2_24);
			MULT_25(1)<=signed(DIN_25_6)*signed(FMAP_2_25);
			MULT_26(1)<=signed(DIN_26_6)*signed(FMAP_2_26);
			MULT_27(1)<=signed(DIN_27_6)*signed(FMAP_2_27);
			MULT_28(1)<=signed(DIN_28_6)*signed(FMAP_2_28);
			MULT_29(1)<=signed(DIN_29_6)*signed(FMAP_2_29);
			MULT_30(1)<=signed(DIN_30_6)*signed(FMAP_2_30);
			MULT_31(1)<=signed(DIN_31_6)*signed(FMAP_2_31);
			MULT_32(1)<=signed(DIN_32_6)*signed(FMAP_2_32);
			MULT_33(1)<=signed(DIN_33_6)*signed(FMAP_2_33);
			MULT_34(1)<=signed(DIN_34_6)*signed(FMAP_2_34);
			MULT_35(1)<=signed(DIN_35_6)*signed(FMAP_2_35);
			MULT_36(1)<=signed(DIN_36_6)*signed(FMAP_2_36);
			MULT_37(1)<=signed(DIN_37_6)*signed(FMAP_2_37);
			MULT_38(1)<=signed(DIN_38_6)*signed(FMAP_2_38);
			MULT_39(1)<=signed(DIN_39_6)*signed(FMAP_2_39);
			MULT_40(1)<=signed(DIN_40_6)*signed(FMAP_2_40);
			MULT_41(1)<=signed(DIN_41_6)*signed(FMAP_2_41);
			MULT_42(1)<=signed(DIN_42_6)*signed(FMAP_2_42);
			MULT_43(1)<=signed(DIN_43_6)*signed(FMAP_2_43);
			MULT_44(1)<=signed(DIN_44_6)*signed(FMAP_2_44);
			MULT_45(1)<=signed(DIN_45_6)*signed(FMAP_2_45);

			MULT_1(2)<=signed(DIN_1_6)*signed(FMAP_3_1);
			MULT_2(2)<=signed(DIN_2_6)*signed(FMAP_3_2);
			MULT_3(2)<=signed(DIN_3_6)*signed(FMAP_3_3);
			MULT_4(2)<=signed(DIN_4_6)*signed(FMAP_3_4);
			MULT_5(2)<=signed(DIN_5_6)*signed(FMAP_3_5);
			MULT_6(2)<=signed(DIN_6_6)*signed(FMAP_3_6);
			MULT_7(2)<=signed(DIN_7_6)*signed(FMAP_3_7);
			MULT_8(2)<=signed(DIN_8_6)*signed(FMAP_3_8);
			MULT_9(2)<=signed(DIN_9_6)*signed(FMAP_3_9);
			MULT_10(2)<=signed(DIN_10_6)*signed(FMAP_3_10);
			MULT_11(2)<=signed(DIN_11_6)*signed(FMAP_3_11);
			MULT_12(2)<=signed(DIN_12_6)*signed(FMAP_3_12);
			MULT_13(2)<=signed(DIN_13_6)*signed(FMAP_3_13);
			MULT_14(2)<=signed(DIN_14_6)*signed(FMAP_3_14);
			MULT_15(2)<=signed(DIN_15_6)*signed(FMAP_3_15);
			MULT_16(2)<=signed(DIN_16_6)*signed(FMAP_3_16);
			MULT_17(2)<=signed(DIN_17_6)*signed(FMAP_3_17);
			MULT_18(2)<=signed(DIN_18_6)*signed(FMAP_3_18);
			MULT_19(2)<=signed(DIN_19_6)*signed(FMAP_3_19);
			MULT_20(2)<=signed(DIN_20_6)*signed(FMAP_3_20);
			MULT_21(2)<=signed(DIN_21_6)*signed(FMAP_3_21);
			MULT_22(2)<=signed(DIN_22_6)*signed(FMAP_3_22);
			MULT_23(2)<=signed(DIN_23_6)*signed(FMAP_3_23);
			MULT_24(2)<=signed(DIN_24_6)*signed(FMAP_3_24);
			MULT_25(2)<=signed(DIN_25_6)*signed(FMAP_3_25);
			MULT_26(2)<=signed(DIN_26_6)*signed(FMAP_3_26);
			MULT_27(2)<=signed(DIN_27_6)*signed(FMAP_3_27);
			MULT_28(2)<=signed(DIN_28_6)*signed(FMAP_3_28);
			MULT_29(2)<=signed(DIN_29_6)*signed(FMAP_3_29);
			MULT_30(2)<=signed(DIN_30_6)*signed(FMAP_3_30);
			MULT_31(2)<=signed(DIN_31_6)*signed(FMAP_3_31);
			MULT_32(2)<=signed(DIN_32_6)*signed(FMAP_3_32);
			MULT_33(2)<=signed(DIN_33_6)*signed(FMAP_3_33);
			MULT_34(2)<=signed(DIN_34_6)*signed(FMAP_3_34);
			MULT_35(2)<=signed(DIN_35_6)*signed(FMAP_3_35);
			MULT_36(2)<=signed(DIN_36_6)*signed(FMAP_3_36);
			MULT_37(2)<=signed(DIN_37_6)*signed(FMAP_3_37);
			MULT_38(2)<=signed(DIN_38_6)*signed(FMAP_3_38);
			MULT_39(2)<=signed(DIN_39_6)*signed(FMAP_3_39);
			MULT_40(2)<=signed(DIN_40_6)*signed(FMAP_3_40);
			MULT_41(2)<=signed(DIN_41_6)*signed(FMAP_3_41);
			MULT_42(2)<=signed(DIN_42_6)*signed(FMAP_3_42);
			MULT_43(2)<=signed(DIN_43_6)*signed(FMAP_3_43);
			MULT_44(2)<=signed(DIN_44_6)*signed(FMAP_3_44);
			MULT_45(2)<=signed(DIN_45_6)*signed(FMAP_3_45);

			MULT_1(3)<=signed(DIN_1_6)*signed(FMAP_4_1);
			MULT_2(3)<=signed(DIN_2_6)*signed(FMAP_4_2);
			MULT_3(3)<=signed(DIN_3_6)*signed(FMAP_4_3);
			MULT_4(3)<=signed(DIN_4_6)*signed(FMAP_4_4);
			MULT_5(3)<=signed(DIN_5_6)*signed(FMAP_4_5);
			MULT_6(3)<=signed(DIN_6_6)*signed(FMAP_4_6);
			MULT_7(3)<=signed(DIN_7_6)*signed(FMAP_4_7);
			MULT_8(3)<=signed(DIN_8_6)*signed(FMAP_4_8);
			MULT_9(3)<=signed(DIN_9_6)*signed(FMAP_4_9);
			MULT_10(3)<=signed(DIN_10_6)*signed(FMAP_4_10);
			MULT_11(3)<=signed(DIN_11_6)*signed(FMAP_4_11);
			MULT_12(3)<=signed(DIN_12_6)*signed(FMAP_4_12);
			MULT_13(3)<=signed(DIN_13_6)*signed(FMAP_4_13);
			MULT_14(3)<=signed(DIN_14_6)*signed(FMAP_4_14);
			MULT_15(3)<=signed(DIN_15_6)*signed(FMAP_4_15);
			MULT_16(3)<=signed(DIN_16_6)*signed(FMAP_4_16);
			MULT_17(3)<=signed(DIN_17_6)*signed(FMAP_4_17);
			MULT_18(3)<=signed(DIN_18_6)*signed(FMAP_4_18);
			MULT_19(3)<=signed(DIN_19_6)*signed(FMAP_4_19);
			MULT_20(3)<=signed(DIN_20_6)*signed(FMAP_4_20);
			MULT_21(3)<=signed(DIN_21_6)*signed(FMAP_4_21);
			MULT_22(3)<=signed(DIN_22_6)*signed(FMAP_4_22);
			MULT_23(3)<=signed(DIN_23_6)*signed(FMAP_4_23);
			MULT_24(3)<=signed(DIN_24_6)*signed(FMAP_4_24);
			MULT_25(3)<=signed(DIN_25_6)*signed(FMAP_4_25);
			MULT_26(3)<=signed(DIN_26_6)*signed(FMAP_4_26);
			MULT_27(3)<=signed(DIN_27_6)*signed(FMAP_4_27);
			MULT_28(3)<=signed(DIN_28_6)*signed(FMAP_4_28);
			MULT_29(3)<=signed(DIN_29_6)*signed(FMAP_4_29);
			MULT_30(3)<=signed(DIN_30_6)*signed(FMAP_4_30);
			MULT_31(3)<=signed(DIN_31_6)*signed(FMAP_4_31);
			MULT_32(3)<=signed(DIN_32_6)*signed(FMAP_4_32);
			MULT_33(3)<=signed(DIN_33_6)*signed(FMAP_4_33);
			MULT_34(3)<=signed(DIN_34_6)*signed(FMAP_4_34);
			MULT_35(3)<=signed(DIN_35_6)*signed(FMAP_4_35);
			MULT_36(3)<=signed(DIN_36_6)*signed(FMAP_4_36);
			MULT_37(3)<=signed(DIN_37_6)*signed(FMAP_4_37);
			MULT_38(3)<=signed(DIN_38_6)*signed(FMAP_4_38);
			MULT_39(3)<=signed(DIN_39_6)*signed(FMAP_4_39);
			MULT_40(3)<=signed(DIN_40_6)*signed(FMAP_4_40);
			MULT_41(3)<=signed(DIN_41_6)*signed(FMAP_4_41);
			MULT_42(3)<=signed(DIN_42_6)*signed(FMAP_4_42);
			MULT_43(3)<=signed(DIN_43_6)*signed(FMAP_4_43);
			MULT_44(3)<=signed(DIN_44_6)*signed(FMAP_4_44);
			MULT_45(3)<=signed(DIN_45_6)*signed(FMAP_4_45);


                        EN_SUM_MULT_1<='1';

      -------------------------------------------- Enable MULT START --------------------------------------------				


		if EN_SUM_MULT_1 = '1' then
			------------------------------------STAGE-1--------------------------------------
			MULTS_1_1(0)<=signed(MULT_1(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_1(1)<=signed(MULT_1(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_1(2)<=signed(MULT_1(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_1(3)<=signed(MULT_1(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_2(0)<=signed(MULT_2(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_3(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_2(1)<=signed(MULT_2(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_3(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_2(2)<=signed(MULT_2(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_3(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_2(3)<=signed(MULT_2(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_3(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_3(0)<=signed(MULT_4(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_5(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_3(1)<=signed(MULT_4(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_5(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_3(2)<=signed(MULT_4(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_5(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_3(3)<=signed(MULT_4(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_5(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_4(0)<=signed(MULT_6(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_7(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_4(1)<=signed(MULT_6(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_7(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_4(2)<=signed(MULT_6(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_7(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_4(3)<=signed(MULT_6(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_7(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_5(0)<=signed(MULT_8(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_9(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_5(1)<=signed(MULT_8(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_9(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_5(2)<=signed(MULT_8(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_9(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_5(3)<=signed(MULT_8(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_9(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_6(0)<=signed(MULT_10(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_11(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_6(1)<=signed(MULT_10(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_11(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_6(2)<=signed(MULT_10(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_11(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_6(3)<=signed(MULT_10(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_11(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_7(0)<=signed(MULT_12(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_13(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_7(1)<=signed(MULT_12(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_13(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_7(2)<=signed(MULT_12(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_13(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_7(3)<=signed(MULT_12(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_13(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_8(0)<=signed(MULT_14(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_15(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_8(1)<=signed(MULT_14(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_15(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_8(2)<=signed(MULT_14(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_15(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_8(3)<=signed(MULT_14(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_15(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_9(0)<=signed(MULT_16(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_17(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_9(1)<=signed(MULT_16(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_17(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_9(2)<=signed(MULT_16(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_17(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_9(3)<=signed(MULT_16(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_17(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_10(0)<=signed(MULT_18(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_19(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_10(1)<=signed(MULT_18(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_19(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_10(2)<=signed(MULT_18(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_19(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_10(3)<=signed(MULT_18(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_19(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_11(0)<=signed(MULT_20(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_21(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_11(1)<=signed(MULT_20(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_21(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_11(2)<=signed(MULT_20(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_21(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_11(3)<=signed(MULT_20(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_21(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_12(0)<=signed(MULT_22(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_23(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_12(1)<=signed(MULT_22(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_23(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_12(2)<=signed(MULT_22(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_23(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_12(3)<=signed(MULT_22(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_23(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_13(0)<=signed(MULT_24(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_25(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_13(1)<=signed(MULT_24(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_25(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_13(2)<=signed(MULT_24(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_25(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_13(3)<=signed(MULT_24(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_25(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_14(0)<=signed(MULT_26(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_27(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_14(1)<=signed(MULT_26(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_27(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_14(2)<=signed(MULT_26(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_27(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_14(3)<=signed(MULT_26(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_27(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_15(0)<=signed(MULT_28(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_29(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_15(1)<=signed(MULT_28(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_29(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_15(2)<=signed(MULT_28(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_29(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_15(3)<=signed(MULT_28(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_29(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_16(0)<=signed(MULT_30(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_31(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_16(1)<=signed(MULT_30(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_31(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_16(2)<=signed(MULT_30(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_31(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_16(3)<=signed(MULT_30(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_31(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_17(0)<=signed(MULT_32(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_33(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_17(1)<=signed(MULT_32(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_33(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_17(2)<=signed(MULT_32(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_33(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_17(3)<=signed(MULT_32(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_33(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_18(0)<=signed(MULT_34(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_35(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_18(1)<=signed(MULT_34(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_35(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_18(2)<=signed(MULT_34(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_35(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_18(3)<=signed(MULT_34(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_35(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_19(0)<=signed(MULT_36(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_37(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_19(1)<=signed(MULT_36(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_37(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_19(2)<=signed(MULT_36(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_37(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_19(3)<=signed(MULT_36(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_37(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_20(0)<=signed(MULT_38(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_39(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_20(1)<=signed(MULT_38(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_39(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_20(2)<=signed(MULT_38(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_39(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_20(3)<=signed(MULT_38(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_39(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_21(0)<=signed(MULT_40(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_41(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_21(1)<=signed(MULT_40(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_41(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_21(2)<=signed(MULT_40(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_41(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_21(3)<=signed(MULT_40(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_41(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_22(0)<=signed(MULT_42(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_43(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_22(1)<=signed(MULT_42(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_43(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_22(2)<=signed(MULT_42(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_43(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_22(3)<=signed(MULT_42(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_43(3)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_23(0)<=signed(MULT_44(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_45(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_23(1)<=signed(MULT_44(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_45(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_23(2)<=signed(MULT_44(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_45(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_23(3)<=signed(MULT_44(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_45(3)(MULT_SIZE-1-WHOLE downto DECIMAL));



                     EN_SUM_MULT_2<='1';
		end if;


		------------------------- Enable NEXT STATGE MULTS START -----------------------

		if EN_SUM_MULT_2 = '1' then
			------------------------------------STAGE-2--------------------------------------
			MULTS_2_1(0)<=signed(MULTS_1_1(0));
			MULTS_2_1(1)<=signed(MULTS_1_1(1));
			MULTS_2_1(2)<=signed(MULTS_1_1(2));
			MULTS_2_1(3)<=signed(MULTS_1_1(3));

			MULTS_2_2(0)<=signed(MULTS_1_2(0)(PRECISION-1 downto 0))+signed(MULTS_1_3(0)(PRECISION-1 downto 0));
			MULTS_2_2(1)<=signed(MULTS_1_2(1)(PRECISION-1 downto 0))+signed(MULTS_1_3(1)(PRECISION-1 downto 0));
			MULTS_2_2(2)<=signed(MULTS_1_2(2)(PRECISION-1 downto 0))+signed(MULTS_1_3(2)(PRECISION-1 downto 0));
			MULTS_2_2(3)<=signed(MULTS_1_2(3)(PRECISION-1 downto 0))+signed(MULTS_1_3(3)(PRECISION-1 downto 0));

			MULTS_2_3(0)<=signed(MULTS_1_4(0)(PRECISION-1 downto 0))+signed(MULTS_1_5(0)(PRECISION-1 downto 0));
			MULTS_2_3(1)<=signed(MULTS_1_4(1)(PRECISION-1 downto 0))+signed(MULTS_1_5(1)(PRECISION-1 downto 0));
			MULTS_2_3(2)<=signed(MULTS_1_4(2)(PRECISION-1 downto 0))+signed(MULTS_1_5(2)(PRECISION-1 downto 0));
			MULTS_2_3(3)<=signed(MULTS_1_4(3)(PRECISION-1 downto 0))+signed(MULTS_1_5(3)(PRECISION-1 downto 0));

			MULTS_2_4(0)<=signed(MULTS_1_6(0)(PRECISION-1 downto 0))+signed(MULTS_1_7(0)(PRECISION-1 downto 0));
			MULTS_2_4(1)<=signed(MULTS_1_6(1)(PRECISION-1 downto 0))+signed(MULTS_1_7(1)(PRECISION-1 downto 0));
			MULTS_2_4(2)<=signed(MULTS_1_6(2)(PRECISION-1 downto 0))+signed(MULTS_1_7(2)(PRECISION-1 downto 0));
			MULTS_2_4(3)<=signed(MULTS_1_6(3)(PRECISION-1 downto 0))+signed(MULTS_1_7(3)(PRECISION-1 downto 0));

			MULTS_2_5(0)<=signed(MULTS_1_8(0)(PRECISION-1 downto 0))+signed(MULTS_1_9(0)(PRECISION-1 downto 0));
			MULTS_2_5(1)<=signed(MULTS_1_8(1)(PRECISION-1 downto 0))+signed(MULTS_1_9(1)(PRECISION-1 downto 0));
			MULTS_2_5(2)<=signed(MULTS_1_8(2)(PRECISION-1 downto 0))+signed(MULTS_1_9(2)(PRECISION-1 downto 0));
			MULTS_2_5(3)<=signed(MULTS_1_8(3)(PRECISION-1 downto 0))+signed(MULTS_1_9(3)(PRECISION-1 downto 0));

			MULTS_2_6(0)<=signed(MULTS_1_10(0)(PRECISION-1 downto 0))+signed(MULTS_1_11(0)(PRECISION-1 downto 0));
			MULTS_2_6(1)<=signed(MULTS_1_10(1)(PRECISION-1 downto 0))+signed(MULTS_1_11(1)(PRECISION-1 downto 0));
			MULTS_2_6(2)<=signed(MULTS_1_10(2)(PRECISION-1 downto 0))+signed(MULTS_1_11(2)(PRECISION-1 downto 0));
			MULTS_2_6(3)<=signed(MULTS_1_10(3)(PRECISION-1 downto 0))+signed(MULTS_1_11(3)(PRECISION-1 downto 0));

			MULTS_2_7(0)<=signed(MULTS_1_12(0)(PRECISION-1 downto 0))+signed(MULTS_1_13(0)(PRECISION-1 downto 0));
			MULTS_2_7(1)<=signed(MULTS_1_12(1)(PRECISION-1 downto 0))+signed(MULTS_1_13(1)(PRECISION-1 downto 0));
			MULTS_2_7(2)<=signed(MULTS_1_12(2)(PRECISION-1 downto 0))+signed(MULTS_1_13(2)(PRECISION-1 downto 0));
			MULTS_2_7(3)<=signed(MULTS_1_12(3)(PRECISION-1 downto 0))+signed(MULTS_1_13(3)(PRECISION-1 downto 0));

			MULTS_2_8(0)<=signed(MULTS_1_14(0)(PRECISION-1 downto 0))+signed(MULTS_1_15(0)(PRECISION-1 downto 0));
			MULTS_2_8(1)<=signed(MULTS_1_14(1)(PRECISION-1 downto 0))+signed(MULTS_1_15(1)(PRECISION-1 downto 0));
			MULTS_2_8(2)<=signed(MULTS_1_14(2)(PRECISION-1 downto 0))+signed(MULTS_1_15(2)(PRECISION-1 downto 0));
			MULTS_2_8(3)<=signed(MULTS_1_14(3)(PRECISION-1 downto 0))+signed(MULTS_1_15(3)(PRECISION-1 downto 0));

			MULTS_2_9(0)<=signed(MULTS_1_16(0)(PRECISION-1 downto 0))+signed(MULTS_1_17(0)(PRECISION-1 downto 0));
			MULTS_2_9(1)<=signed(MULTS_1_16(1)(PRECISION-1 downto 0))+signed(MULTS_1_17(1)(PRECISION-1 downto 0));
			MULTS_2_9(2)<=signed(MULTS_1_16(2)(PRECISION-1 downto 0))+signed(MULTS_1_17(2)(PRECISION-1 downto 0));
			MULTS_2_9(3)<=signed(MULTS_1_16(3)(PRECISION-1 downto 0))+signed(MULTS_1_17(3)(PRECISION-1 downto 0));

			MULTS_2_10(0)<=signed(MULTS_1_18(0)(PRECISION-1 downto 0))+signed(MULTS_1_19(0)(PRECISION-1 downto 0));
			MULTS_2_10(1)<=signed(MULTS_1_18(1)(PRECISION-1 downto 0))+signed(MULTS_1_19(1)(PRECISION-1 downto 0));
			MULTS_2_10(2)<=signed(MULTS_1_18(2)(PRECISION-1 downto 0))+signed(MULTS_1_19(2)(PRECISION-1 downto 0));
			MULTS_2_10(3)<=signed(MULTS_1_18(3)(PRECISION-1 downto 0))+signed(MULTS_1_19(3)(PRECISION-1 downto 0));

			MULTS_2_11(0)<=signed(MULTS_1_20(0)(PRECISION-1 downto 0))+signed(MULTS_1_21(0)(PRECISION-1 downto 0));
			MULTS_2_11(1)<=signed(MULTS_1_20(1)(PRECISION-1 downto 0))+signed(MULTS_1_21(1)(PRECISION-1 downto 0));
			MULTS_2_11(2)<=signed(MULTS_1_20(2)(PRECISION-1 downto 0))+signed(MULTS_1_21(2)(PRECISION-1 downto 0));
			MULTS_2_11(3)<=signed(MULTS_1_20(3)(PRECISION-1 downto 0))+signed(MULTS_1_21(3)(PRECISION-1 downto 0));

			MULTS_2_12(0)<=signed(MULTS_1_22(0)(PRECISION-1 downto 0))+signed(MULTS_1_23(0)(PRECISION-1 downto 0));
			MULTS_2_12(1)<=signed(MULTS_1_22(1)(PRECISION-1 downto 0))+signed(MULTS_1_23(1)(PRECISION-1 downto 0));
			MULTS_2_12(2)<=signed(MULTS_1_22(2)(PRECISION-1 downto 0))+signed(MULTS_1_23(2)(PRECISION-1 downto 0));
			MULTS_2_12(3)<=signed(MULTS_1_22(3)(PRECISION-1 downto 0))+signed(MULTS_1_23(3)(PRECISION-1 downto 0));



                         EN_SUM_MULT_3<='1';
		end if;


		------------------------- Enable NEXT STATGE MULTS START -----------------------

		if EN_SUM_MULT_3 = '1' then
			------------------------------------STAGE-3--------------------------------------
			MULTS_3_1(0)<=signed(MULTS_2_1(0)(PRECISION-1 downto 0))+signed(MULTS_2_2(0)(PRECISION-1 downto 0));
			MULTS_3_1(1)<=signed(MULTS_2_1(1)(PRECISION-1 downto 0))+signed(MULTS_2_2(1)(PRECISION-1 downto 0));
			MULTS_3_1(2)<=signed(MULTS_2_1(2)(PRECISION-1 downto 0))+signed(MULTS_2_2(2)(PRECISION-1 downto 0));
			MULTS_3_1(3)<=signed(MULTS_2_1(3)(PRECISION-1 downto 0))+signed(MULTS_2_2(3)(PRECISION-1 downto 0));

			MULTS_3_2(0)<=signed(MULTS_2_3(0)(PRECISION-1 downto 0))+signed(MULTS_2_4(0)(PRECISION-1 downto 0));
			MULTS_3_2(1)<=signed(MULTS_2_3(1)(PRECISION-1 downto 0))+signed(MULTS_2_4(1)(PRECISION-1 downto 0));
			MULTS_3_2(2)<=signed(MULTS_2_3(2)(PRECISION-1 downto 0))+signed(MULTS_2_4(2)(PRECISION-1 downto 0));
			MULTS_3_2(3)<=signed(MULTS_2_3(3)(PRECISION-1 downto 0))+signed(MULTS_2_4(3)(PRECISION-1 downto 0));

			MULTS_3_3(0)<=signed(MULTS_2_5(0)(PRECISION-1 downto 0))+signed(MULTS_2_6(0)(PRECISION-1 downto 0));
			MULTS_3_3(1)<=signed(MULTS_2_5(1)(PRECISION-1 downto 0))+signed(MULTS_2_6(1)(PRECISION-1 downto 0));
			MULTS_3_3(2)<=signed(MULTS_2_5(2)(PRECISION-1 downto 0))+signed(MULTS_2_6(2)(PRECISION-1 downto 0));
			MULTS_3_3(3)<=signed(MULTS_2_5(3)(PRECISION-1 downto 0))+signed(MULTS_2_6(3)(PRECISION-1 downto 0));

			MULTS_3_4(0)<=signed(MULTS_2_7(0)(PRECISION-1 downto 0))+signed(MULTS_2_8(0)(PRECISION-1 downto 0));
			MULTS_3_4(1)<=signed(MULTS_2_7(1)(PRECISION-1 downto 0))+signed(MULTS_2_8(1)(PRECISION-1 downto 0));
			MULTS_3_4(2)<=signed(MULTS_2_7(2)(PRECISION-1 downto 0))+signed(MULTS_2_8(2)(PRECISION-1 downto 0));
			MULTS_3_4(3)<=signed(MULTS_2_7(3)(PRECISION-1 downto 0))+signed(MULTS_2_8(3)(PRECISION-1 downto 0));

			MULTS_3_5(0)<=signed(MULTS_2_9(0)(PRECISION-1 downto 0))+signed(MULTS_2_10(0)(PRECISION-1 downto 0));
			MULTS_3_5(1)<=signed(MULTS_2_9(1)(PRECISION-1 downto 0))+signed(MULTS_2_10(1)(PRECISION-1 downto 0));
			MULTS_3_5(2)<=signed(MULTS_2_9(2)(PRECISION-1 downto 0))+signed(MULTS_2_10(2)(PRECISION-1 downto 0));
			MULTS_3_5(3)<=signed(MULTS_2_9(3)(PRECISION-1 downto 0))+signed(MULTS_2_10(3)(PRECISION-1 downto 0));

			MULTS_3_6(0)<=signed(MULTS_2_11(0)(PRECISION-1 downto 0))+signed(MULTS_2_12(0)(PRECISION-1 downto 0));
			MULTS_3_6(1)<=signed(MULTS_2_11(1)(PRECISION-1 downto 0))+signed(MULTS_2_12(1)(PRECISION-1 downto 0));
			MULTS_3_6(2)<=signed(MULTS_2_11(2)(PRECISION-1 downto 0))+signed(MULTS_2_12(2)(PRECISION-1 downto 0));
			MULTS_3_6(3)<=signed(MULTS_2_11(3)(PRECISION-1 downto 0))+signed(MULTS_2_12(3)(PRECISION-1 downto 0));



                         EN_SUM_MULT_4<='1';
		end if;


		------------------------- Enable NEXT STATGE MULTS START -----------------------

		if EN_SUM_MULT_4 = '1' then
			------------------------------------STAGE-4--------------------------------------
			MULTS_4_1(0)<=signed(MULTS_3_1(0)(PRECISION-1 downto 0))+signed(MULTS_3_2(0)(PRECISION-1 downto 0));
			MULTS_4_1(1)<=signed(MULTS_3_1(1)(PRECISION-1 downto 0))+signed(MULTS_3_2(1)(PRECISION-1 downto 0));
			MULTS_4_1(2)<=signed(MULTS_3_1(2)(PRECISION-1 downto 0))+signed(MULTS_3_2(2)(PRECISION-1 downto 0));
			MULTS_4_1(3)<=signed(MULTS_3_1(3)(PRECISION-1 downto 0))+signed(MULTS_3_2(3)(PRECISION-1 downto 0));

			MULTS_4_2(0)<=signed(MULTS_3_3(0)(PRECISION-1 downto 0))+signed(MULTS_3_4(0)(PRECISION-1 downto 0));
			MULTS_4_2(1)<=signed(MULTS_3_3(1)(PRECISION-1 downto 0))+signed(MULTS_3_4(1)(PRECISION-1 downto 0));
			MULTS_4_2(2)<=signed(MULTS_3_3(2)(PRECISION-1 downto 0))+signed(MULTS_3_4(2)(PRECISION-1 downto 0));
			MULTS_4_2(3)<=signed(MULTS_3_3(3)(PRECISION-1 downto 0))+signed(MULTS_3_4(3)(PRECISION-1 downto 0));

			MULTS_4_3(0)<=signed(MULTS_3_5(0)(PRECISION-1 downto 0))+signed(MULTS_3_6(0)(PRECISION-1 downto 0));
			MULTS_4_3(1)<=signed(MULTS_3_5(1)(PRECISION-1 downto 0))+signed(MULTS_3_6(1)(PRECISION-1 downto 0));
			MULTS_4_3(2)<=signed(MULTS_3_5(2)(PRECISION-1 downto 0))+signed(MULTS_3_6(2)(PRECISION-1 downto 0));
			MULTS_4_3(3)<=signed(MULTS_3_5(3)(PRECISION-1 downto 0))+signed(MULTS_3_6(3)(PRECISION-1 downto 0));



                         EN_SUM_MULT_5<='1';
		end if;


		------------------------- Enable NEXT STATGE MULTS START -----------------------

		if EN_SUM_MULT_5 = '1' then
			------------------------------------STAGE-5--------------------------------------
			MULTS_5_1(0)<=signed(MULTS_4_1(0));
			MULTS_5_1(1)<=signed(MULTS_4_1(1));
			MULTS_5_1(2)<=signed(MULTS_4_1(2));
			MULTS_5_1(3)<=signed(MULTS_4_1(3));

			MULTS_5_2(0)<=signed(MULTS_4_2(0)(PRECISION-1 downto 0))+signed(MULTS_4_3(0)(PRECISION-1 downto 0));
			MULTS_5_2(1)<=signed(MULTS_4_2(1)(PRECISION-1 downto 0))+signed(MULTS_4_3(1)(PRECISION-1 downto 0));
			MULTS_5_2(2)<=signed(MULTS_4_2(2)(PRECISION-1 downto 0))+signed(MULTS_4_3(2)(PRECISION-1 downto 0));
			MULTS_5_2(3)<=signed(MULTS_4_2(3)(PRECISION-1 downto 0))+signed(MULTS_4_3(3)(PRECISION-1 downto 0));



                         EN_SUM_MULT_6<='1';
		end if;


		------------------------- Enable NEXT STATGE MULTS START -----------------------

		if EN_SUM_MULT_6 = '1' then
			------------------------------------STAGE-6--------------------------------------
			MULTS_6_1(0)<=signed(MULTS_5_1(0)(PRECISION-1 downto 0))+signed(MULTS_5_2(0)(PRECISION-1 downto 0));
			MULTS_6_1(1)<=signed(MULTS_5_1(1)(PRECISION-1 downto 0))+signed(MULTS_5_2(1)(PRECISION-1 downto 0));
			MULTS_6_1(2)<=signed(MULTS_5_1(2)(PRECISION-1 downto 0))+signed(MULTS_5_2(2)(PRECISION-1 downto 0));
			MULTS_6_1(3)<=signed(MULTS_5_1(3)(PRECISION-1 downto 0))+signed(MULTS_5_2(3)(PRECISION-1 downto 0));



                        Enable_BIAS<='1';
		end if;


		------------------------------------STAGE-BIAS--------------------------------------
		if Enable_BIAS = '1' then

			BIAS_1<=(signed(BIAS_VAL_1)+ signed(MULTS_6_1(0)(PRECISION-1 downto 0)));
			BIAS_2<=(signed(BIAS_VAL_2)+ signed(MULTS_6_1(1)(PRECISION-1 downto 0)));
			BIAS_3<=(signed(BIAS_VAL_3)+ signed(MULTS_6_1(2)(PRECISION-1 downto 0)));
			BIAS_4<=(signed(BIAS_VAL_4)+ signed(MULTS_6_1(3)(PRECISION-1 downto 0)));

			Enable_ReLU<='1';
			
		end if;

		if SIG_STRIDE>1 and Enable_ReLU='1' then
                 SIG_STRIDE<=SIG_STRIDE-1; end if;

	if  Enable_ReLU='1' then
		if VALID_NXTLYR_PIX<VALID_LOCAL_PIX and SIG_STRIDE>(STRIDE-1) then

			if BIAS_1>0 then
			ReLU_1<=BIAS_1;
			DOUT_BUF_1_6<=std_logic_vector(BIAS_1);
			else
			ReLU_1<= (others => '0');
			DOUT_BUF_1_6<=(others => '0');
			end if;
			if BIAS_2>0 then
			ReLU_2<=BIAS_2;
			DOUT_BUF_2_6<=std_logic_vector(BIAS_2);
			else
			ReLU_2<= (others => '0');
			DOUT_BUF_2_6<=(others => '0');
			end if;
			if BIAS_3>0 then
			ReLU_3<=BIAS_3;
			DOUT_BUF_3_6<=std_logic_vector(BIAS_3);
			else
			ReLU_3<= (others => '0');
			DOUT_BUF_3_6<=(others => '0');
			end if;
			if BIAS_4>0 then
			ReLU_4<=BIAS_4;
			DOUT_BUF_4_6<=std_logic_vector(BIAS_4);
			else
			ReLU_4<= (others => '0');
			DOUT_BUF_4_6<=(others => '0');
			end if;

			EN_NXT_LYR_6<='1';FRST_TIM_EN_6<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
                       EN_NXT_LYR_6<='0';
                       DOUT_BUF_1_6<=(others => '0');
                       DOUT_BUF_2_6<=(others => '0');
                       DOUT_BUF_3_6<=(others => '0');
                       DOUT_BUF_4_6<=(others => '0');

		end if; -- VALIDPIXELS

		if VALID_NXTLYR_PIX=((VALID_LOCAL_PIX*STRIDE)-1) then VALID_NXTLYR_PIX<=0;SIG_STRIDE<=STRIDE;   -- reset sride and valid pixels
		else VALID_NXTLYR_PIX<=VALID_NXTLYR_PIX+1;end if; 

	end if;  --ReLU
elsif OUT_PIXEL_COUNT>=VALID_CYCLES  then INTERNAL_RST<='1';SIG_STRIDE<=STRIDE;EN_NXT_LYR_6<='1';  -- order is very important
else  EN_NXT_LYR_6<='0';-- In case stream stopped

end if; -- end enable 
end if; -- for RST	
end if; -- rising edge
end process LAYER_6;

EN_STREAM_OUT_6<= EN_STREAM_OUT_7;
VALID_OUT_6<= VALID_OUT_7;
DOUT_1_6<=DOUT_1_7;
DOUT_2_6<=DOUT_2_7;

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

