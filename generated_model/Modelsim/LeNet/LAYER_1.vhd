------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Fri May 08 19:58:54 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    CONV - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Number of Total Operaiton: 312
-- Number of Clock Cycles: 9
-- Number of GOPS = 3.4666666666666663
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
	constant PRECISION      : positive := 8; 	
	constant WHOLE          : positive := 4; 	
	constant DECIMAL        : positive := 4; 	
	constant PAD            : positive := 1; 	
	constant DOUT_WIDTH     : positive := 8; 	
	constant BIAS_SIZE      : positive := 8;	
	constant MULT_SIZE      : positive := 16;	
	constant MULT_SUM_SIZE  : positive := 9;	
	constant DIN_WIDTH      : positive := 8;	
	constant BASE_DIN_WIDTH : positive := 8;	
	constant IMAGE_WIDTH    : positive := 32;	
	constant IMAGE_SIZE     : positive := 1024;	
	constant F_SIZE         : positive := 5;	
	constant WEIGHT_SIZE    : positive := 8;	
	constant BIASES_SIZE	: positive := 8;
	constant PADDING        : positive := 1;	
	constant STRIDE         : positive := 1;	
	constant FEATURE_MAPS   : positive := 6;	
	constant VALID_CYCLES   : positive := 784;	
	constant STRIDE_CYCLES  : positive := 31;	
	constant VALID_LOCAL_PIX: positive := 28;	
	constant ADD_TREE_DEPTH : positive := 5;	
	constant INPUT_DEPTH    : positive := 1;
	constant FIFO_DEPTH     : positive := 28;	
	constant USED_FIFOS     : positive := 4;	
	constant ADD_1          : positive := 13;    	
	constant ADD_2          : positive := 7;    	
	constant ADD_3          : positive := 4;    	
	constant ADD_4          : positive := 2;    	
	constant ADD_5          : positive := 1;    	
	constant LOCAL_OUTPUT   : positive := 8	
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
	DOUT_3_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_4_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_5_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_6_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_7_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_8_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_9_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_10_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
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
type    AADD_DEPTH_3	is array (0 to ADD_3-1, 0 to FEATURE_MAPS-1 ) of signed(PRECISION-1 downto 0);
signal  ADD_DEPTH_3:AADD_DEPTH_3;
signal  Enable_STAGE_3	: std_logic;
type    AADD_DEPTH_4	is array (0 to ADD_4-1, 0 to FEATURE_MAPS-1 ) of signed(PRECISION-1 downto 0);
signal  ADD_DEPTH_4:AADD_DEPTH_4;
signal  Enable_STAGE_4	: std_logic;
type    AADD_DEPTH_5	is array (0 to ADD_5-1, 0 to FEATURE_MAPS-1 ) of signed(PRECISION-1 downto 0);
signal  ADD_DEPTH_5:AADD_DEPTH_5;
signal  Enable_STAGE_5	: std_logic;

type   MULT_X		is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(MULT_SIZE-1 downto 0);  --- mult_size-1 cuz the operation takes 1bit sign extend
signal MULT_1:MULT_X;
signal DOUT_BUF_1_1	: std_logic_vector(PRECISION-1 downto 0);
signal BIAS_1		: signed(PRECISION-1   downto 0);
signal ReLU_1		: signed(PRECISION-1   downto 0);
signal MULT_2:MULT_X;
signal DOUT_BUF_2_1	: std_logic_vector(PRECISION-1 downto 0);
signal BIAS_2		: signed(PRECISION-1   downto 0);
signal ReLU_2		: signed(PRECISION-1   downto 0);
signal MULT_3:MULT_X;
signal DOUT_BUF_3_1	: std_logic_vector(PRECISION-1 downto 0);
signal BIAS_3		: signed(PRECISION-1   downto 0);
signal ReLU_3		: signed(PRECISION-1   downto 0);
signal MULT_4:MULT_X;
signal DOUT_BUF_4_1	: std_logic_vector(PRECISION-1 downto 0);
signal BIAS_4		: signed(PRECISION-1   downto 0);
signal ReLU_4		: signed(PRECISION-1   downto 0);
signal MULT_5:MULT_X;
signal DOUT_BUF_5_1	: std_logic_vector(PRECISION-1 downto 0);
signal BIAS_5		: signed(PRECISION-1   downto 0);
signal ReLU_5		: signed(PRECISION-1   downto 0);
signal MULT_6:MULT_X;
signal DOUT_BUF_6_1	: std_logic_vector(PRECISION-1 downto 0);
signal BIAS_6		: signed(PRECISION-1   downto 0);
signal ReLU_6		: signed(PRECISION-1   downto 0);


------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1  	: FIFO_Memory;
signal HEAD_1       : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1       : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1	: std_logic;
signal ReadEn_1 	: std_logic;
signal Async_Mode_1 : boolean;

------------------------------------------------------ FIFO_2 DECLARATION---------------------------------------------------------
signal FIFO_ROW_2  	: FIFO_Memory;
signal HEAD_2       : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_2       : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_2	: std_logic;
signal ReadEn_2 	: std_logic;
signal Async_Mode_2 : boolean;

------------------------------------------------------ FIFO_3 DECLARATION---------------------------------------------------------
signal FIFO_ROW_3  	: FIFO_Memory;
signal HEAD_3       : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_3       : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_3	: std_logic;
signal ReadEn_3 	: std_logic;
signal Async_Mode_3 : boolean;

------------------------------------------------------ FIFO_4 DECLARATION---------------------------------------------------------
signal FIFO_ROW_4  	: FIFO_Memory;
signal HEAD_4       : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_4       : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_4	: std_logic;
signal ReadEn_4 	: std_logic;
signal Async_Mode_4 : boolean;


-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_2_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_3_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_4_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_5_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_6_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_7_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_8_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_9_2          : std_logic_vector(PRECISION-1 downto 0);
signal DOUT_10_2          : std_logic_vector(PRECISION-1 downto 0);
signal EN_STREAM_OUT_2	 : std_logic;
signal VALID_OUT_2       : std_logic;

--------------------------------------------- FILTER HARDCODED CONSTANTS -WEIGHTS START--------------------------------

constant FMAP_1: FILTER_TYPE:=		(("00111111","11111111","00010111","00010011","00010001"),
                                     ("11101110","00111011","11111111","00000111","00011101"),
                                     ("00100010","11110000","00111101","11101110","11111100"),
                                     ("00101100","00001010","11110000","00100000","11111000"),
                                     ("00010111","00010001","00000000","00000101","00101000")
                                    );

constant FMAP_2: FILTER_TYPE:=		(("11110100","00100010","00100110","11110110","00000100"),
                                     ("01000111","00000111","00000000","00110100","00011000"),
                                     ("00001010","01011101","11111100","00000011","00010001"),
                                     ("00101101","11101010","01000000","00000100","00011010"),
                                     ("00110010","00101100","00000101","00111000","11101011")
                                    );

constant FMAP_3: FILTER_TYPE:=		(("11110000","00101100","00011011","11111100","00010101"),
                                     ("11100100","11111110","00000010","11110000","00010111"),
                                     ("00100011","11111110","00010110","00011000","00011001"),
                                     ("11101011","00111101","11101111","00010010","00011111"),
                                     ("00101111","00000111","00101010","11110010","11111011")
                                    );

constant FMAP_4: FILTER_TYPE:=		(("00100011","00010111","00001000","00011101","11110010"),
                                     ("11110001","00000000","00010000","00100000","00101000"),
                                     ("11100111","11111110","00000101","11111010","00010100"),
                                     ("00011011","11111011","00001011","00001000","00000011"),
                                     ("11110000","00000000","00000011","11111100","00011101")
                                    );

constant FMAP_5: FILTER_TYPE:=		(("00100100","00000101","11110001","11111000","00000110"),
                                     ("00010111","00000111","00010001","00001011","00001010"),
                                     ("11101001","11110101","11111110","11111110","00000011"),
                                     ("00001101","11101101","11111011","11101001","00010101"),
                                     ("00001000","00100011","00001101","00010101","00010010")
                                    );

constant FMAP_6: FILTER_TYPE:=		(("00010100","11100111","00011010","11101100","11111001"),
                                     ("00100110","00010001","11110001","00101011","00001111"),
                                     ("11101110","00010001","00001101","11111011","00100100"),
                                     ("11101000","11110100","11101110","00100010","11101001"),
                                     ("00011111","00001010","11111110","11101001","00000101")
                                    );


constant BIAS_VAL_1: signed (BIASES_SIZE-1 downto 0):="00000010";
constant BIAS_VAL_2: signed (BIASES_SIZE-1 downto 0):="00001000";
constant BIAS_VAL_3: signed (BIASES_SIZE-1 downto 0):="00000110";
constant BIAS_VAL_4: signed (BIASES_SIZE-1 downto 0):="00000000";
constant BIAS_VAL_5: signed (BIASES_SIZE-1 downto 0):="00000000";
constant BIAS_VAL_6: signed (BIASES_SIZE-1 downto 0):="00000001";


---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT POOL_LAYER_2
    port(	CLK,RST			:IN std_logic;
		DIN_1_2		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_2_2		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_3_2		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_4_2		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_5_2		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_6_2		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		EN_STREAM_OUT_2	:OUT std_logic;
		VALID_OUT_2		:OUT std_logic;
		DOUT_1_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_2_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_3_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_4_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_5_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_6_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_7_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_8_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_9_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_10_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
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
          DIN_2_2             => DOUT_BUF_2_1,
          DIN_3_2             => DOUT_BUF_3_1,
          DIN_4_2             => DOUT_BUF_4_1,
          DIN_5_2             => DOUT_BUF_5_1,
          DIN_6_2             => DOUT_BUF_6_1,
          DOUT_1_2            => DOUT_1_2,
          DOUT_2_2            => DOUT_2_2,
          DOUT_3_2            => DOUT_3_2,
          DOUT_4_2            => DOUT_4_2,
          DOUT_5_2            => DOUT_5_2,
          DOUT_6_2            => DOUT_6_2,
          DOUT_7_2            => DOUT_7_2,
          DOUT_8_2            => DOUT_8_2,
          DOUT_9_2            => DOUT_9_2,
          DOUT_10_2            => DOUT_10_2,
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
    ADD_DEPTH_3<=((others=> (others=> (others=>'0'))));Enable_STAGE_3<='0';
    ADD_DEPTH_4<=((others=> (others=> (others=>'0'))));Enable_STAGE_4<='0';
    ADD_DEPTH_5<=((others=> (others=> (others=>'0'))));Enable_STAGE_5<='0';

    MULT_1<=((others=> (others=> (others=>'0'))));    DOUT_BUF_1_1<=(others => '0');BIAS_1<=(others => '0');ReLU_1<=(others => '0');
    MULT_2<=((others=> (others=> (others=>'0'))));    DOUT_BUF_2_1<=(others => '0');BIAS_2<=(others => '0');ReLU_2<=(others => '0');
    MULT_3<=((others=> (others=> (others=>'0'))));    DOUT_BUF_3_1<=(others => '0');BIAS_3<=(others => '0');ReLU_3<=(others => '0');
    MULT_4<=((others=> (others=> (others=>'0'))));    DOUT_BUF_4_1<=(others => '0');BIAS_4<=(others => '0');ReLU_4<=(others => '0');
    MULT_5<=((others=> (others=> (others=>'0'))));    DOUT_BUF_5_1<=(others => '0');BIAS_5<=(others => '0');ReLU_5<=(others => '0');
    MULT_6<=((others=> (others=> (others=>'0'))));    DOUT_BUF_6_1<=(others => '0');BIAS_6<=(others => '0');ReLU_6<=(others => '0');

----------------- FIFO_1 RESET---------------
    FIFO_ROW_1<= ((others=> (others=>'0')));HEAD_1<=0;
    WriteEn_1<= '0';ReadEn_1<= '0';Async_Mode_1<= false;
----------------- FIFO_2 RESET---------------
    FIFO_ROW_2<= ((others=> (others=>'0')));HEAD_2<=0;
    WriteEn_2<= '0';ReadEn_2<= '0';Async_Mode_2<= false;
----------------- FIFO_3 RESET---------------
    FIFO_ROW_3<= ((others=> (others=>'0')));HEAD_3<=0;
    WriteEn_3<= '0';ReadEn_3<= '0';Async_Mode_3<= false;
----------------- FIFO_4 RESET---------------
    FIFO_ROW_4<= ((others=> (others=>'0')));HEAD_4<=0;
    WriteEn_4<= '0';ReadEn_4<= '0';Async_Mode_4<= false;



------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_1='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_1='1' then EN_NXT_LYR_1<='1';end if;


               WINDOW(0,0)<=DIN;
               WINDOW(0,1)<=WINDOW(0,0);
               WINDOW(0,2)<=WINDOW(0,1);
               WINDOW(0,3)<=WINDOW(0,2);
               WINDOW(0,4)<=WINDOW(0,3);

               WINDOW(1,1)<=WINDOW(1,0);
               WINDOW(1,2)<=WINDOW(1,1);
               WINDOW(1,3)<=WINDOW(1,2);
               WINDOW(1,4)<=WINDOW(1,3);

               WINDOW(2,1)<=WINDOW(2,0);
               WINDOW(2,2)<=WINDOW(2,1);
               WINDOW(2,3)<=WINDOW(2,2);
               WINDOW(2,4)<=WINDOW(2,3);

               WINDOW(3,1)<=WINDOW(3,0);
               WINDOW(3,2)<=WINDOW(3,1);
               WINDOW(3,3)<=WINDOW(3,2);
               WINDOW(3,4)<=WINDOW(3,3);

               WINDOW(4,1)<=WINDOW(4,0);
               WINDOW(4,2)<=WINDOW(4,1);
               WINDOW(4,3)<=WINDOW(4,2);
               WINDOW(4,4)<=WINDOW(4,3);


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
				elsif (TAIL_1 = F_SIZE-1) then WriteEn_2<='1'; TAIL_1<=TAIL_1+1;
				else
				  	 TAIL_1<=TAIL_1+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1 = '1') then
					FIFO_ROW_1(HEAD_1)<= WINDOW(0,4);
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


	           ----------------- Enable Read FIFO-2 START -------------------
				if (ReadEn_2 = '1') then 
				 	  WINDOW(2,0) <= FIFO_ROW_2(TAIL_2);
				if(TAIL_2 = FIFO_DEPTH-1) then
				   	TAIL_2<=0;  -- Rest Tail
				elsif (TAIL_2 = F_SIZE-1) then WriteEn_3<='1'; TAIL_2<=TAIL_2+1;
				else
				  	 TAIL_2<=TAIL_2+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_2 END -------------------

			----------------- Enable Write to FIFO_2 START --------------	
				if (WriteEn_2 = '1') then
					FIFO_ROW_2(HEAD_2)<= WINDOW(1,4);
				if (HEAD_2 = FIFO_DEPTH - 2 and Async_Mode_2 = false) then				 
					ReadEn_2<='1';
					HEAD_2 <= HEAD_2 + 1;
					Async_Mode_2<= true;
				else if (HEAD_2 = FIFO_DEPTH -1) then
					HEAD_2<=0;  -- Rest Head
				else
					HEAD_2 <= HEAD_2 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-2 END --------------


	           ----------------- Enable Read FIFO-3 START -------------------
				if (ReadEn_3 = '1') then 
				 	  WINDOW(3,0) <= FIFO_ROW_3(TAIL_3);
				if(TAIL_3 = FIFO_DEPTH-1) then
				   	TAIL_3<=0;  -- Rest Tail
				elsif (TAIL_3 = F_SIZE-1) then WriteEn_4<='1'; TAIL_3<=TAIL_3+1;
				else
				  	 TAIL_3<=TAIL_3+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_3 END -------------------

			----------------- Enable Write to FIFO_3 START --------------	
				if (WriteEn_3 = '1') then
					FIFO_ROW_3(HEAD_3)<= WINDOW(2,4);
				if (HEAD_3 = FIFO_DEPTH - 2 and Async_Mode_3 = false) then				 
					ReadEn_3<='1';
					HEAD_3 <= HEAD_3 + 1;
					Async_Mode_3<= true;
				else if (HEAD_3 = FIFO_DEPTH -1) then
					HEAD_3<=0;  -- Rest Head
				else
					HEAD_3 <= HEAD_3 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-3 END --------------


	           ----------------- Enable Read FIFO-4 START -------------------
				if (ReadEn_4 = '1') then 
				 	  WINDOW(4,0) <= FIFO_ROW_4(TAIL_4);
				if(TAIL_4 = FIFO_DEPTH-1) then
				   	TAIL_4<=0;  -- Rest Tail
				elsif (TAIL_4 = F_SIZE-1) then Enable_MULT<='1'; TAIL_4<=TAIL_4+1;
				else
				  	 TAIL_4<=TAIL_4+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_4 END -------------------

			----------------- Enable Write to FIFO_4 START --------------	
				if (WriteEn_4 = '1') then
					FIFO_ROW_4(HEAD_4)<= WINDOW(3,4);
				if (HEAD_4 = FIFO_DEPTH - 2 and Async_Mode_4 = false) then				 
					ReadEn_4<='1';
					HEAD_4 <= HEAD_4 + 1;
					Async_Mode_4<= true;
				else if (HEAD_4 = FIFO_DEPTH -1) then
					HEAD_4<=0;  -- Rest Head
				else
					HEAD_4 <= HEAD_4 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-4 END --------------


	      -------------------------------------------- Enable MULT START --------------------------------------------				
	
		if Enable_MULT='1' then
			------------------------ NAME OF MULT CORROSPONDS TO WEIGHT INDEX------------------------
			MULT_1(0,0)<=signed(WINDOW(4,4)) * signed(FMAP_1(0,0));
			MULT_2(0,0)<=signed(WINDOW(4,4)) * signed(FMAP_2(0,0));
			MULT_3(0,0)<=signed(WINDOW(4,4)) * signed(FMAP_3(0,0));
			MULT_4(0,0)<=signed(WINDOW(4,4)) * signed(FMAP_4(0,0));
			MULT_5(0,0)<=signed(WINDOW(4,4)) * signed(FMAP_5(0,0));
			MULT_6(0,0)<=signed(WINDOW(4,4)) * signed(FMAP_6(0,0));

			MULT_1(0,1)<=signed(WINDOW(4,3)) * signed(FMAP_1(0,1));
			MULT_2(0,1)<=signed(WINDOW(4,3)) * signed(FMAP_2(0,1));
			MULT_3(0,1)<=signed(WINDOW(4,3)) * signed(FMAP_3(0,1));
			MULT_4(0,1)<=signed(WINDOW(4,3)) * signed(FMAP_4(0,1));
			MULT_5(0,1)<=signed(WINDOW(4,3)) * signed(FMAP_5(0,1));
			MULT_6(0,1)<=signed(WINDOW(4,3)) * signed(FMAP_6(0,1));

			MULT_1(0,2)<=signed(WINDOW(4,2)) * signed(FMAP_1(0,2));
			MULT_2(0,2)<=signed(WINDOW(4,2)) * signed(FMAP_2(0,2));
			MULT_3(0,2)<=signed(WINDOW(4,2)) * signed(FMAP_3(0,2));
			MULT_4(0,2)<=signed(WINDOW(4,2)) * signed(FMAP_4(0,2));
			MULT_5(0,2)<=signed(WINDOW(4,2)) * signed(FMAP_5(0,2));
			MULT_6(0,2)<=signed(WINDOW(4,2)) * signed(FMAP_6(0,2));

			MULT_1(0,3)<=signed(WINDOW(4,1)) * signed(FMAP_1(0,3));
			MULT_2(0,3)<=signed(WINDOW(4,1)) * signed(FMAP_2(0,3));
			MULT_3(0,3)<=signed(WINDOW(4,1)) * signed(FMAP_3(0,3));
			MULT_4(0,3)<=signed(WINDOW(4,1)) * signed(FMAP_4(0,3));
			MULT_5(0,3)<=signed(WINDOW(4,1)) * signed(FMAP_5(0,3));
			MULT_6(0,3)<=signed(WINDOW(4,1)) * signed(FMAP_6(0,3));

			MULT_1(0,4)<=signed(WINDOW(4,0)) * signed(FMAP_1(0,4));
			MULT_2(0,4)<=signed(WINDOW(4,0)) * signed(FMAP_2(0,4));
			MULT_3(0,4)<=signed(WINDOW(4,0)) * signed(FMAP_3(0,4));
			MULT_4(0,4)<=signed(WINDOW(4,0)) * signed(FMAP_4(0,4));
			MULT_5(0,4)<=signed(WINDOW(4,0)) * signed(FMAP_5(0,4));
			MULT_6(0,4)<=signed(WINDOW(4,0)) * signed(FMAP_6(0,4));

			MULT_1(1,0)<=signed(WINDOW(3,4)) * signed(FMAP_1(1,0));
			MULT_2(1,0)<=signed(WINDOW(3,4)) * signed(FMAP_2(1,0));
			MULT_3(1,0)<=signed(WINDOW(3,4)) * signed(FMAP_3(1,0));
			MULT_4(1,0)<=signed(WINDOW(3,4)) * signed(FMAP_4(1,0));
			MULT_5(1,0)<=signed(WINDOW(3,4)) * signed(FMAP_5(1,0));
			MULT_6(1,0)<=signed(WINDOW(3,4)) * signed(FMAP_6(1,0));

			MULT_1(1,1)<=signed(WINDOW(3,3)) * signed(FMAP_1(1,1));
			MULT_2(1,1)<=signed(WINDOW(3,3)) * signed(FMAP_2(1,1));
			MULT_3(1,1)<=signed(WINDOW(3,3)) * signed(FMAP_3(1,1));
			MULT_4(1,1)<=signed(WINDOW(3,3)) * signed(FMAP_4(1,1));
			MULT_5(1,1)<=signed(WINDOW(3,3)) * signed(FMAP_5(1,1));
			MULT_6(1,1)<=signed(WINDOW(3,3)) * signed(FMAP_6(1,1));

			MULT_1(1,2)<=signed(WINDOW(3,2)) * signed(FMAP_1(1,2));
			MULT_2(1,2)<=signed(WINDOW(3,2)) * signed(FMAP_2(1,2));
			MULT_3(1,2)<=signed(WINDOW(3,2)) * signed(FMAP_3(1,2));
			MULT_4(1,2)<=signed(WINDOW(3,2)) * signed(FMAP_4(1,2));
			MULT_5(1,2)<=signed(WINDOW(3,2)) * signed(FMAP_5(1,2));
			MULT_6(1,2)<=signed(WINDOW(3,2)) * signed(FMAP_6(1,2));

			MULT_1(1,3)<=signed(WINDOW(3,1)) * signed(FMAP_1(1,3));
			MULT_2(1,3)<=signed(WINDOW(3,1)) * signed(FMAP_2(1,3));
			MULT_3(1,3)<=signed(WINDOW(3,1)) * signed(FMAP_3(1,3));
			MULT_4(1,3)<=signed(WINDOW(3,1)) * signed(FMAP_4(1,3));
			MULT_5(1,3)<=signed(WINDOW(3,1)) * signed(FMAP_5(1,3));
			MULT_6(1,3)<=signed(WINDOW(3,1)) * signed(FMAP_6(1,3));

			MULT_1(1,4)<=signed(WINDOW(3,0)) * signed(FMAP_1(1,4));
			MULT_2(1,4)<=signed(WINDOW(3,0)) * signed(FMAP_2(1,4));
			MULT_3(1,4)<=signed(WINDOW(3,0)) * signed(FMAP_3(1,4));
			MULT_4(1,4)<=signed(WINDOW(3,0)) * signed(FMAP_4(1,4));
			MULT_5(1,4)<=signed(WINDOW(3,0)) * signed(FMAP_5(1,4));
			MULT_6(1,4)<=signed(WINDOW(3,0)) * signed(FMAP_6(1,4));

			MULT_1(2,0)<=signed(WINDOW(2,4)) * signed(FMAP_1(2,0));
			MULT_2(2,0)<=signed(WINDOW(2,4)) * signed(FMAP_2(2,0));
			MULT_3(2,0)<=signed(WINDOW(2,4)) * signed(FMAP_3(2,0));
			MULT_4(2,0)<=signed(WINDOW(2,4)) * signed(FMAP_4(2,0));
			MULT_5(2,0)<=signed(WINDOW(2,4)) * signed(FMAP_5(2,0));
			MULT_6(2,0)<=signed(WINDOW(2,4)) * signed(FMAP_6(2,0));

			MULT_1(2,1)<=signed(WINDOW(2,3)) * signed(FMAP_1(2,1));
			MULT_2(2,1)<=signed(WINDOW(2,3)) * signed(FMAP_2(2,1));
			MULT_3(2,1)<=signed(WINDOW(2,3)) * signed(FMAP_3(2,1));
			MULT_4(2,1)<=signed(WINDOW(2,3)) * signed(FMAP_4(2,1));
			MULT_5(2,1)<=signed(WINDOW(2,3)) * signed(FMAP_5(2,1));
			MULT_6(2,1)<=signed(WINDOW(2,3)) * signed(FMAP_6(2,1));

			MULT_1(2,2)<=signed(WINDOW(2,2)) * signed(FMAP_1(2,2));
			MULT_2(2,2)<=signed(WINDOW(2,2)) * signed(FMAP_2(2,2));
			MULT_3(2,2)<=signed(WINDOW(2,2)) * signed(FMAP_3(2,2));
			MULT_4(2,2)<=signed(WINDOW(2,2)) * signed(FMAP_4(2,2));
			MULT_5(2,2)<=signed(WINDOW(2,2)) * signed(FMAP_5(2,2));
			MULT_6(2,2)<=signed(WINDOW(2,2)) * signed(FMAP_6(2,2));

			MULT_1(2,3)<=signed(WINDOW(2,1)) * signed(FMAP_1(2,3));
			MULT_2(2,3)<=signed(WINDOW(2,1)) * signed(FMAP_2(2,3));
			MULT_3(2,3)<=signed(WINDOW(2,1)) * signed(FMAP_3(2,3));
			MULT_4(2,3)<=signed(WINDOW(2,1)) * signed(FMAP_4(2,3));
			MULT_5(2,3)<=signed(WINDOW(2,1)) * signed(FMAP_5(2,3));
			MULT_6(2,3)<=signed(WINDOW(2,1)) * signed(FMAP_6(2,3));

			MULT_1(2,4)<=signed(WINDOW(2,0)) * signed(FMAP_1(2,4));
			MULT_2(2,4)<=signed(WINDOW(2,0)) * signed(FMAP_2(2,4));
			MULT_3(2,4)<=signed(WINDOW(2,0)) * signed(FMAP_3(2,4));
			MULT_4(2,4)<=signed(WINDOW(2,0)) * signed(FMAP_4(2,4));
			MULT_5(2,4)<=signed(WINDOW(2,0)) * signed(FMAP_5(2,4));
			MULT_6(2,4)<=signed(WINDOW(2,0)) * signed(FMAP_6(2,4));

			MULT_1(3,0)<=signed(WINDOW(1,4)) * signed(FMAP_1(3,0));
			MULT_2(3,0)<=signed(WINDOW(1,4)) * signed(FMAP_2(3,0));
			MULT_3(3,0)<=signed(WINDOW(1,4)) * signed(FMAP_3(3,0));
			MULT_4(3,0)<=signed(WINDOW(1,4)) * signed(FMAP_4(3,0));
			MULT_5(3,0)<=signed(WINDOW(1,4)) * signed(FMAP_5(3,0));
			MULT_6(3,0)<=signed(WINDOW(1,4)) * signed(FMAP_6(3,0));

			MULT_1(3,1)<=signed(WINDOW(1,3)) * signed(FMAP_1(3,1));
			MULT_2(3,1)<=signed(WINDOW(1,3)) * signed(FMAP_2(3,1));
			MULT_3(3,1)<=signed(WINDOW(1,3)) * signed(FMAP_3(3,1));
			MULT_4(3,1)<=signed(WINDOW(1,3)) * signed(FMAP_4(3,1));
			MULT_5(3,1)<=signed(WINDOW(1,3)) * signed(FMAP_5(3,1));
			MULT_6(3,1)<=signed(WINDOW(1,3)) * signed(FMAP_6(3,1));

			MULT_1(3,2)<=signed(WINDOW(1,2)) * signed(FMAP_1(3,2));
			MULT_2(3,2)<=signed(WINDOW(1,2)) * signed(FMAP_2(3,2));
			MULT_3(3,2)<=signed(WINDOW(1,2)) * signed(FMAP_3(3,2));
			MULT_4(3,2)<=signed(WINDOW(1,2)) * signed(FMAP_4(3,2));
			MULT_5(3,2)<=signed(WINDOW(1,2)) * signed(FMAP_5(3,2));
			MULT_6(3,2)<=signed(WINDOW(1,2)) * signed(FMAP_6(3,2));

			MULT_1(3,3)<=signed(WINDOW(1,1)) * signed(FMAP_1(3,3));
			MULT_2(3,3)<=signed(WINDOW(1,1)) * signed(FMAP_2(3,3));
			MULT_3(3,3)<=signed(WINDOW(1,1)) * signed(FMAP_3(3,3));
			MULT_4(3,3)<=signed(WINDOW(1,1)) * signed(FMAP_4(3,3));
			MULT_5(3,3)<=signed(WINDOW(1,1)) * signed(FMAP_5(3,3));
			MULT_6(3,3)<=signed(WINDOW(1,1)) * signed(FMAP_6(3,3));

			MULT_1(3,4)<=signed(WINDOW(1,0)) * signed(FMAP_1(3,4));
			MULT_2(3,4)<=signed(WINDOW(1,0)) * signed(FMAP_2(3,4));
			MULT_3(3,4)<=signed(WINDOW(1,0)) * signed(FMAP_3(3,4));
			MULT_4(3,4)<=signed(WINDOW(1,0)) * signed(FMAP_4(3,4));
			MULT_5(3,4)<=signed(WINDOW(1,0)) * signed(FMAP_5(3,4));
			MULT_6(3,4)<=signed(WINDOW(1,0)) * signed(FMAP_6(3,4));

			MULT_1(4,0)<=signed(WINDOW(0,4)) * signed(FMAP_1(4,0));
			MULT_2(4,0)<=signed(WINDOW(0,4)) * signed(FMAP_2(4,0));
			MULT_3(4,0)<=signed(WINDOW(0,4)) * signed(FMAP_3(4,0));
			MULT_4(4,0)<=signed(WINDOW(0,4)) * signed(FMAP_4(4,0));
			MULT_5(4,0)<=signed(WINDOW(0,4)) * signed(FMAP_5(4,0));
			MULT_6(4,0)<=signed(WINDOW(0,4)) * signed(FMAP_6(4,0));

			MULT_1(4,1)<=signed(WINDOW(0,3)) * signed(FMAP_1(4,1));
			MULT_2(4,1)<=signed(WINDOW(0,3)) * signed(FMAP_2(4,1));
			MULT_3(4,1)<=signed(WINDOW(0,3)) * signed(FMAP_3(4,1));
			MULT_4(4,1)<=signed(WINDOW(0,3)) * signed(FMAP_4(4,1));
			MULT_5(4,1)<=signed(WINDOW(0,3)) * signed(FMAP_5(4,1));
			MULT_6(4,1)<=signed(WINDOW(0,3)) * signed(FMAP_6(4,1));

			MULT_1(4,2)<=signed(WINDOW(0,2)) * signed(FMAP_1(4,2));
			MULT_2(4,2)<=signed(WINDOW(0,2)) * signed(FMAP_2(4,2));
			MULT_3(4,2)<=signed(WINDOW(0,2)) * signed(FMAP_3(4,2));
			MULT_4(4,2)<=signed(WINDOW(0,2)) * signed(FMAP_4(4,2));
			MULT_5(4,2)<=signed(WINDOW(0,2)) * signed(FMAP_5(4,2));
			MULT_6(4,2)<=signed(WINDOW(0,2)) * signed(FMAP_6(4,2));

			MULT_1(4,3)<=signed(WINDOW(0,1)) * signed(FMAP_1(4,3));
			MULT_2(4,3)<=signed(WINDOW(0,1)) * signed(FMAP_2(4,3));
			MULT_3(4,3)<=signed(WINDOW(0,1)) * signed(FMAP_3(4,3));
			MULT_4(4,3)<=signed(WINDOW(0,1)) * signed(FMAP_4(4,3));
			MULT_5(4,3)<=signed(WINDOW(0,1)) * signed(FMAP_5(4,3));
			MULT_6(4,3)<=signed(WINDOW(0,1)) * signed(FMAP_6(4,3));

			MULT_1(4,4)<=signed(WINDOW(0,0)) * signed(FMAP_1(4,4));
			MULT_2(4,4)<=signed(WINDOW(0,0)) * signed(FMAP_2(4,4));
			MULT_3(4,4)<=signed(WINDOW(0,0)) * signed(FMAP_3(4,4));
			MULT_4(4,4)<=signed(WINDOW(0,0)) * signed(FMAP_4(4,4));
			MULT_5(4,4)<=signed(WINDOW(0,0)) * signed(FMAP_5(4,4));
			MULT_6(4,4)<=signed(WINDOW(0,0)) * signed(FMAP_6(4,4));


			Enable_STAGE_1<='1';	
		end if;

		------------------------- Enable ADDER-TREE START -----------------------
		if Enable_STAGE_1 = '1' then
			------------------------------------STAGE-1--------------------------------------

			ADD_DEPTH_1(0,0)<=signed(MULT_1(0,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(0,1)<=signed(MULT_2(0,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(0,2)<=signed(MULT_3(0,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(0,3)<=signed(MULT_4(0,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(0,4)<=signed(MULT_5(0,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(0,5)<=signed(MULT_6(0,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(1,0)<=signed(MULT_1(1,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(2,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(1,1)<=signed(MULT_2(1,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(2,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(1,2)<=signed(MULT_3(1,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(2,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(1,3)<=signed(MULT_4(1,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(2,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(1,4)<=signed(MULT_5(1,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(2,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(1,5)<=signed(MULT_6(1,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(2,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(2,0)<=signed(MULT_1(3,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(4,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(2,1)<=signed(MULT_2(3,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(4,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(2,2)<=signed(MULT_3(3,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(4,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(2,3)<=signed(MULT_4(3,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(4,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(2,4)<=signed(MULT_5(3,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(4,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(2,5)<=signed(MULT_6(3,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(4,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL));


			ADD_DEPTH_1(3,0)<=signed(MULT_1(0,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(1,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(3,1)<=signed(MULT_2(0,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(1,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(3,2)<=signed(MULT_3(0,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(1,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(3,3)<=signed(MULT_4(0,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(1,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(3,4)<=signed(MULT_5(0,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(1,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(3,5)<=signed(MULT_6(0,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(1,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(4,0)<=signed(MULT_1(0,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(2,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(4,1)<=signed(MULT_2(0,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(2,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(4,2)<=signed(MULT_3(0,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(2,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(4,3)<=signed(MULT_4(0,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(2,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(4,4)<=signed(MULT_5(0,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(2,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(4,5)<=signed(MULT_6(0,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(2,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(5,0)<=signed(MULT_1(0,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(3,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(5,1)<=signed(MULT_2(0,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(3,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(5,2)<=signed(MULT_3(0,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(3,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(5,3)<=signed(MULT_4(0,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(3,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(5,4)<=signed(MULT_5(0,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(3,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(5,5)<=signed(MULT_6(0,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(3,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(6,0)<=signed(MULT_1(0,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(4,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(6,1)<=signed(MULT_2(0,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(4,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(6,2)<=signed(MULT_3(0,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(4,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(6,3)<=signed(MULT_4(0,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(4,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(6,4)<=signed(MULT_5(0,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(4,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(6,5)<=signed(MULT_6(0,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(4,0)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(7,0)<=signed(MULT_1(1,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(2,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(7,1)<=signed(MULT_2(1,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(2,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(7,2)<=signed(MULT_3(1,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(2,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(7,3)<=signed(MULT_4(1,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(2,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(7,4)<=signed(MULT_5(1,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(2,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(7,5)<=signed(MULT_6(1,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(2,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(8,0)<=signed(MULT_1(1,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(3,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(8,1)<=signed(MULT_2(1,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(3,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(8,2)<=signed(MULT_3(1,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(3,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(8,3)<=signed(MULT_4(1,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(3,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(8,4)<=signed(MULT_5(1,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(3,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(8,5)<=signed(MULT_6(1,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(3,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(9,0)<=signed(MULT_1(1,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(4,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(9,1)<=signed(MULT_2(1,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(4,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(9,2)<=signed(MULT_3(1,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(4,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(9,3)<=signed(MULT_4(1,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(4,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(9,4)<=signed(MULT_5(1,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(4,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(9,5)<=signed(MULT_6(1,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(4,1)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(10,0)<=signed(MULT_1(2,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(3,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(10,1)<=signed(MULT_2(2,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(3,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(10,2)<=signed(MULT_3(2,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(3,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(10,3)<=signed(MULT_4(2,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(3,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(10,4)<=signed(MULT_5(2,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(3,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(10,5)<=signed(MULT_6(2,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(3,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(11,0)<=signed(MULT_1(2,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(4,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(11,1)<=signed(MULT_2(2,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(4,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(11,2)<=signed(MULT_3(2,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(4,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(11,3)<=signed(MULT_4(2,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(4,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(11,4)<=signed(MULT_5(2,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(4,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(11,5)<=signed(MULT_6(2,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(4,2)(MULT_SIZE-PAD-WHOLE downto DECIMAL));

			ADD_DEPTH_1(12,0)<=signed(MULT_1(3,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_1(4,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(12,1)<=signed(MULT_2(3,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_2(4,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(12,2)<=signed(MULT_3(3,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_3(4,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(12,3)<=signed(MULT_4(3,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_4(4,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(12,4)<=signed(MULT_5(3,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_5(4,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL));
			ADD_DEPTH_1(12,5)<=signed(MULT_6(3,4)(MULT_SIZE-PAD-WHOLE downto DECIMAL)) + signed(MULT_6(4,3)(MULT_SIZE-PAD-WHOLE downto DECIMAL));



				Enable_STAGE_2<= '1';
			end if; 
			------------------------------------STAGE-2--------------------------------------
		if Enable_STAGE_2 = '1' then

			ADD_DEPTH_2(0,0)<=signed(ADD_DEPTH_1(0,0));
			ADD_DEPTH_2(0,1)<=signed(ADD_DEPTH_1(0,1));
			ADD_DEPTH_2(0,2)<=signed(ADD_DEPTH_1(0,2));
			ADD_DEPTH_2(0,3)<=signed(ADD_DEPTH_1(0,3));
			ADD_DEPTH_2(0,4)<=signed(ADD_DEPTH_1(0,4));
			ADD_DEPTH_2(0,5)<=signed(ADD_DEPTH_1(0,5));

			ADD_DEPTH_2(1,0)<=signed(ADD_DEPTH_1(1,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(2,0)(PRECISION-1 downto 0));
			ADD_DEPTH_2(1,1)<=signed(ADD_DEPTH_1(1,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(2,1)(PRECISION-1 downto 0));
			ADD_DEPTH_2(1,2)<=signed(ADD_DEPTH_1(1,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(2,2)(PRECISION-1 downto 0));
			ADD_DEPTH_2(1,3)<=signed(ADD_DEPTH_1(1,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(2,3)(PRECISION-1 downto 0));
			ADD_DEPTH_2(1,4)<=signed(ADD_DEPTH_1(1,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(2,4)(PRECISION-1 downto 0));
			ADD_DEPTH_2(1,5)<=signed(ADD_DEPTH_1(1,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(2,5)(PRECISION-1 downto 0));

			ADD_DEPTH_2(2,0)<=signed(ADD_DEPTH_1(3,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(4,0)(PRECISION-1 downto 0));
			ADD_DEPTH_2(2,1)<=signed(ADD_DEPTH_1(3,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(4,1)(PRECISION-1 downto 0));
			ADD_DEPTH_2(2,2)<=signed(ADD_DEPTH_1(3,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(4,2)(PRECISION-1 downto 0));
			ADD_DEPTH_2(2,3)<=signed(ADD_DEPTH_1(3,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(4,3)(PRECISION-1 downto 0));
			ADD_DEPTH_2(2,4)<=signed(ADD_DEPTH_1(3,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(4,4)(PRECISION-1 downto 0));
			ADD_DEPTH_2(2,5)<=signed(ADD_DEPTH_1(3,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(4,5)(PRECISION-1 downto 0));

			ADD_DEPTH_2(3,0)<=signed(ADD_DEPTH_1(5,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(6,0)(PRECISION-1 downto 0));
			ADD_DEPTH_2(3,1)<=signed(ADD_DEPTH_1(5,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(6,1)(PRECISION-1 downto 0));
			ADD_DEPTH_2(3,2)<=signed(ADD_DEPTH_1(5,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(6,2)(PRECISION-1 downto 0));
			ADD_DEPTH_2(3,3)<=signed(ADD_DEPTH_1(5,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(6,3)(PRECISION-1 downto 0));
			ADD_DEPTH_2(3,4)<=signed(ADD_DEPTH_1(5,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(6,4)(PRECISION-1 downto 0));
			ADD_DEPTH_2(3,5)<=signed(ADD_DEPTH_1(5,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(6,5)(PRECISION-1 downto 0));

			ADD_DEPTH_2(4,0)<=signed(ADD_DEPTH_1(7,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(8,0)(PRECISION-1 downto 0));
			ADD_DEPTH_2(4,1)<=signed(ADD_DEPTH_1(7,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(8,1)(PRECISION-1 downto 0));
			ADD_DEPTH_2(4,2)<=signed(ADD_DEPTH_1(7,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(8,2)(PRECISION-1 downto 0));
			ADD_DEPTH_2(4,3)<=signed(ADD_DEPTH_1(7,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(8,3)(PRECISION-1 downto 0));
			ADD_DEPTH_2(4,4)<=signed(ADD_DEPTH_1(7,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(8,4)(PRECISION-1 downto 0));
			ADD_DEPTH_2(4,5)<=signed(ADD_DEPTH_1(7,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(8,5)(PRECISION-1 downto 0));

			ADD_DEPTH_2(5,0)<=signed(ADD_DEPTH_1(9,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(10,0)(PRECISION-1 downto 0));
			ADD_DEPTH_2(5,1)<=signed(ADD_DEPTH_1(9,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(10,1)(PRECISION-1 downto 0));
			ADD_DEPTH_2(5,2)<=signed(ADD_DEPTH_1(9,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(10,2)(PRECISION-1 downto 0));
			ADD_DEPTH_2(5,3)<=signed(ADD_DEPTH_1(9,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(10,3)(PRECISION-1 downto 0));
			ADD_DEPTH_2(5,4)<=signed(ADD_DEPTH_1(9,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(10,4)(PRECISION-1 downto 0));
			ADD_DEPTH_2(5,5)<=signed(ADD_DEPTH_1(9,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(10,5)(PRECISION-1 downto 0));

			ADD_DEPTH_2(6,0)<=signed(ADD_DEPTH_1(11,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(12,0)(PRECISION-1 downto 0));
			ADD_DEPTH_2(6,1)<=signed(ADD_DEPTH_1(11,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(12,1)(PRECISION-1 downto 0));
			ADD_DEPTH_2(6,2)<=signed(ADD_DEPTH_1(11,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(12,2)(PRECISION-1 downto 0));
			ADD_DEPTH_2(6,3)<=signed(ADD_DEPTH_1(11,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(12,3)(PRECISION-1 downto 0));
			ADD_DEPTH_2(6,4)<=signed(ADD_DEPTH_1(11,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(12,4)(PRECISION-1 downto 0));
			ADD_DEPTH_2(6,5)<=signed(ADD_DEPTH_1(11,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_1(12,5)(PRECISION-1 downto 0));


				Enable_STAGE_3<= '1';
			end if; 
			------------------------------------STAGE-3--------------------------------------
		if Enable_STAGE_3 = '1' then

			ADD_DEPTH_3(0,0)<=signed(ADD_DEPTH_2(0,0));
			ADD_DEPTH_3(0,1)<=signed(ADD_DEPTH_2(0,1));
			ADD_DEPTH_3(0,2)<=signed(ADD_DEPTH_2(0,2));
			ADD_DEPTH_3(0,3)<=signed(ADD_DEPTH_2(0,3));
			ADD_DEPTH_3(0,4)<=signed(ADD_DEPTH_2(0,4));
			ADD_DEPTH_3(0,5)<=signed(ADD_DEPTH_2(0,5));

			ADD_DEPTH_3(1,0)<=signed(ADD_DEPTH_2(1,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(2,0)(PRECISION-1 downto 0));
			ADD_DEPTH_3(1,1)<=signed(ADD_DEPTH_2(1,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(2,1)(PRECISION-1 downto 0));
			ADD_DEPTH_3(1,2)<=signed(ADD_DEPTH_2(1,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(2,2)(PRECISION-1 downto 0));
			ADD_DEPTH_3(1,3)<=signed(ADD_DEPTH_2(1,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(2,3)(PRECISION-1 downto 0));
			ADD_DEPTH_3(1,4)<=signed(ADD_DEPTH_2(1,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(2,4)(PRECISION-1 downto 0));
			ADD_DEPTH_3(1,5)<=signed(ADD_DEPTH_2(1,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(2,5)(PRECISION-1 downto 0));

			ADD_DEPTH_3(2,0)<=signed(ADD_DEPTH_2(3,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(4,0)(PRECISION-1 downto 0));
			ADD_DEPTH_3(2,1)<=signed(ADD_DEPTH_2(3,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(4,1)(PRECISION-1 downto 0));
			ADD_DEPTH_3(2,2)<=signed(ADD_DEPTH_2(3,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(4,2)(PRECISION-1 downto 0));
			ADD_DEPTH_3(2,3)<=signed(ADD_DEPTH_2(3,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(4,3)(PRECISION-1 downto 0));
			ADD_DEPTH_3(2,4)<=signed(ADD_DEPTH_2(3,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(4,4)(PRECISION-1 downto 0));
			ADD_DEPTH_3(2,5)<=signed(ADD_DEPTH_2(3,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(4,5)(PRECISION-1 downto 0));

			ADD_DEPTH_3(3,0)<=signed(ADD_DEPTH_2(5,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(6,0)(PRECISION-1 downto 0));
			ADD_DEPTH_3(3,1)<=signed(ADD_DEPTH_2(5,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(6,1)(PRECISION-1 downto 0));
			ADD_DEPTH_3(3,2)<=signed(ADD_DEPTH_2(5,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(6,2)(PRECISION-1 downto 0));
			ADD_DEPTH_3(3,3)<=signed(ADD_DEPTH_2(5,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(6,3)(PRECISION-1 downto 0));
			ADD_DEPTH_3(3,4)<=signed(ADD_DEPTH_2(5,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(6,4)(PRECISION-1 downto 0));
			ADD_DEPTH_3(3,5)<=signed(ADD_DEPTH_2(5,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_2(6,5)(PRECISION-1 downto 0));


				Enable_STAGE_4<= '1';
			end if; 
			------------------------------------STAGE-4--------------------------------------
		if Enable_STAGE_4 = '1' then


			ADD_DEPTH_4(0,0)<=signed(ADD_DEPTH_3(0,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(1,0)(PRECISION-1 downto 0));
			ADD_DEPTH_4(0,1)<=signed(ADD_DEPTH_3(0,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(1,1)(PRECISION-1 downto 0));
			ADD_DEPTH_4(0,2)<=signed(ADD_DEPTH_3(0,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(1,2)(PRECISION-1 downto 0));
			ADD_DEPTH_4(0,3)<=signed(ADD_DEPTH_3(0,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(1,3)(PRECISION-1 downto 0));
			ADD_DEPTH_4(0,4)<=signed(ADD_DEPTH_3(0,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(1,4)(PRECISION-1 downto 0));
			ADD_DEPTH_4(0,5)<=signed(ADD_DEPTH_3(0,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(1,5)(PRECISION-1 downto 0));

			ADD_DEPTH_4(1,0)<=signed(ADD_DEPTH_3(2,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(3,0)(PRECISION-1 downto 0));
			ADD_DEPTH_4(1,1)<=signed(ADD_DEPTH_3(2,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(3,1)(PRECISION-1 downto 0));
			ADD_DEPTH_4(1,2)<=signed(ADD_DEPTH_3(2,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(3,2)(PRECISION-1 downto 0));
			ADD_DEPTH_4(1,3)<=signed(ADD_DEPTH_3(2,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(3,3)(PRECISION-1 downto 0));
			ADD_DEPTH_4(1,4)<=signed(ADD_DEPTH_3(2,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(3,4)(PRECISION-1 downto 0));
			ADD_DEPTH_4(1,5)<=signed(ADD_DEPTH_3(2,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_3(3,5)(PRECISION-1 downto 0));


				Enable_STAGE_5<= '1';
			end if; 
			------------------------------------STAGE-5--------------------------------------
		if Enable_STAGE_5 = '1' then


			ADD_DEPTH_5(0,0)<=signed(ADD_DEPTH_4(0,0)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_4(1,0)(PRECISION-1 downto 0));
			ADD_DEPTH_5(0,1)<=signed(ADD_DEPTH_4(0,1)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_4(1,1)(PRECISION-1 downto 0));
			ADD_DEPTH_5(0,2)<=signed(ADD_DEPTH_4(0,2)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_4(1,2)(PRECISION-1 downto 0));
			ADD_DEPTH_5(0,3)<=signed(ADD_DEPTH_4(0,3)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_4(1,3)(PRECISION-1 downto 0));
			ADD_DEPTH_5(0,4)<=signed(ADD_DEPTH_4(0,4)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_4(1,4)(PRECISION-1 downto 0));
			ADD_DEPTH_5(0,5)<=signed(ADD_DEPTH_4(0,5)(PRECISION-1 downto 0)) + signed(ADD_DEPTH_4(1,5)(PRECISION-1 downto 0));


			Enable_BIAS<='1'; 
		end if;
		------------------------------------STAGE-BIAS--------------------------------------
		
		if Enable_BIAS = '1' then

			BIAS_1<=(signed(BIAS_VAL_1)+signed(ADD_DEPTH_5(0,0)));
			BIAS_2<=(signed(BIAS_VAL_2)+signed(ADD_DEPTH_5(0,1)));
			BIAS_3<=(signed(BIAS_VAL_3)+signed(ADD_DEPTH_5(0,2)));
			BIAS_4<=(signed(BIAS_VAL_4)+signed(ADD_DEPTH_5(0,3)));
			BIAS_5<=(signed(BIAS_VAL_5)+signed(ADD_DEPTH_5(0,4)));
			BIAS_6<=(signed(BIAS_VAL_6)+signed(ADD_DEPTH_5(0,5)));

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
			if BIAS_2>0 then
			ReLU_2<=BIAS_2;
			DOUT_BUF_2_1<=std_logic_vector(BIAS_2);
			else
			ReLU_2<= (others => '0');
			DOUT_BUF_2_1<=(others => '0');
			end if;
			if BIAS_3>0 then
			ReLU_3<=BIAS_3;
			DOUT_BUF_3_1<=std_logic_vector(BIAS_3);
			else
			ReLU_3<= (others => '0');
			DOUT_BUF_3_1<=(others => '0');
			end if;
			if BIAS_4>0 then
			ReLU_4<=BIAS_4;
			DOUT_BUF_4_1<=std_logic_vector(BIAS_4);
			else
			ReLU_4<= (others => '0');
			DOUT_BUF_4_1<=(others => '0');
			end if;
			if BIAS_5>0 then
			ReLU_5<=BIAS_5;
			DOUT_BUF_5_1<=std_logic_vector(BIAS_5);
			else
			ReLU_5<= (others => '0');
			DOUT_BUF_5_1<=(others => '0');
			end if;
			if BIAS_6>0 then
			ReLU_6<=BIAS_6;
			DOUT_BUF_6_1<=std_logic_vector(BIAS_6);
			else
			ReLU_6<= (others => '0');
			DOUT_BUF_6_1<=(others => '0');
			end if;

			EN_NXT_LYR_1<='1';FRST_TIM_EN_1<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
               EN_NXT_LYR_1<='0';
               DOUT_BUF_1_1<=(others => '0');
               DOUT_BUF_2_1<=(others => '0');
               DOUT_BUF_3_1<=(others => '0');
               DOUT_BUF_4_1<=(others => '0');
               DOUT_BUF_5_1<=(others => '0');
               DOUT_BUF_6_1<=(others => '0');

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
DOUT_3_1<=DOUT_3_2;
DOUT_4_1<=DOUT_4_2;
DOUT_5_1<=DOUT_5_2;
DOUT_6_1<=DOUT_6_2;
DOUT_7_1<=DOUT_7_2;
DOUT_8_1<=DOUT_8_2;
DOUT_9_1<=DOUT_9_2;
DOUT_10_1<=DOUT_10_2;

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

