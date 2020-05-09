------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Fri May 08 19:51:38 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    CONV - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Number of Total Operaiton: 10
-- Number of Clock Cycles: 6
-- Number of GOPS = 0.16666666666666669
-- Description: 
-- Dependencies: 
-- Revision:0.010 


--        use IEEE.NUMERIC_STD.ALL;
--        use IEEE.std_logic_1164.all;
--        use IEEE.std_logic_textio.all;
--        use IEEE.std_logic_arith.all;
--        use IEEE.numeric_bit.all;
--        use IEEE.numeric_std.all;
--        use IEEE.std_logic_signed.all;
--        use IEEE.std_logic_unsigned.all;
--        use IEEE.math_real.all;
--        use IEEE.math_complex.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;


entity CONV_LAYER_1 is

GENERIC
 	( 
	constant PRECISION      : positive := 5; 	
	constant WHOLE          : positive := 2; 	
	constant DECIMAL        : positive := 3; 	
	constant PAD            : positive := 4; 	
	constant DOUT_WIDTH     : positive := 5; 	
	constant BIAS_SIZE      : positive := 5;	
	constant MULT_SIZE      : positive := 13;	
	constant MULT_SUM_SIZE  : positive := 6;	
	constant DIN_WIDTH      : positive := 8;	
	constant BASE_DIN_WIDTH : positive := 8;	
	constant IMAGE_WIDTH    : positive := 5;	
	constant IMAGE_SIZE     : positive := 25;	
	constant F_SIZE         : positive := 2;	
	constant WEIGHT_SIZE    : positive := 5;	
	constant BIASES_SIZE	: positive := 2;
	constant PADDING        : positive := 1;	
	constant STRIDE         : positive := 1;	
	constant FEATURE_MAPS   : positive := 1;	
	constant VALID_CYCLES   : positive := 16;	
	constant STRIDE_CYCLES  : positive := 4;	
	constant VALID_LOCAL_PIX: positive := 4;	
	constant ADD_TREE_DEPTH : positive := 2;	
	constant INPUT_DEPTH    : positive := 1;
	constant FIFO_DEPTH     : positive := 4;	
	constant USED_FIFOS     : positive := 1;	
	constant ADD_1          : positive := 2;    	
	constant ADD_2          : positive := 1;    	
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN                 :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	CLK,RST             :IN std_logic;
	DIS_STREAM          :OUT std_logic; 					-- S_AXIS_TVALID  : Data in is valid
	EN_STREAM           :IN std_logic; 					-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_1     :OUT std_logic; 				-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_1         :OUT std_logic;  				-- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_1     :IN std_logic;
	DOUT_1_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST        :OUT std_logic
	);	

end CONV_LAYER_1;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of CONV_LAYER_1 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(WEIGHT_SIZE- 1 downto 0);
type       FIFO_Memory             is array (0 to FIFO_DEPTH - 1)          of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
type       SLIDING_WINDOW          is array (0 to F_SIZE-1, 0 to F_SIZE-1) of STD_LOGIC_VECTOR(DIN_WIDTH- 1 downto 0);
signal     VALID_NXTLYR_PIX        :integer range 0 to STRIDE_CYCLES;
signal     PIXEL_COUNT             :integer range 0 to VALID_CYCLES;
signal     OUT_PIXEL_COUNT         :integer range 0 to VALID_CYCLES;
signal     EN_NXT_LYR_1            :std_logic;
signal     FRST_TIM_EN_1           :std_logic;
signal     Enable_MULT             :std_logic;
signal     Enable_ADDER            :std_logic;
signal     Enable_ReLU             :std_logic;
signal     Enable_BIAS             :std_logic;
signal     SIG_STRIDE              :integer range 0 to IMAGE_SIZE;
signal     PADDING_count           :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     ROW_COUNT               :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     WINDOW:SLIDING_WINDOW; 


------------------------------ INTERNAL DYNAMIC SIGNALS DECLARATION ARRAY TYPE- START---------------------------------------------

type    AADD_DEPTH_1	is array (0 to ADD_1-1, 0 to FEATURE_MAPS-1 ) of signed(PRECISION-1 downto 0);
signal  ADD_DEPTH_1:AADD_DEPTH_1;
signal  Enable_STAGE_1	: std_logic;
type    AADD_DEPTH_2	is array (0 to ADD_2-1, 0 to FEATURE_MAPS-1 ) of signed(PRECISION-1 downto 0);
signal  ADD_DEPTH_2:AADD_DEPTH_2;
signal  Enable_STAGE_2	: std_logic;

type   MULT_X		is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(MULT_SIZE-1 downto 0);  --- mult_size-1 cuz the operation takes 1bit sign extend
signal MULT_1:MULT_X;
signal DOUT_BUF_1_1	: std_logic_vector(PRECISION-1 downto 0);
signal BIAS_1		: signed(PRECISION-1   downto 0);
signal ReLU_1		: signed(PRECISION-1   downto 0);


------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1  	: FIFO_Memory;
signal HEAD_1       : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1       : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1	: std_logic;
signal ReadEn_1 	: std_logic;
signal Async_Mode_1 : boolean;


-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_2_2          : std_logic_vector(PRECISION-1 downto 0);
signal EN_STREAM_OUT_2	 : std_logic;
signal VALID_OUT_2       : std_logic;

--------------------------------------------- FILTER HARDCODED CONSTANTS -WEIGHTS START--------------------------------

constant FMAP_1: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );


constant BIAS_VAL_1: signed (BIASES_SIZE-1 downto 0):="01";


---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT POOL_LAYER_2
    port(	CLK,RST			:IN std_logic;
		DIN_1_2		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		EN_STREAM_OUT_2	:OUT std_logic;
		VALID_OUT_2		:OUT std_logic;
		DOUT_1_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_2_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		EN_STREAM		:IN std_logic;
		EN_LOC_STREAM_2	:IN std_logic
      			);
END COMPONENT POOL_LAYER_2;

begin

POOL_LYR_2 : POOL_LAYER_2 
          port map(
          CLK                 => CLK,
          RST                 => RST,
          DIN_1_2             => DOUT_BUF_1_1,
          DOUT_1_2            => DOUT_1_2,
          DOUT_2_2            => DOUT_2_2,
          VALID_OUT_2         => VALID_OUT_2,
          EN_STREAM_OUT_2     => EN_STREAM_OUT_2,
          EN_LOC_STREAM_2     => EN_NXT_LYR_1,
          EN_STREAM           => EN_STREAM
                );

----------------------------------------------- MAP NEXT LAYER - COMPONENTS END----------------------------------------------------



-------------------------------------------------------- ARCHITECTURE BEGIN--------------------------------------------------------

LAYER_1: process(CLK)


begin
------------------------------------------------ RESET AND PROCESS TOP START ------------------------------------------------------
if rising_edge(CLK) then
  if RST = '1' then
	-------------------FIXED SIGNALS RESET------------------------
    PIXEL_COUNT<=0;VALID_NXTLYR_PIX<=0;OUT_PIXEL_COUNT<=0;
    EN_NXT_LYR_1<='0';FRST_TIM_EN_1<='0';
    Enable_MULT<='0';Enable_ADDER<='0';Enable_ReLU<='0';Enable_BIAS<='0';
    INTERNAL_RST<='0';PADDING_count<=0;ROW_COUNT<=0;SIG_STRIDE<=STRIDE;

-------------------DYNAMIC SIGNALS RESET------------------------
    WINDOW<=((others=> (others=> (others=>'0'))));

    ADD_DEPTH_1<=((others=> (others=> (others=>'0'))));Enable_STAGE_1<='0';
    ADD_DEPTH_2<=((others=> (others=> (others=>'0'))));Enable_STAGE_2<='0';

    MULT_1<=((others=> (others=> (others=>'0'))));    DOUT_BUF_1_1<=(others => '0');BIAS_1<=(others => '0');ReLU_1<=(others => '0');

----------------- FIFO_1 RESET---------------
    FIFO_ROW_1<= ((others=> (others=>'0')));HEAD_1<=0;
    WriteEn_1<= '0';ReadEn_1<= '0';Async_Mode_1<= false;



------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_1='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_1='1' then EN_NXT_LYR_1<='1';end if;


               WINDOW(0,0)<=DIN;
               WINDOW(0,1)<=WINDOW(0,0);

               WINDOW(1,1)<=WINDOW(1,0);


                if PIXEL_COUNT=(F_SIZE-1) then
                WriteEn_1 <= '1';
                else
                PIXEL_COUNT<=PIXEL_COUNT+1;
                end if;

           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1 = '1') then 
				 	  WINDOW(1,0) <= FIFO_ROW_1(TAIL_1);
				if(TAIL_1 = FIFO_DEPTH-1) then
				   	TAIL_1<=0;  -- Rest Tail
				elsif (TAIL_1 = F_SIZE-1) then Enable_MULT<='1'; TAIL_1<=TAIL_1+1;
				else
				  	 TAIL_1<=TAIL_1+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1 = '1') then
					FIFO_ROW_1(HEAD_1)<= WINDOW(0,1);
				if (HEAD_1 = FIFO_DEPTH - 2 and Async_Mode_1 = false) then				 
					ReadEn_1<='1';
					HEAD_1 <= HEAD_1 + 1;
					Async_Mode_1<= true;
				else if (HEAD_1 = FIFO_DEPTH -1) then
					HEAD_1<=0;  -- Rest Head
				else
					HEAD_1 <= HEAD_1 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	      -------------------------------------------- Enable MULT START --------------------------------------------				
	
		if Enable_MULT='1' then
			------------------------ NAME OF MULT CORROSPONDS TO WEIGHT INDEX------------------------
			MULT_1(0,0)<=signed(WINDOW(1,1)) * signed(FMAP_1(0,0));

			MULT_1(0,1)<=signed(WINDOW(1,0)) * signed(FMAP_1(0,1));

			MULT_1(1,0)<=signed(WINDOW(0,1)) * signed(FMAP_1(1,0));

			MULT_1(1,1)<=signed(WINDOW(0,0)) * signed(FMAP_1(1,1));


			Enable_STAGE_1<='1';	
		end if;

		------------------------- Enable ADDER-TREE START -----------------------
		if Enable_STAGE_1 = '1' then
			------------------------------------STAGE-1--------------------------------------

			ADD_DEPTH_1(0,0)<=signed(MULT_1(0,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(1,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));


			ADD_DEPTH_1(1,0)<=signed(MULT_1(0,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(1,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));



				Enable_STAGE_2<= '1';
			end if; 
			------------------------------------STAGE-2--------------------------------------
		if Enable_STAGE_2 = '1' then


			ADD_DEPTH_2(0,0)<=signed(ADD_DEPTH_1(0,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(1,0)(PRECISION-1 downto 0));


			Enable_BIAS<='1'; 
		end if;
		------------------------------------STAGE-BIAS--------------------------------------
		
		if Enable_BIAS = '1' then

			BIAS_1<=(signed(BIAS_VAL_1)+signed(ADD_DEPTH_2(0,0)));

			Enable_ReLU<='1';
			
		end if;

		if SIG_STRIDE>1 and Enable_ReLU='1' then
                 SIG_STRIDE<=SIG_STRIDE-1;
               elsif VALID_NXTLYR_PIX<(IMAGE_WIDTH-F_SIZE) then
		 SIG_STRIDE<=STRIDE; end if;

	if  Enable_ReLU='1' then
		if SIG_STRIDE>(STRIDE-1) and VALID_NXTLYR_PIX<=(IMAGE_WIDTH-F_SIZE) then          --VALID_NXTLYR_PIX<IMAGE_WIDTH and  VALID_LOCAL_PIX

			if BIAS_1>0 then
			ReLU_1<=BIAS_1;
			DOUT_BUF_1_1<=std_logic_vector(BIAS_1);
			else
			ReLU_1<= (others => '0');
			DOUT_BUF_1_1<=(others => '0');
			end if;

			EN_NXT_LYR_1<='1';FRST_TIM_EN_1<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
               EN_NXT_LYR_1<='0';
               DOUT_BUF_1_1<=(others => '0');

		end if; -- VALIDPIXELS

		if VALID_NXTLYR_PIX=((IMAGE_WIDTH*STRIDE)-1) then VALID_NXTLYR_PIX<=0;SIG_STRIDE<=STRIDE;   -- reset sride and valid pixels
		else VALID_NXTLYR_PIX<=VALID_NXTLYR_PIX+1;end if; 

	end if;  --ReLU

elsif OUT_PIXEL_COUNT>=VALID_CYCLES  then INTERNAL_RST<='1';SIG_STRIDE<=STRIDE;EN_NXT_LYR_1<='1';  -- order is very important
else  EN_NXT_LYR_1<='0';-- In case stream stopped

end if; -- end enable 
end if; -- for RST	
end if; -- rising edge
end process LAYER_1;

EN_STREAM_OUT_1<= EN_STREAM_OUT_2;
VALID_OUT_1<= VALID_OUT_2;
DOUT_1_1<=DOUT_1_2;
DOUT_2_1<=DOUT_2_2;

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

