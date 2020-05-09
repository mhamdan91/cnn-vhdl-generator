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
-- Number of Total Operaiton: 20
-- Number of Clock Cycles: 35
-- Number of GOPS = 0.0
-------------------------------------------------Total Number of Operations for the Entire Model:5
-- Target Devices: Zynq-XC7Z020
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity FC_LAYER_7 is

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
	constant FEATURE_MAPS   : positive := 5;
	constant VALID_CYCLES   : positive := 9;
	constant VALID_LOCAL_PIX: positive := 3;
	constant ADD_TREE_DEPTH : positive := 1;
	constant INPUT_DEPTH    : positive := 2;
	constant INNER_PXL_SUM  : positive := 1;
	constant SUM_PEXILS     : positive := 14;
	constant MULT_SUM_D_1   : positive := 2;
	constant MULT_SUM_SIZE_1: positive := 6;
	constant MULT_SUM_D_2   : positive := 1;
	constant MULT_SUM_SIZE_2: positive := 6;
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN_1_7         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_2_7         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_3_7         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_4_7         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	CLK,RST         :IN std_logic;
   	DIS_STREAM      :OUT std_logic; 				-- S_AXIS_TVALID  : Data in is valid
   	EN_STREAM       :IN std_logic; 					-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_7 :OUT std_logic; 			-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_7     :OUT std_logic;                         -- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_7 :IN std_logic;
	DOUT_1_7        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_7        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST    :OUT std_logic
	);	

end FC_LAYER_7;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of FC_LAYER_7 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to PF_X2_SIZE-1) of signed(WEIGHT_SIZE- 1 downto 0);
signal     VALID_NXTLYR_PIX        :integer range 0 to VALID_CYCLES;
signal     PIXEL_COUNT             :integer range 0 to VALID_CYCLES;
signal     OUT_PIXEL_COUNT         :integer range 0 to VALID_CYCLES;
signal     EN_NXT_LYR_7            :std_logic;
signal     FRST_TIM_EN_7           :std_logic;
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
signal DOUT_BUF_1_7	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_1		: signed(PRECISION-1 downto 0);
signal ReLU_1		: signed(PRECISION-1 downto 0);
signal DOUT_BUF_2_7	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_2		: signed(PRECISION-1 downto 0);
signal ReLU_2		: signed(PRECISION-1 downto 0);
signal DOUT_BUF_3_7	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_3		: signed(PRECISION-1 downto 0);
signal ReLU_3		: signed(PRECISION-1 downto 0);
signal DOUT_BUF_4_7	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_4		: signed(PRECISION-1 downto 0);
signal ReLU_4		: signed(PRECISION-1 downto 0);
signal DOUT_BUF_5_7	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_5		: signed(PRECISION-1 downto 0);
signal ReLU_5		: signed(PRECISION-1 downto 0);


------------------------------------------------------ MULT SUMMATION DECLARATION-----------------------------------------------------------
signal SUM_PIXELS_1: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_2: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_3: signed(PRECISION-1 downto 0);
signal SUM_PIXELS_4: signed(PRECISION-1 downto 0);
type    MULT_X_SUM_1	is array (0 to FEATURE_MAPS-1) of signed(PRECISION-1 downto 0);
signal  EN_SUM_MULT_1	: std_logic;
signal  MULTS_1_1:MULT_X_SUM_1;
signal  MULTS_1_2:MULT_X_SUM_1;
signal  MULTS_1_3:MULT_X_SUM_1;
signal  MULTS_1_4:MULT_X_SUM_1;
type    MULT_X_SUM_2	is array (0 to FEATURE_MAPS-1) of signed(PRECISION-1 downto 0);
signal  EN_SUM_MULT_2	: std_logic;
signal  MULTS_2_1:MULT_X_SUM_2;
signal  MULTS_2_2:MULT_X_SUM_2;
signal  MULTS_2_3:MULT_X_SUM_2;
signal  MULTS_2_4:MULT_X_SUM_2;



--------------------------------------------- FILTER HARDCODED CONSTANTS -WEIGHTS START--------------------------------

constant FMAP_1_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_1_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_2_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_3_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_4_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_5_1: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_5_2: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_5_3: signed(WEIGHT_SIZE- 1 downto 0):= "00001";
constant FMAP_5_4: signed(WEIGHT_SIZE- 1 downto 0):= "00001";

constant BIAS_VAL_1: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_2: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_3: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_4: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_5: signed (BIASES_SIZE-1 downto 0):="01";


BEGIN
-------------------------------------------------------- ARCHITECTURE BEGIN--------------------------------------------------------

LAYER_7: process(CLK)


begin
------------------------------------------------ RESET AND PROCESS TOP START ------------------------------------------------------
if rising_edge(CLK) then
  if RST = '1' then
	-------------------FIXED SIGNALS RESET------------------------
    PIXEL_COUNT<=0;VALID_NXTLYR_PIX<=0;OUT_PIXEL_COUNT<=0;
    EN_NXT_LYR_7<='0';FRST_TIM_EN_7<='0';INTERNAL_RST<='0';
    Enable_MULT<='0';Enable_ADDER<='0';Enable_ReLU<='0';Enable_BIAS<='0';
    PADDING_count<=0;ROW_COUNT<=0;SIG_STRIDE<=STRIDE;COUNT_PIX<=0;

-------------------DYNAMIC SIGNALS RESET------------------------
    DOUT_BUF_1_7<=(others => '0');BIAS_1<=(others => '0');ReLU_1<=(others => '0');
    DOUT_BUF_2_7<=(others => '0');BIAS_2<=(others => '0');ReLU_2<=(others => '0');
    DOUT_BUF_3_7<=(others => '0');BIAS_3<=(others => '0');ReLU_3<=(others => '0');
    DOUT_BUF_4_7<=(others => '0');BIAS_4<=(others => '0');ReLU_4<=(others => '0');
    DOUT_BUF_5_7<=(others => '0');BIAS_5<=(others => '0');ReLU_5<=(others => '0');

    SUM_PIXELS_1<=(others=>'0');MULT_1<=((others=> (others=>'0')));
    SUM_PIXELS_2<=(others=>'0');MULT_2<=((others=> (others=>'0')));
    SUM_PIXELS_3<=(others=>'0');MULT_3<=((others=> (others=>'0')));
    SUM_PIXELS_4<=(others=>'0');MULT_4<=((others=> (others=>'0')));

    EN_SUM_MULT_1<='0';
    MULTS_1_1<=((others=> (others=>'0')));
    MULTS_1_2<=((others=> (others=>'0')));
    MULTS_1_3<=((others=> (others=>'0')));
    MULTS_1_4<=((others=> (others=>'0')));
    EN_SUM_MULT_2<='0';
    MULTS_2_1<=((others=> (others=>'0')));
    MULTS_2_2<=((others=> (others=>'0')));
    MULTS_2_3<=((others=> (others=>'0')));
    MULTS_2_4<=((others=> (others=>'0')));

------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_7='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_7='1' then EN_NXT_LYR_7<='1';end if;

			MULT_1(0)<=signed(DIN_1_7)*signed(FMAP_1_1);
			MULT_2(0)<=signed(DIN_2_7)*signed(FMAP_1_2);
			MULT_3(0)<=signed(DIN_3_7)*signed(FMAP_1_3);
			MULT_4(0)<=signed(DIN_4_7)*signed(FMAP_1_4);

			MULT_1(1)<=signed(DIN_1_7)*signed(FMAP_2_1);
			MULT_2(1)<=signed(DIN_2_7)*signed(FMAP_2_2);
			MULT_3(1)<=signed(DIN_3_7)*signed(FMAP_2_3);
			MULT_4(1)<=signed(DIN_4_7)*signed(FMAP_2_4);

			MULT_1(2)<=signed(DIN_1_7)*signed(FMAP_3_1);
			MULT_2(2)<=signed(DIN_2_7)*signed(FMAP_3_2);
			MULT_3(2)<=signed(DIN_3_7)*signed(FMAP_3_3);
			MULT_4(2)<=signed(DIN_4_7)*signed(FMAP_3_4);

			MULT_1(3)<=signed(DIN_1_7)*signed(FMAP_4_1);
			MULT_2(3)<=signed(DIN_2_7)*signed(FMAP_4_2);
			MULT_3(3)<=signed(DIN_3_7)*signed(FMAP_4_3);
			MULT_4(3)<=signed(DIN_4_7)*signed(FMAP_4_4);

			MULT_1(4)<=signed(DIN_1_7)*signed(FMAP_5_1);
			MULT_2(4)<=signed(DIN_2_7)*signed(FMAP_5_2);
			MULT_3(4)<=signed(DIN_3_7)*signed(FMAP_5_3);
			MULT_4(4)<=signed(DIN_4_7)*signed(FMAP_5_4);


                        EN_SUM_MULT_1<='1';

      -------------------------------------------- Enable MULT START --------------------------------------------				


		if EN_SUM_MULT_1 = '1' then
			------------------------------------STAGE-1--------------------------------------
			MULTS_1_1(0)<=signed(MULT_1(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_2(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_1(1)<=signed(MULT_1(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_2(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_1(2)<=signed(MULT_1(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_2(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_1(3)<=signed(MULT_1(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_2(3)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_1(4)<=signed(MULT_1(4)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_2(4)(MULT_SIZE-1-WHOLE downto DECIMAL));

			MULTS_1_2(0)<=signed(MULT_3(0)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_4(0)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_2(1)<=signed(MULT_3(1)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_4(1)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_2(2)<=signed(MULT_3(2)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_4(2)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_2(3)<=signed(MULT_3(3)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_4(3)(MULT_SIZE-1-WHOLE downto DECIMAL));
			MULTS_1_2(4)<=signed(MULT_3(4)(MULT_SIZE-1-WHOLE downto DECIMAL))+signed(MULT_4(4)(MULT_SIZE-1-WHOLE downto DECIMAL));



                     EN_SUM_MULT_2<='1';
		end if;


		------------------------- Enable NEXT STATGE MULTS START -----------------------

		if EN_SUM_MULT_2 = '1' then
			------------------------------------STAGE-2--------------------------------------
			MULTS_2_1(0)<=signed(MULTS_1_1(0)(PRECISION-1 downto 0))+signed(MULTS_1_2(0)(PRECISION-1 downto 0));
			MULTS_2_1(1)<=signed(MULTS_1_1(1)(PRECISION-1 downto 0))+signed(MULTS_1_2(1)(PRECISION-1 downto 0));
			MULTS_2_1(2)<=signed(MULTS_1_1(2)(PRECISION-1 downto 0))+signed(MULTS_1_2(2)(PRECISION-1 downto 0));
			MULTS_2_1(3)<=signed(MULTS_1_1(3)(PRECISION-1 downto 0))+signed(MULTS_1_2(3)(PRECISION-1 downto 0));
			MULTS_2_1(4)<=signed(MULTS_1_1(4)(PRECISION-1 downto 0))+signed(MULTS_1_2(4)(PRECISION-1 downto 0));



                        Enable_BIAS<='1';
		end if;


		------------------------------------STAGE-BIAS--------------------------------------
		if Enable_BIAS = '1' then

			BIAS_1<=(signed(BIAS_VAL_1)+ signed(MULTS_2_1(0)(PRECISION-1 downto 0)));
			BIAS_2<=(signed(BIAS_VAL_2)+ signed(MULTS_2_1(1)(PRECISION-1 downto 0)));
			BIAS_3<=(signed(BIAS_VAL_3)+ signed(MULTS_2_1(2)(PRECISION-1 downto 0)));
			BIAS_4<=(signed(BIAS_VAL_4)+ signed(MULTS_2_1(3)(PRECISION-1 downto 0)));
			BIAS_5<=(signed(BIAS_VAL_5)+ signed(MULTS_2_1(4)(PRECISION-1 downto 0)));

			Enable_ReLU<='1';
			
		end if;

		if SIG_STRIDE>1 and Enable_ReLU='1' then
                 SIG_STRIDE<=SIG_STRIDE-1; end if;

	if  Enable_ReLU='1' then
		if VALID_NXTLYR_PIX<VALID_LOCAL_PIX and SIG_STRIDE>(STRIDE-1) then

			if BIAS_1>0 then
			ReLU_1<=BIAS_1;
			DOUT_BUF_1_7<=std_logic_vector(BIAS_1);
			else
			ReLU_1<= (others => '0');
			DOUT_BUF_1_7<=(others => '0');
			end if;
			if BIAS_2>0 then
			ReLU_2<=BIAS_2;
			DOUT_BUF_2_7<=std_logic_vector(BIAS_2);
			else
			ReLU_2<= (others => '0');
			DOUT_BUF_2_7<=(others => '0');
			end if;
			if BIAS_3>0 then
			ReLU_3<=BIAS_3;
			DOUT_BUF_3_7<=std_logic_vector(BIAS_3);
			else
			ReLU_3<= (others => '0');
			DOUT_BUF_3_7<=(others => '0');
			end if;
			if BIAS_4>0 then
			ReLU_4<=BIAS_4;
			DOUT_BUF_4_7<=std_logic_vector(BIAS_4);
			else
			ReLU_4<= (others => '0');
			DOUT_BUF_4_7<=(others => '0');
			end if;
			if BIAS_5>0 then
			ReLU_5<=BIAS_5;
			DOUT_BUF_5_7<=std_logic_vector(BIAS_5);
			else
			ReLU_5<= (others => '0');
			DOUT_BUF_5_7<=(others => '0');
			end if;

			EN_NXT_LYR_7<='1';FRST_TIM_EN_7<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
                       EN_NXT_LYR_7<='0';
                       DOUT_BUF_1_7<=(others => '0');
                       DOUT_BUF_2_7<=(others => '0');
                       DOUT_BUF_3_7<=(others => '0');
                       DOUT_BUF_4_7<=(others => '0');
                       DOUT_BUF_5_7<=(others => '0');

		end if; -- VALIDPIXELS

		if VALID_NXTLYR_PIX=((VALID_LOCAL_PIX*STRIDE)-1) then VALID_NXTLYR_PIX<=0;SIG_STRIDE<=STRIDE;   -- reset sride and valid pixels
		else VALID_NXTLYR_PIX<=VALID_NXTLYR_PIX+1;end if; 

	end if;  --ReLU
elsif OUT_PIXEL_COUNT>=VALID_CYCLES  then INTERNAL_RST<='1';SIG_STRIDE<=STRIDE;EN_NXT_LYR_7<='1';  -- order is very important
else  EN_NXT_LYR_7<='0';-- In case stream stopped

end if; -- end enable 
end if; -- for RST	
end if; -- rising edge
end process LAYER_7;

DOUT_1_7<=DOUT_BUF_1_7;
DOUT_2_7<=DOUT_BUF_2_7;

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

