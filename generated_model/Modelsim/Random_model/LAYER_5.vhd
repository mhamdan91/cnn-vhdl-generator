------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Fri May 08 19:45:09 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    Flatten - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Number of Total Operaiton: 4
-- Number of Clock Cycles: 7
-- Number of GOPS = 0.0
-- Number of Clock Cycles till FC1: 26
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity Flatten_LAYER_5 is

GENERIC
 	( 
	constant PRECISION      : positive := 5; 	
	constant DOUT_WIDTH     : positive := 5; 	
	constant BIAS_SIZE      : positive := 5;	
	constant PF_X2_SIZE     : positive := 9;
	constant MULT_SIZE      : positive := 10;	
	constant DIN_WIDTH      : positive := 5;	
	constant IMAGE_WIDTH    : positive := 3;	
	constant IMAGE_SIZE     : positive := 225;	
	constant F_SIZE         : positive := 3;	
	constant WEIGHT_SIZE    : positive := 5;	
	constant BIASES_SIZE	: positive := 2;
	constant PADDING        : positive := 1;	
	constant STRIDE         : positive := 1;	
	constant FEATURE_MAPS   : positive := 5;	
	constant VALID_CYCLES   : positive := 9;	
	constant STRIDE_CYCLES  : positive := 2;	
	constant VALID_LOCAL_PIX: positive := 3;	
	constant ADD_TREE_DEPTH : positive := 4;	
	constant INPUT_DEPTH    : positive := 3;
	constant FIFO_DEPTH     : positive := 1;	
	constant MULT_SUM_D_1   : positive := 3;
	constant MULT_SUM_SIZE_1: positive := 6;
	constant MULT_SUM_D_2   : positive := 2;
	constant MULT_SUM_SIZE_2: positive := 6;
	constant MULT_SUM_D_3   : positive := 1;
	constant MULT_SUM_SIZE_3: positive := 6;
	constant ADD_1        : positive := 5;    	
	constant ADD_SIZE_1   : positive := 6;   	
	constant ADD_2        : positive := 3;    	
	constant ADD_SIZE_2   : positive := 6;   	
	constant ADD_3        : positive := 2;    	
	constant ADD_SIZE_3   : positive := 6;   	
	constant ADD_4        : positive := 1;    	
	constant ADD_SIZE_4   : positive := 6;   	
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN_1_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_2_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_3_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_4_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_5_5         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	CLK,RST         :IN std_logic;
   	DIS_STREAM      :OUT std_logic; 					-- S_AXIS_TVALID  : Data in is valid
   	EN_STREAM       :IN std_logic; 						-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_5     :OUT std_logic; 				-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_5         :OUT std_logic;                             -- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_5 :IN std_logic;
	DOUT_1_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_5            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST        :OUT std_logic
	);	

end Flatten_LAYER_5;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of Flatten_LAYER_5 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(WEIGHT_SIZE - 1 downto 0);
type       FIFO_Memory             is array (0 to FIFO_DEPTH - 1)          of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
type       SLIDING_WINDOW          is array (0 to F_SIZE-1, 0 to F_SIZE-1) of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
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


-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_2_6          : std_logic_vector(DOUT_WIDTH-1 downto 0);
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
		EN_STREAM_OUT_6	:OUT std_logic;
		VALID_OUT_6		:OUT std_logic;
		DOUT_1_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_2_6        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
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
          DOUT_1_6            => DOUT_1_6,
          DOUT_2_6            => DOUT_2_6,
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

------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_5='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_5='1' then EN_NXT_LYR_5<='1';end if;


               WINDOW_1(0,0)<=DIN_1_5;
               WINDOW_1(0,1)<=WINDOW_1(0,0);
               WINDOW_1(0,2)<=WINDOW_1(0,1);
               WINDOW_1(1,0)<=WINDOW_1(0,2);
               WINDOW_1(1,1)<=WINDOW_1(1,0);
               WINDOW_1(1,2)<=WINDOW_1(1,1);
               WINDOW_1(2,0)<=WINDOW_1(1,2);
               WINDOW_1(2,1)<=WINDOW_1(1,2);
               WINDOW_1(2,2)<=WINDOW_1(2,1);


               WINDOW_2(0,0)<=DIN_2_5;
               WINDOW_2(0,1)<=WINDOW_2(0,0);
               WINDOW_2(0,2)<=WINDOW_2(0,1);
               WINDOW_2(1,0)<=WINDOW_2(0,2);
               WINDOW_2(1,1)<=WINDOW_2(1,0);
               WINDOW_2(1,2)<=WINDOW_2(1,1);
               WINDOW_2(2,0)<=WINDOW_2(1,2);
               WINDOW_2(2,1)<=WINDOW_2(1,2);
               WINDOW_2(2,2)<=WINDOW_2(2,1);


               WINDOW_3(0,0)<=DIN_3_5;
               WINDOW_3(0,1)<=WINDOW_3(0,0);
               WINDOW_3(0,2)<=WINDOW_3(0,1);
               WINDOW_3(1,0)<=WINDOW_3(0,2);
               WINDOW_3(1,1)<=WINDOW_3(1,0);
               WINDOW_3(1,2)<=WINDOW_3(1,1);
               WINDOW_3(2,0)<=WINDOW_3(1,2);
               WINDOW_3(2,1)<=WINDOW_3(1,2);
               WINDOW_3(2,2)<=WINDOW_3(2,1);


               WINDOW_4(0,0)<=DIN_4_5;
               WINDOW_4(0,1)<=WINDOW_4(0,0);
               WINDOW_4(0,2)<=WINDOW_4(0,1);
               WINDOW_4(1,0)<=WINDOW_4(0,2);
               WINDOW_4(1,1)<=WINDOW_4(1,0);
               WINDOW_4(1,2)<=WINDOW_4(1,1);
               WINDOW_4(2,0)<=WINDOW_4(1,2);
               WINDOW_4(2,1)<=WINDOW_4(1,2);
               WINDOW_4(2,2)<=WINDOW_4(2,1);


               WINDOW_5(0,0)<=DIN_5_5;
               WINDOW_5(0,1)<=WINDOW_5(0,0);
               WINDOW_5(0,2)<=WINDOW_5(0,1);
               WINDOW_5(1,0)<=WINDOW_5(0,2);
               WINDOW_5(1,1)<=WINDOW_5(1,0);
               WINDOW_5(1,2)<=WINDOW_5(1,1);
               WINDOW_5(2,0)<=WINDOW_5(1,2);
               WINDOW_5(2,1)<=WINDOW_5(1,2);
               WINDOW_5(2,2)<=WINDOW_5(2,1);

                if PIXEL_COUNT=(PF_X2_SIZE-1) then
                Enable_ONEHOT<='1';
                else
                PIXEL_COUNT<=PIXEL_COUNT+1;
                end if;

      -------------------------------------------- Enable ONE_HOT START --------------------------------------------				
	
		if Enable_ONEHOT='1' then


               DOUT_BUF_1_5<=std_logic_vector(signed(WINDOW_1(2,2)));
               DOUT_BUF_2_5<=std_logic_vector(signed(WINDOW_1(2,1)));
               DOUT_BUF_3_5<=std_logic_vector(signed(WINDOW_1(2,0)));
               DOUT_BUF_4_5<=std_logic_vector(signed(WINDOW_1(1,2)));
               DOUT_BUF_5_5<=std_logic_vector(signed(WINDOW_1(1,1)));
               DOUT_BUF_6_5<=std_logic_vector(signed(WINDOW_1(1,0)));
               DOUT_BUF_7_5<=std_logic_vector(signed(WINDOW_1(0,2)));
               DOUT_BUF_8_5<=std_logic_vector(signed(WINDOW_1(0,1)));
               DOUT_BUF_9_5<=std_logic_vector(signed(WINDOW_1(0,0)));

               DOUT_BUF_10_5<=std_logic_vector(signed(WINDOW_2(2,2)));
               DOUT_BUF_11_5<=std_logic_vector(signed(WINDOW_2(2,1)));
               DOUT_BUF_12_5<=std_logic_vector(signed(WINDOW_2(2,0)));
               DOUT_BUF_13_5<=std_logic_vector(signed(WINDOW_2(1,2)));
               DOUT_BUF_14_5<=std_logic_vector(signed(WINDOW_2(1,1)));
               DOUT_BUF_15_5<=std_logic_vector(signed(WINDOW_2(1,0)));
               DOUT_BUF_16_5<=std_logic_vector(signed(WINDOW_2(0,2)));
               DOUT_BUF_17_5<=std_logic_vector(signed(WINDOW_2(0,1)));
               DOUT_BUF_18_5<=std_logic_vector(signed(WINDOW_2(0,0)));

               DOUT_BUF_19_5<=std_logic_vector(signed(WINDOW_3(2,2)));
               DOUT_BUF_20_5<=std_logic_vector(signed(WINDOW_3(2,1)));
               DOUT_BUF_21_5<=std_logic_vector(signed(WINDOW_3(2,0)));
               DOUT_BUF_22_5<=std_logic_vector(signed(WINDOW_3(1,2)));
               DOUT_BUF_23_5<=std_logic_vector(signed(WINDOW_3(1,1)));
               DOUT_BUF_24_5<=std_logic_vector(signed(WINDOW_3(1,0)));
               DOUT_BUF_25_5<=std_logic_vector(signed(WINDOW_3(0,2)));
               DOUT_BUF_26_5<=std_logic_vector(signed(WINDOW_3(0,1)));
               DOUT_BUF_27_5<=std_logic_vector(signed(WINDOW_3(0,0)));

               DOUT_BUF_28_5<=std_logic_vector(signed(WINDOW_4(2,2)));
               DOUT_BUF_29_5<=std_logic_vector(signed(WINDOW_4(2,1)));
               DOUT_BUF_30_5<=std_logic_vector(signed(WINDOW_4(2,0)));
               DOUT_BUF_31_5<=std_logic_vector(signed(WINDOW_4(1,2)));
               DOUT_BUF_32_5<=std_logic_vector(signed(WINDOW_4(1,1)));
               DOUT_BUF_33_5<=std_logic_vector(signed(WINDOW_4(1,0)));
               DOUT_BUF_34_5<=std_logic_vector(signed(WINDOW_4(0,2)));
               DOUT_BUF_35_5<=std_logic_vector(signed(WINDOW_4(0,1)));
               DOUT_BUF_36_5<=std_logic_vector(signed(WINDOW_4(0,0)));

               DOUT_BUF_37_5<=std_logic_vector(signed(WINDOW_5(2,2)));
               DOUT_BUF_38_5<=std_logic_vector(signed(WINDOW_5(2,1)));
               DOUT_BUF_39_5<=std_logic_vector(signed(WINDOW_5(2,0)));
               DOUT_BUF_40_5<=std_logic_vector(signed(WINDOW_5(1,2)));
               DOUT_BUF_41_5<=std_logic_vector(signed(WINDOW_5(1,1)));
               DOUT_BUF_42_5<=std_logic_vector(signed(WINDOW_5(1,0)));
               DOUT_BUF_43_5<=std_logic_vector(signed(WINDOW_5(0,2)));
               DOUT_BUF_44_5<=std_logic_vector(signed(WINDOW_5(0,1)));
               DOUT_BUF_45_5<=std_logic_vector(signed(WINDOW_5(0,0)));


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

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

