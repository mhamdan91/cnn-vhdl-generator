------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Fri May 08 19:51:38 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    Flatten - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Number of Total Operaiton: 4
-- Number of Clock Cycles: 5
-- Number of GOPS = 0.0
-- Number of Clock Cycles till FC1: 14
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity Flatten_LAYER_3 is

GENERIC
 	( 
	constant PRECISION      : positive := 5; 	
	constant DOUT_WIDTH     : positive := 5; 	
	constant BIAS_SIZE      : positive := 5;	
	constant PF_X2_SIZE     : positive := 4;
	constant MULT_SIZE      : positive := 10;	
	constant DIN_WIDTH      : positive := 5;	
	constant IMAGE_WIDTH    : positive := 2;	
	constant IMAGE_SIZE     : positive := 25;	
	constant F_SIZE         : positive := 2;	
	constant WEIGHT_SIZE    : positive := 5;	
	constant BIASES_SIZE	: positive := 2;
	constant PADDING        : positive := 1;	
	constant STRIDE         : positive := 1;	
	constant FEATURE_MAPS   : positive := 1;	
	constant VALID_CYCLES   : positive := 4;	
	constant STRIDE_CYCLES  : positive := 1;	
	constant VALID_LOCAL_PIX: positive := 2;	
	constant ADD_TREE_DEPTH : positive := 2;	
	constant INPUT_DEPTH    : positive := 1;
	constant FIFO_DEPTH     : positive := 1;	
	constant MULT_SUM_D_1   : positive := 1;
	constant MULT_SUM_SIZE_1: positive := 6;
	constant ADD_1        : positive := 2;    	
	constant ADD_SIZE_1   : positive := 6;   	
	constant ADD_2        : positive := 1;    	
	constant ADD_SIZE_2   : positive := 6;   	
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN_1_3         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	CLK,RST         :IN std_logic;
   	DIS_STREAM      :OUT std_logic; 					-- S_AXIS_TVALID  : Data in is valid
   	EN_STREAM       :IN std_logic; 						-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_3     :OUT std_logic; 				-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_3         :OUT std_logic;                             -- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_3 :IN std_logic;
	DOUT_1_3            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_3            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST        :OUT std_logic
	);	

end Flatten_LAYER_3;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of Flatten_LAYER_3 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(WEIGHT_SIZE - 1 downto 0);
type       FIFO_Memory             is array (0 to FIFO_DEPTH - 1)          of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
type       SLIDING_WINDOW          is array (0 to F_SIZE-1, 0 to F_SIZE-1) of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
signal     VALID_NXTLYR_PIX        :integer range 0 to STRIDE_CYCLES;
signal     PIXEL_COUNT             :integer range 0 to VALID_CYCLES;
signal     OUT_PIXEL_COUNT         :integer range 0 to VALID_CYCLES;
signal     EN_NXT_LYR_3            :std_logic;
signal     FRST_TIM_EN_3           :std_logic;
signal     Enable_ONEHOT             :std_logic;
signal     SIG_STRIDE              :integer range 0 to IMAGE_SIZE;
signal     PADDING_count           :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     ROW_COUNT               :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     WINDOW_1:SLIDING_WINDOW; 


------------------------------ INTERNAL DYNAMIC SIGNALS DECLARATION ARRAY TYPE- START---------------------------------------------

signal DOUT_BUF_1_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_2_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_3_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_4_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);


-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_4          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_2_4          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal EN_STREAM_OUT_4	 : std_logic;
signal VALID_OUT_4       : std_logic;

---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT FC_LAYER_4
    port(	CLK,RST			:IN std_logic;
		DIN_1_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_2_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_3_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_4_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		EN_STREAM_OUT_4	:OUT std_logic;
		VALID_OUT_4		:OUT std_logic;
		DOUT_1_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_2_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		EN_STREAM		:IN std_logic;
		EN_LOC_STREAM_4	:IN std_logic
      			);
END COMPONENT FC_LAYER_4;

begin

FC_LYR_4 : FC_LAYER_4 
          port map(
          CLK                 => CLK,
          RST                 => RST,
          DIN_1_4             => DOUT_BUF_1_3,
          DIN_2_4             => DOUT_BUF_2_3,
          DIN_3_4             => DOUT_BUF_3_3,
          DIN_4_4             => DOUT_BUF_4_3,
          DOUT_1_4            => DOUT_1_4,
          DOUT_2_4            => DOUT_2_4,
          VALID_OUT_4         => VALID_OUT_4,
          EN_STREAM_OUT_4     => EN_STREAM_OUT_4,
          EN_LOC_STREAM_4     => EN_NXT_LYR_3,
          EN_STREAM           => EN_STREAM
                );

----------------------------------------------- MAP NEXT LAYER - COMPONENTS END----------------------------------------------------



-------------------------------------------------------- ARCHITECTURE BEGIN--------------------------------------------------------

LAYER_3: process(CLK)


begin
------------------------------------------------ RESET AND PROCESS TOP START ------------------------------------------------------
if rising_edge(CLK) then
  if RST = '1' then
	-------------------FIXED SIGNALS RESET------------------------
    PIXEL_COUNT<=0;VALID_NXTLYR_PIX<=0;OUT_PIXEL_COUNT<=0;
    EN_NXT_LYR_3<='0';FRST_TIM_EN_3<='0';
    Enable_ONEHOT<='0';
    INTERNAL_RST<='0';PADDING_count<=0;ROW_COUNT<=0;SIG_STRIDE<=STRIDE;

-------------------DYNAMIC SIGNALS RESET------------------------
    WINDOW_1<=((others=> (others=> (others=>'0'))));


    DOUT_BUF_1_3<=(others => '0');
    DOUT_BUF_2_3<=(others => '0');
    DOUT_BUF_3_3<=(others => '0');
    DOUT_BUF_4_3<=(others => '0');

------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_3='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_3='1' then EN_NXT_LYR_3<='1';end if;


               WINDOW_1(0,0)<=DIN_1_3;
               WINDOW_1(0,1)<=WINDOW_1(0,0);
               WINDOW_1(1,0)<=WINDOW_1(0,1);
               WINDOW_1(1,1)<=WINDOW_1(1,0);

                if PIXEL_COUNT=(PF_X2_SIZE-1) then
                Enable_ONEHOT<='1';
                else
                PIXEL_COUNT<=PIXEL_COUNT+1;
                end if;

      -------------------------------------------- Enable ONE_HOT START --------------------------------------------				
	
		if Enable_ONEHOT='1' then


               DOUT_BUF_1_3<=std_logic_vector(signed(WINDOW_1(1,1)));
               DOUT_BUF_2_3<=std_logic_vector(signed(WINDOW_1(1,0)));
               DOUT_BUF_3_3<=std_logic_vector(signed(WINDOW_1(0,1)));
               DOUT_BUF_4_3<=std_logic_vector(signed(WINDOW_1(0,0)));


		------------------------- Enable ONE_HOT END -----------------------

		------------------------------------STAGE-PIXEL--------------------------------------
		if SIG_STRIDE>1 then
                 SIG_STRIDE<=SIG_STRIDE-1;
        elsif VALID_NXTLYR_PIX<(IMAGE_WIDTH-F_SIZE) then
                   SIG_STRIDE<=STRIDE; end if;

		if SIG_STRIDE>(STRIDE-1) and VALID_NXTLYR_PIX<=(IMAGE_WIDTH-F_SIZE) then          --VALID_NXTLYR_PIX<IMAGE_WIDTH and  VALID_LOCAL_PIX

			EN_NXT_LYR_3<='1';FRST_TIM_EN_3<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
               EN_NXT_LYR_3<='0';
		end if; -- VALIDPIXELS

		if VALID_NXTLYR_PIX=((IMAGE_WIDTH*STRIDE)-1) then VALID_NXTLYR_PIX<=0;SIG_STRIDE<=STRIDE;   -- reset sride and valid pixels
		else VALID_NXTLYR_PIX<=VALID_NXTLYR_PIX+1;end if; 

	end if;  --Enable ONEHOT 

 elsif OUT_PIXEL_COUNT>=VALID_CYCLES  then INTERNAL_RST<='1';SIG_STRIDE<=STRIDE;EN_NXT_LYR_3<='1';  -- order is very important
else  EN_NXT_LYR_3<='0';-- In case stream stopped

end if; -- end enable 
end if; -- for RST	
end if; -- rising edge
end process LAYER_3;

EN_STREAM_OUT_3<= EN_STREAM_OUT_4;
VALID_OUT_3<= VALID_OUT_4;
DOUT_1_3<=DOUT_1_4;
DOUT_2_3<=DOUT_2_4;

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

