------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Mon Apr 06 11:19:14 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    POOL - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Number of Total Operaiton: 160
-- Number of Clock Cycles: 3
-- Number of GOPS = 5.0
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity POOL_LAYER_4 is

GENERIC
 	( 
	constant PERCISION      : positive := 5; 	
	constant DOUT_WIDTH     : positive := 5; 
	constant BIAS_SIZE      : positive := 5;
	constant MULT_SIZE      : positive := 5;
	constant DIN_WIDTH      : positive := 5;	
	constant IMAGE_WIDTH    : positive := 10;
	constant IMAGE_SIZE     : positive := 1024;	
	constant F_SIZE         : positive := 2;
	constant WEIGHT_SIZE    : positive := 5;
	constant BIASES_SIZE	: positive := 2;
	constant PADDING        : positive := 1;
	constant STRIDE         : positive := 2;
	constant FEATURE_MAPS   : positive := 16;
	constant F_SIZEX2       : positive := 4;
	constant VALID_CYCLES   : positive := 25;
	constant VALID_LOCAL_PIX: positive := 5;
	constant MAX_DEPTH      : positive := 2;
	constant INPUT_DEPTH    : positive := 4;
	constant FIFO_DEPTH     : positive := 9;	
	constant USED_FIFOS     : positive := 1;	
	constant MAX_1          : positive := 2;    	
	constant MAX_2          : positive := 1;    	
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN_1_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_2_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_3_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_4_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_5_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_6_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_7_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_8_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_9_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_10_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_11_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_12_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_13_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_14_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_15_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_16_4         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	CLK,RST         :IN std_logic;
   	DIS_STREAM      :OUT std_logic; 					-- S_AXIS_TVALID  : Data in is valid
   	EN_STREAM       :IN std_logic; 						-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_4 :OUT std_logic; 				-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_4     :OUT std_logic;  				-- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_4 :IN std_logic;
	DOUT_1_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_3_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_4_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_5_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_6_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_7_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_8_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_9_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_10_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST    :OUT std_logic
	);	

end POOL_LAYER_4;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of POOL_LAYER_4 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(WEIGHT_SIZE- 1 downto 0);
type       FIFO_Memory             is array (0 to FIFO_DEPTH - 1)          of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
type       SLIDING_WINDOW          is array (0 to FEATURE_MAPS-1, 0 to F_SIZEX2-1) of STD_LOGIC_VECTOR(DIN_WIDTH- 1 downto 0);
signal     WINDOW:SLIDING_WINDOW;
signal     VALID_NXTLYR_PIX        :integer range 0 to VALID_CYCLES;
signal     PIXEL_COUNT             :integer range 0 to VALID_CYCLES;
signal     OUT_PIXEL_COUNT         :integer range 0 to VALID_CYCLES;
signal     EN_NXT_LYR_4            :std_logic;
signal     FRST_TIM_EN_4           :std_logic;
signal     Enable_MAX              :std_logic;
signal     Enable_ADDER            :std_logic;
signal     EN_OUT_BUF              :std_logic;
signal     POOL_STRIDE             :integer range 0 to IMAGE_SIZE;
signal     SIG_STRIDE              :integer range 0 to IMAGE_SIZE;
signal     VALID_ROWS              :integer range 0 to IMAGE_SIZE;
signal     PADDING_count           :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     ROW_COUNT               :integer range 0 to IMAGE_SIZE; -- TEMPORARY


------------------------------ INTERNAL DYNAMIC SIGNALS DECLARATION ARRAY TYPE- START---------------------------------------------

type    MAX_X_1	is array ( 0 to FEATURE_MAPS-1 , 0 to MAX_1-1 ) of std_logic_vector(DIN_WIDTH- 1 downto 0);
signal  MAX_D_1:MAX_X_1;
signal  Enable_MX_2	: std_logic;
type    MAX_X_2	is array ( 0 to FEATURE_MAPS-1 , 0 to MAX_2-1 ) of std_logic_vector(DIN_WIDTH- 1 downto 0);
signal  MAX_D_2:MAX_X_2;

------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_1  	 : FIFO_Memory;
signal HEAD_1_1 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_1  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_1	   : std_logic;
signal ReadEn_1_1 	   : std_logic;
signal Async_Mode_1_1  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_2  	 : FIFO_Memory;
signal HEAD_1_2 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_2  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_2	   : std_logic;
signal ReadEn_1_2 	   : std_logic;
signal Async_Mode_1_2  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_3  	 : FIFO_Memory;
signal HEAD_1_3 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_3  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_3	   : std_logic;
signal ReadEn_1_3 	   : std_logic;
signal Async_Mode_1_3  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_4  	 : FIFO_Memory;
signal HEAD_1_4 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_4  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_4	   : std_logic;
signal ReadEn_1_4 	   : std_logic;
signal Async_Mode_1_4  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_5  	 : FIFO_Memory;
signal HEAD_1_5 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_5  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_5	   : std_logic;
signal ReadEn_1_5 	   : std_logic;
signal Async_Mode_1_5  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_6  	 : FIFO_Memory;
signal HEAD_1_6 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_6  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_6	   : std_logic;
signal ReadEn_1_6 	   : std_logic;
signal Async_Mode_1_6  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_7  	 : FIFO_Memory;
signal HEAD_1_7 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_7  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_7	   : std_logic;
signal ReadEn_1_7 	   : std_logic;
signal Async_Mode_1_7  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_8  	 : FIFO_Memory;
signal HEAD_1_8 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_8  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_8	   : std_logic;
signal ReadEn_1_8 	   : std_logic;
signal Async_Mode_1_8  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_9  	 : FIFO_Memory;
signal HEAD_1_9 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_9  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_9	   : std_logic;
signal ReadEn_1_9 	   : std_logic;
signal Async_Mode_1_9  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_10  	 : FIFO_Memory;
signal HEAD_1_10 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_10  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_10	   : std_logic;
signal ReadEn_1_10 	   : std_logic;
signal Async_Mode_1_10  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_11  	 : FIFO_Memory;
signal HEAD_1_11 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_11  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_11	   : std_logic;
signal ReadEn_1_11 	   : std_logic;
signal Async_Mode_1_11  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_12  	 : FIFO_Memory;
signal HEAD_1_12 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_12  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_12	   : std_logic;
signal ReadEn_1_12 	   : std_logic;
signal Async_Mode_1_12  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_13  	 : FIFO_Memory;
signal HEAD_1_13 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_13  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_13	   : std_logic;
signal ReadEn_1_13 	   : std_logic;
signal Async_Mode_1_13  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_14  	 : FIFO_Memory;
signal HEAD_1_14 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_14  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_14	   : std_logic;
signal ReadEn_1_14 	   : std_logic;
signal Async_Mode_1_14  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_15  	 : FIFO_Memory;
signal HEAD_1_15 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_15  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_15	   : std_logic;
signal ReadEn_1_15 	   : std_logic;
signal Async_Mode_1_15  : boolean;
------------------------------------------------------ FIFO_1 DECLARATION---------------------------------------------------------
signal FIFO_ROW_1_16  	 : FIFO_Memory;
signal HEAD_1_16 	   : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_16  	   : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_16	   : std_logic;
signal ReadEn_1_16 	   : std_logic;
signal Async_Mode_1_16  : boolean;


------------------------------------------------------ DOUT NEXT LAYER SIGS DECLARATION---------------------------------------------------------

signal DOUT_BUF_1_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_2_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_3_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_4_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_5_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_6_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_7_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_8_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_9_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_10_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_11_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_12_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_13_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_14_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_15_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal DOUT_BUF_16_4        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);

-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_2_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_3_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_4_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_5_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_6_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_7_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_8_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_9_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_10_5	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal EN_STREAM_OUT_5	: std_logic;
signal VALID_OUT_5          : std_logic;

---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT Flatten_LAYER_5
    port(	CLK,RST		:IN std_logic;
			DIN_1_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_2_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_3_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_4_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_5_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_6_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_7_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_8_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_9_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_10_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_11_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_12_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_13_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_14_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_15_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			DIN_16_5			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			EN_STREAM_OUT_5	:OUT std_logic;
			VALID_OUT_5	:OUT std_logic;
			DOUT_1_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_2_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_3_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_4_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_5_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_6_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_7_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_8_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_9_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_10_5        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			EN_STREAM	:IN std_logic;
			EN_LOC_STREAM_5	:IN std_logic
      			);
END COMPONENT Flatten_LAYER_5;

begin

Flatten_LYR_5 : Flatten_LAYER_5 
          port map(
            CLK              => CLK,
            RST              => RST,
            DIN_1_5 	     => DOUT_BUF_1_4,
            DIN_2_5 	     => DOUT_BUF_2_4,
            DIN_3_5 	     => DOUT_BUF_3_4,
            DIN_4_5 	     => DOUT_BUF_4_4,
            DIN_5_5 	     => DOUT_BUF_5_4,
            DIN_6_5 	     => DOUT_BUF_6_4,
            DIN_7_5 	     => DOUT_BUF_7_4,
            DIN_8_5 	     => DOUT_BUF_8_4,
            DIN_9_5 	     => DOUT_BUF_9_4,
            DIN_10_5 	     => DOUT_BUF_10_4,
            DIN_11_5 	     => DOUT_BUF_11_4,
            DIN_12_5 	     => DOUT_BUF_12_4,
            DIN_13_5 	     => DOUT_BUF_13_4,
            DIN_14_5 	     => DOUT_BUF_14_4,
            DIN_15_5 	     => DOUT_BUF_15_4,
            DIN_16_5 	     => DOUT_BUF_16_4,
            DOUT_1_5         => DOUT_1_5,
            DOUT_2_5         => DOUT_2_5,
            DOUT_3_5         => DOUT_3_5,
            DOUT_4_5         => DOUT_4_5,
            DOUT_5_5         => DOUT_5_5,
            DOUT_6_5         => DOUT_6_5,
            DOUT_7_5         => DOUT_7_5,
            DOUT_8_5         => DOUT_8_5,
            DOUT_9_5         => DOUT_9_5,
            DOUT_10_5         => DOUT_10_5,
            VALID_OUT_5      => VALID_OUT_5,
            EN_STREAM_OUT_5  => EN_STREAM_OUT_5,
            EN_LOC_STREAM_5  => EN_NXT_LYR_4,
            EN_STREAM        => EN_STREAM
                );

----------------------------------------------- MAP NEXT LAYER - COMPONENTS END----------------------------------------------------


-------------------------------------------------------- ARCHITECTURE BEGIN--------------------------------------------------------

LAYER_4: process(CLK)

begin
------------------------------------------------ RESET AND PROCESS TOP START ------------------------------------------------------
if rising_edge(CLK) then
  if RST = '1' then
	-------------------FIXED SIGNALS RESET------------------------
    WINDOW<=((others=> (others=> (others=>'0'))));
    PIXEL_COUNT<=0;VALID_NXTLYR_PIX<=0;OUT_PIXEL_COUNT<=0;
    EN_NXT_LYR_4<='0';FRST_TIM_EN_4<='0';EN_OUT_BUF<='0';
    Enable_MAX<='0';Enable_ADDER<='0';
    INTERNAL_RST<='0';PADDING_count<=0;ROW_COUNT<=0;SIG_STRIDE<=STRIDE;VALID_ROWS<=0;

-------------------DYNAMIC SIGNALS RESET------------------------
    MAX_D_1<=((others=> (others=> (others=>'0'))));Enable_MX_2<='0';
    MAX_D_2<=((others=> (others=> (others=>'0'))));

    DOUT_BUF_1_4<=(others => '0');
    DOUT_BUF_2_4<=(others => '0');
    DOUT_BUF_3_4<=(others => '0');
    DOUT_BUF_4_4<=(others => '0');
    DOUT_BUF_5_4<=(others => '0');
    DOUT_BUF_6_4<=(others => '0');
    DOUT_BUF_7_4<=(others => '0');
    DOUT_BUF_8_4<=(others => '0');
    DOUT_BUF_9_4<=(others => '0');
    DOUT_BUF_10_4<=(others => '0');
    DOUT_BUF_11_4<=(others => '0');
    DOUT_BUF_12_4<=(others => '0');
    DOUT_BUF_13_4<=(others => '0');
    DOUT_BUF_14_4<=(others => '0');
    DOUT_BUF_15_4<=(others => '0');
    DOUT_BUF_16_4<=(others => '0');

----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_1<= ((others=> (others=>'0')));HEAD_1_1<=0;
    WriteEn_1_1<= '0';ReadEn_1_1<= '0';Async_Mode_1_1<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_2<= ((others=> (others=>'0')));HEAD_1_2<=0;
    WriteEn_1_2<= '0';ReadEn_1_2<= '0';Async_Mode_1_2<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_3<= ((others=> (others=>'0')));HEAD_1_3<=0;
    WriteEn_1_3<= '0';ReadEn_1_3<= '0';Async_Mode_1_3<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_4<= ((others=> (others=>'0')));HEAD_1_4<=0;
    WriteEn_1_4<= '0';ReadEn_1_4<= '0';Async_Mode_1_4<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_5<= ((others=> (others=>'0')));HEAD_1_5<=0;
    WriteEn_1_5<= '0';ReadEn_1_5<= '0';Async_Mode_1_5<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_6<= ((others=> (others=>'0')));HEAD_1_6<=0;
    WriteEn_1_6<= '0';ReadEn_1_6<= '0';Async_Mode_1_6<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_7<= ((others=> (others=>'0')));HEAD_1_7<=0;
    WriteEn_1_7<= '0';ReadEn_1_7<= '0';Async_Mode_1_7<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_8<= ((others=> (others=>'0')));HEAD_1_8<=0;
    WriteEn_1_8<= '0';ReadEn_1_8<= '0';Async_Mode_1_8<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_9<= ((others=> (others=>'0')));HEAD_1_9<=0;
    WriteEn_1_9<= '0';ReadEn_1_9<= '0';Async_Mode_1_9<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_10<= ((others=> (others=>'0')));HEAD_1_10<=0;
    WriteEn_1_10<= '0';ReadEn_1_10<= '0';Async_Mode_1_10<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_11<= ((others=> (others=>'0')));HEAD_1_11<=0;
    WriteEn_1_11<= '0';ReadEn_1_11<= '0';Async_Mode_1_11<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_12<= ((others=> (others=>'0')));HEAD_1_12<=0;
    WriteEn_1_12<= '0';ReadEn_1_12<= '0';Async_Mode_1_12<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_13<= ((others=> (others=>'0')));HEAD_1_13<=0;
    WriteEn_1_13<= '0';ReadEn_1_13<= '0';Async_Mode_1_13<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_14<= ((others=> (others=>'0')));HEAD_1_14<=0;
    WriteEn_1_14<= '0';ReadEn_1_14<= '0';Async_Mode_1_14<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_15<= ((others=> (others=>'0')));HEAD_1_15<=0;
    WriteEn_1_15<= '0';ReadEn_1_15<= '0';Async_Mode_1_15<= false;
----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_16<= ((others=> (others=>'0')));HEAD_1_16<=0;
    WriteEn_1_16<= '0';ReadEn_1_16<= '0';Async_Mode_1_16<= false;


------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_4='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_4='1' then EN_NXT_LYR_4<='1';end if;

                ---------------------F-MAP1---------------------

                WINDOW(0,0)<=DIN_1_4;
                WINDOW(0,1)<=WINDOW(0,0);

                WINDOW(0,3)<=WINDOW(0,2);

                ---------------------F-MAP2---------------------

                WINDOW(1,0)<=DIN_2_4;
                WINDOW(1,1)<=WINDOW(1,0);

                WINDOW(1,3)<=WINDOW(1,2);

                ---------------------F-MAP3---------------------

                WINDOW(2,0)<=DIN_3_4;
                WINDOW(2,1)<=WINDOW(2,0);

                WINDOW(2,3)<=WINDOW(2,2);

                ---------------------F-MAP4---------------------

                WINDOW(3,0)<=DIN_4_4;
                WINDOW(3,1)<=WINDOW(3,0);

                WINDOW(3,3)<=WINDOW(3,2);

                ---------------------F-MAP5---------------------

                WINDOW(4,0)<=DIN_5_4;
                WINDOW(4,1)<=WINDOW(4,0);

                WINDOW(4,3)<=WINDOW(4,2);

                ---------------------F-MAP6---------------------

                WINDOW(5,0)<=DIN_6_4;
                WINDOW(5,1)<=WINDOW(5,0);

                WINDOW(5,3)<=WINDOW(5,2);

                ---------------------F-MAP7---------------------

                WINDOW(6,0)<=DIN_7_4;
                WINDOW(6,1)<=WINDOW(6,0);

                WINDOW(6,3)<=WINDOW(6,2);

                ---------------------F-MAP8---------------------

                WINDOW(7,0)<=DIN_8_4;
                WINDOW(7,1)<=WINDOW(7,0);

                WINDOW(7,3)<=WINDOW(7,2);

                ---------------------F-MAP9---------------------

                WINDOW(8,0)<=DIN_9_4;
                WINDOW(8,1)<=WINDOW(8,0);

                WINDOW(8,3)<=WINDOW(8,2);

                ---------------------F-MAP10---------------------

                WINDOW(9,0)<=DIN_10_4;
                WINDOW(9,1)<=WINDOW(9,0);

                WINDOW(9,3)<=WINDOW(9,2);

                ---------------------F-MAP11---------------------

                WINDOW(10,0)<=DIN_11_4;
                WINDOW(10,1)<=WINDOW(10,0);

                WINDOW(10,3)<=WINDOW(10,2);

                ---------------------F-MAP12---------------------

                WINDOW(11,0)<=DIN_12_4;
                WINDOW(11,1)<=WINDOW(11,0);

                WINDOW(11,3)<=WINDOW(11,2);

                ---------------------F-MAP13---------------------

                WINDOW(12,0)<=DIN_13_4;
                WINDOW(12,1)<=WINDOW(12,0);

                WINDOW(12,3)<=WINDOW(12,2);

                ---------------------F-MAP14---------------------

                WINDOW(13,0)<=DIN_14_4;
                WINDOW(13,1)<=WINDOW(13,0);

                WINDOW(13,3)<=WINDOW(13,2);

                ---------------------F-MAP15---------------------

                WINDOW(14,0)<=DIN_15_4;
                WINDOW(14,1)<=WINDOW(14,0);

                WINDOW(14,3)<=WINDOW(14,2);

                ---------------------F-MAP16---------------------

                WINDOW(15,0)<=DIN_16_4;
                WINDOW(15,1)<=WINDOW(15,0);

                WINDOW(15,3)<=WINDOW(15,2);



                if PIXEL_COUNT=(F_SIZE-1) then
                  WriteEn_1_1 <= '1';
                  WriteEn_1_2 <= '1';
                  WriteEn_1_3 <= '1';
                  WriteEn_1_4 <= '1';
                  WriteEn_1_5 <= '1';
                  WriteEn_1_6 <= '1';
                  WriteEn_1_7 <= '1';
                  WriteEn_1_8 <= '1';
                  WriteEn_1_9 <= '1';
                  WriteEn_1_10 <= '1';
                  WriteEn_1_11 <= '1';
                  WriteEn_1_12 <= '1';
                  WriteEn_1_13 <= '1';
                  WriteEn_1_14 <= '1';
                  WriteEn_1_15 <= '1';
                  WriteEn_1_16 <= '1';
                else
                 PIXEL_COUNT<=PIXEL_COUNT+1;
                end if;

           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_1 = '1') then 
				 	  WINDOW(0,2) <= FIFO_ROW_1_1(TAIL_1_1);
				if(TAIL_1_1 = FIFO_DEPTH-1) then
				   	TAIL_1_1<=0;  -- Rest Tail
				elsif (TAIL_1_1 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_1<=TAIL_1_1+1;
				else
				  	 TAIL_1_1<=TAIL_1_1+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_1 = '1') then
					FIFO_ROW_1_1(HEAD_1_1)<= WINDOW(0,1);
				if (HEAD_1_1 = FIFO_DEPTH - 2 and Async_Mode_1_1 = false) then				 
					ReadEn_1_1<='1';
					HEAD_1_1 <= HEAD_1_1 + 1;
					Async_Mode_1_1<= true;
				else if (HEAD_1_1 = FIFO_DEPTH -1) then
					HEAD_1_1<=0;  -- Rest Head
				else
					HEAD_1_1 <= HEAD_1_1 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_2 = '1') then 
				 	  WINDOW(1,2) <= FIFO_ROW_1_2(TAIL_1_2);
				if(TAIL_1_2 = FIFO_DEPTH-1) then
				   	TAIL_1_2<=0;  -- Rest Tail
				elsif (TAIL_1_2 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_2<=TAIL_1_2+1;
				else
				  	 TAIL_1_2<=TAIL_1_2+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_2 = '1') then
					FIFO_ROW_1_2(HEAD_1_2)<= WINDOW(1,1);
				if (HEAD_1_2 = FIFO_DEPTH - 2 and Async_Mode_1_2 = false) then				 
					ReadEn_1_2<='1';
					HEAD_1_2 <= HEAD_1_2 + 1;
					Async_Mode_1_2<= true;
				else if (HEAD_1_2 = FIFO_DEPTH -1) then
					HEAD_1_2<=0;  -- Rest Head
				else
					HEAD_1_2 <= HEAD_1_2 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_3 = '1') then 
				 	  WINDOW(2,2) <= FIFO_ROW_1_3(TAIL_1_3);
				if(TAIL_1_3 = FIFO_DEPTH-1) then
				   	TAIL_1_3<=0;  -- Rest Tail
				elsif (TAIL_1_3 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_3<=TAIL_1_3+1;
				else
				  	 TAIL_1_3<=TAIL_1_3+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_3 = '1') then
					FIFO_ROW_1_3(HEAD_1_3)<= WINDOW(2,1);
				if (HEAD_1_3 = FIFO_DEPTH - 2 and Async_Mode_1_3 = false) then				 
					ReadEn_1_3<='1';
					HEAD_1_3 <= HEAD_1_3 + 1;
					Async_Mode_1_3<= true;
				else if (HEAD_1_3 = FIFO_DEPTH -1) then
					HEAD_1_3<=0;  -- Rest Head
				else
					HEAD_1_3 <= HEAD_1_3 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_4 = '1') then 
				 	  WINDOW(3,2) <= FIFO_ROW_1_4(TAIL_1_4);
				if(TAIL_1_4 = FIFO_DEPTH-1) then
				   	TAIL_1_4<=0;  -- Rest Tail
				elsif (TAIL_1_4 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_4<=TAIL_1_4+1;
				else
				  	 TAIL_1_4<=TAIL_1_4+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_4 = '1') then
					FIFO_ROW_1_4(HEAD_1_4)<= WINDOW(3,1);
				if (HEAD_1_4 = FIFO_DEPTH - 2 and Async_Mode_1_4 = false) then				 
					ReadEn_1_4<='1';
					HEAD_1_4 <= HEAD_1_4 + 1;
					Async_Mode_1_4<= true;
				else if (HEAD_1_4 = FIFO_DEPTH -1) then
					HEAD_1_4<=0;  -- Rest Head
				else
					HEAD_1_4 <= HEAD_1_4 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_5 = '1') then 
				 	  WINDOW(4,2) <= FIFO_ROW_1_5(TAIL_1_5);
				if(TAIL_1_5 = FIFO_DEPTH-1) then
				   	TAIL_1_5<=0;  -- Rest Tail
				elsif (TAIL_1_5 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_5<=TAIL_1_5+1;
				else
				  	 TAIL_1_5<=TAIL_1_5+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_5 = '1') then
					FIFO_ROW_1_5(HEAD_1_5)<= WINDOW(4,1);
				if (HEAD_1_5 = FIFO_DEPTH - 2 and Async_Mode_1_5 = false) then				 
					ReadEn_1_5<='1';
					HEAD_1_5 <= HEAD_1_5 + 1;
					Async_Mode_1_5<= true;
				else if (HEAD_1_5 = FIFO_DEPTH -1) then
					HEAD_1_5<=0;  -- Rest Head
				else
					HEAD_1_5 <= HEAD_1_5 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_6 = '1') then 
				 	  WINDOW(5,2) <= FIFO_ROW_1_6(TAIL_1_6);
				if(TAIL_1_6 = FIFO_DEPTH-1) then
				   	TAIL_1_6<=0;  -- Rest Tail
				elsif (TAIL_1_6 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_6<=TAIL_1_6+1;
				else
				  	 TAIL_1_6<=TAIL_1_6+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_6 = '1') then
					FIFO_ROW_1_6(HEAD_1_6)<= WINDOW(5,1);
				if (HEAD_1_6 = FIFO_DEPTH - 2 and Async_Mode_1_6 = false) then				 
					ReadEn_1_6<='1';
					HEAD_1_6 <= HEAD_1_6 + 1;
					Async_Mode_1_6<= true;
				else if (HEAD_1_6 = FIFO_DEPTH -1) then
					HEAD_1_6<=0;  -- Rest Head
				else
					HEAD_1_6 <= HEAD_1_6 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_7 = '1') then 
				 	  WINDOW(6,2) <= FIFO_ROW_1_7(TAIL_1_7);
				if(TAIL_1_7 = FIFO_DEPTH-1) then
				   	TAIL_1_7<=0;  -- Rest Tail
				elsif (TAIL_1_7 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_7<=TAIL_1_7+1;
				else
				  	 TAIL_1_7<=TAIL_1_7+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_7 = '1') then
					FIFO_ROW_1_7(HEAD_1_7)<= WINDOW(6,1);
				if (HEAD_1_7 = FIFO_DEPTH - 2 and Async_Mode_1_7 = false) then				 
					ReadEn_1_7<='1';
					HEAD_1_7 <= HEAD_1_7 + 1;
					Async_Mode_1_7<= true;
				else if (HEAD_1_7 = FIFO_DEPTH -1) then
					HEAD_1_7<=0;  -- Rest Head
				else
					HEAD_1_7 <= HEAD_1_7 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_8 = '1') then 
				 	  WINDOW(7,2) <= FIFO_ROW_1_8(TAIL_1_8);
				if(TAIL_1_8 = FIFO_DEPTH-1) then
				   	TAIL_1_8<=0;  -- Rest Tail
				elsif (TAIL_1_8 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_8<=TAIL_1_8+1;
				else
				  	 TAIL_1_8<=TAIL_1_8+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_8 = '1') then
					FIFO_ROW_1_8(HEAD_1_8)<= WINDOW(7,1);
				if (HEAD_1_8 = FIFO_DEPTH - 2 and Async_Mode_1_8 = false) then				 
					ReadEn_1_8<='1';
					HEAD_1_8 <= HEAD_1_8 + 1;
					Async_Mode_1_8<= true;
				else if (HEAD_1_8 = FIFO_DEPTH -1) then
					HEAD_1_8<=0;  -- Rest Head
				else
					HEAD_1_8 <= HEAD_1_8 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_9 = '1') then 
				 	  WINDOW(8,2) <= FIFO_ROW_1_9(TAIL_1_9);
				if(TAIL_1_9 = FIFO_DEPTH-1) then
				   	TAIL_1_9<=0;  -- Rest Tail
				elsif (TAIL_1_9 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_9<=TAIL_1_9+1;
				else
				  	 TAIL_1_9<=TAIL_1_9+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_9 = '1') then
					FIFO_ROW_1_9(HEAD_1_9)<= WINDOW(8,1);
				if (HEAD_1_9 = FIFO_DEPTH - 2 and Async_Mode_1_9 = false) then				 
					ReadEn_1_9<='1';
					HEAD_1_9 <= HEAD_1_9 + 1;
					Async_Mode_1_9<= true;
				else if (HEAD_1_9 = FIFO_DEPTH -1) then
					HEAD_1_9<=0;  -- Rest Head
				else
					HEAD_1_9 <= HEAD_1_9 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_10 = '1') then 
				 	  WINDOW(9,2) <= FIFO_ROW_1_10(TAIL_1_10);
				if(TAIL_1_10 = FIFO_DEPTH-1) then
				   	TAIL_1_10<=0;  -- Rest Tail
				elsif (TAIL_1_10 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_10<=TAIL_1_10+1;
				else
				  	 TAIL_1_10<=TAIL_1_10+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_10 = '1') then
					FIFO_ROW_1_10(HEAD_1_10)<= WINDOW(9,1);
				if (HEAD_1_10 = FIFO_DEPTH - 2 and Async_Mode_1_10 = false) then				 
					ReadEn_1_10<='1';
					HEAD_1_10 <= HEAD_1_10 + 1;
					Async_Mode_1_10<= true;
				else if (HEAD_1_10 = FIFO_DEPTH -1) then
					HEAD_1_10<=0;  -- Rest Head
				else
					HEAD_1_10 <= HEAD_1_10 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_11 = '1') then 
				 	  WINDOW(10,2) <= FIFO_ROW_1_11(TAIL_1_11);
				if(TAIL_1_11 = FIFO_DEPTH-1) then
				   	TAIL_1_11<=0;  -- Rest Tail
				elsif (TAIL_1_11 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_11<=TAIL_1_11+1;
				else
				  	 TAIL_1_11<=TAIL_1_11+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_11 = '1') then
					FIFO_ROW_1_11(HEAD_1_11)<= WINDOW(10,1);
				if (HEAD_1_11 = FIFO_DEPTH - 2 and Async_Mode_1_11 = false) then				 
					ReadEn_1_11<='1';
					HEAD_1_11 <= HEAD_1_11 + 1;
					Async_Mode_1_11<= true;
				else if (HEAD_1_11 = FIFO_DEPTH -1) then
					HEAD_1_11<=0;  -- Rest Head
				else
					HEAD_1_11 <= HEAD_1_11 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_12 = '1') then 
				 	  WINDOW(11,2) <= FIFO_ROW_1_12(TAIL_1_12);
				if(TAIL_1_12 = FIFO_DEPTH-1) then
				   	TAIL_1_12<=0;  -- Rest Tail
				elsif (TAIL_1_12 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_12<=TAIL_1_12+1;
				else
				  	 TAIL_1_12<=TAIL_1_12+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_12 = '1') then
					FIFO_ROW_1_12(HEAD_1_12)<= WINDOW(11,1);
				if (HEAD_1_12 = FIFO_DEPTH - 2 and Async_Mode_1_12 = false) then				 
					ReadEn_1_12<='1';
					HEAD_1_12 <= HEAD_1_12 + 1;
					Async_Mode_1_12<= true;
				else if (HEAD_1_12 = FIFO_DEPTH -1) then
					HEAD_1_12<=0;  -- Rest Head
				else
					HEAD_1_12 <= HEAD_1_12 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_13 = '1') then 
				 	  WINDOW(12,2) <= FIFO_ROW_1_13(TAIL_1_13);
				if(TAIL_1_13 = FIFO_DEPTH-1) then
				   	TAIL_1_13<=0;  -- Rest Tail
				elsif (TAIL_1_13 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_13<=TAIL_1_13+1;
				else
				  	 TAIL_1_13<=TAIL_1_13+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_13 = '1') then
					FIFO_ROW_1_13(HEAD_1_13)<= WINDOW(12,1);
				if (HEAD_1_13 = FIFO_DEPTH - 2 and Async_Mode_1_13 = false) then				 
					ReadEn_1_13<='1';
					HEAD_1_13 <= HEAD_1_13 + 1;
					Async_Mode_1_13<= true;
				else if (HEAD_1_13 = FIFO_DEPTH -1) then
					HEAD_1_13<=0;  -- Rest Head
				else
					HEAD_1_13 <= HEAD_1_13 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_14 = '1') then 
				 	  WINDOW(13,2) <= FIFO_ROW_1_14(TAIL_1_14);
				if(TAIL_1_14 = FIFO_DEPTH-1) then
				   	TAIL_1_14<=0;  -- Rest Tail
				elsif (TAIL_1_14 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_14<=TAIL_1_14+1;
				else
				  	 TAIL_1_14<=TAIL_1_14+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_14 = '1') then
					FIFO_ROW_1_14(HEAD_1_14)<= WINDOW(13,1);
				if (HEAD_1_14 = FIFO_DEPTH - 2 and Async_Mode_1_14 = false) then				 
					ReadEn_1_14<='1';
					HEAD_1_14 <= HEAD_1_14 + 1;
					Async_Mode_1_14<= true;
				else if (HEAD_1_14 = FIFO_DEPTH -1) then
					HEAD_1_14<=0;  -- Rest Head
				else
					HEAD_1_14 <= HEAD_1_14 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_15 = '1') then 
				 	  WINDOW(14,2) <= FIFO_ROW_1_15(TAIL_1_15);
				if(TAIL_1_15 = FIFO_DEPTH-1) then
				   	TAIL_1_15<=0;  -- Rest Tail
				elsif (TAIL_1_15 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_15<=TAIL_1_15+1;
				else
				  	 TAIL_1_15<=TAIL_1_15+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_15 = '1') then
					FIFO_ROW_1_15(HEAD_1_15)<= WINDOW(14,1);
				if (HEAD_1_15 = FIFO_DEPTH - 2 and Async_Mode_1_15 = false) then				 
					ReadEn_1_15<='1';
					HEAD_1_15 <= HEAD_1_15 + 1;
					Async_Mode_1_15<= true;
				else if (HEAD_1_15 = FIFO_DEPTH -1) then
					HEAD_1_15<=0;  -- Rest Head
				else
					HEAD_1_15 <= HEAD_1_15 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	           ----------------- Enable Read FIFO-1 START -------------------
				if (ReadEn_1_16 = '1') then 
				 	  WINDOW(15,2) <= FIFO_ROW_1_16(TAIL_1_16);
				if(TAIL_1_16 = FIFO_DEPTH-1) then
				   	TAIL_1_16<=0;  -- Rest Tail
				elsif (TAIL_1_16 = F_SIZE-1) then  Enable_MAX<='1';TAIL_1_16<=TAIL_1_16+1;
				else
				  	 TAIL_1_16<=TAIL_1_16+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1 END -------------------

			----------------- Enable Write to FIFO_1 START --------------	
				if (WriteEn_1_16 = '1') then
					FIFO_ROW_1_16(HEAD_1_16)<= WINDOW(15,1);
				if (HEAD_1_16 = FIFO_DEPTH - 2 and Async_Mode_1_16 = false) then				 
					ReadEn_1_16<='1';
					HEAD_1_16 <= HEAD_1_16 + 1;
					Async_Mode_1_16<= true;
				else if (HEAD_1_16 = FIFO_DEPTH -1) then
					HEAD_1_16<=0;  -- Rest Head
				else
					HEAD_1_16 <= HEAD_1_16 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO-1 END --------------


	      -------------------------------------------- Enable MAX WIN START --------------------------------------------				
	
		if Enable_MAX='1' then
            ------------------FMAP even_0---------------

			if  WINDOW(0,0) > WINDOW(0,1)  then  MAX_D_1(0,0)<= WINDOW(0,0);
			else  MAX_D_1(0,0)<= WINDOW(0,1);end if;
			if  WINDOW(0,2) > WINDOW(0,3)  then  MAX_D_1(0,1)<= WINDOW(0,2);
			else  MAX_D_1(0,1)<= WINDOW(0,3);end if;
            ------------------FMAP even_1---------------

			if  WINDOW(1,0) > WINDOW(1,1)  then  MAX_D_1(1,0)<= WINDOW(1,0);
			else  MAX_D_1(1,0)<= WINDOW(1,1);end if;
			if  WINDOW(1,2) > WINDOW(1,3)  then  MAX_D_1(1,1)<= WINDOW(1,2);
			else  MAX_D_1(1,1)<= WINDOW(1,3);end if;
            ------------------FMAP even_2---------------

			if  WINDOW(2,0) > WINDOW(2,1)  then  MAX_D_1(2,0)<= WINDOW(2,0);
			else  MAX_D_1(2,0)<= WINDOW(2,1);end if;
			if  WINDOW(2,2) > WINDOW(2,3)  then  MAX_D_1(2,1)<= WINDOW(2,2);
			else  MAX_D_1(2,1)<= WINDOW(2,3);end if;
            ------------------FMAP even_3---------------

			if  WINDOW(3,0) > WINDOW(3,1)  then  MAX_D_1(3,0)<= WINDOW(3,0);
			else  MAX_D_1(3,0)<= WINDOW(3,1);end if;
			if  WINDOW(3,2) > WINDOW(3,3)  then  MAX_D_1(3,1)<= WINDOW(3,2);
			else  MAX_D_1(3,1)<= WINDOW(3,3);end if;
            ------------------FMAP even_4---------------

			if  WINDOW(4,0) > WINDOW(4,1)  then  MAX_D_1(4,0)<= WINDOW(4,0);
			else  MAX_D_1(4,0)<= WINDOW(4,1);end if;
			if  WINDOW(4,2) > WINDOW(4,3)  then  MAX_D_1(4,1)<= WINDOW(4,2);
			else  MAX_D_1(4,1)<= WINDOW(4,3);end if;
            ------------------FMAP even_5---------------

			if  WINDOW(5,0) > WINDOW(5,1)  then  MAX_D_1(5,0)<= WINDOW(5,0);
			else  MAX_D_1(5,0)<= WINDOW(5,1);end if;
			if  WINDOW(5,2) > WINDOW(5,3)  then  MAX_D_1(5,1)<= WINDOW(5,2);
			else  MAX_D_1(5,1)<= WINDOW(5,3);end if;
            ------------------FMAP even_6---------------

			if  WINDOW(6,0) > WINDOW(6,1)  then  MAX_D_1(6,0)<= WINDOW(6,0);
			else  MAX_D_1(6,0)<= WINDOW(6,1);end if;
			if  WINDOW(6,2) > WINDOW(6,3)  then  MAX_D_1(6,1)<= WINDOW(6,2);
			else  MAX_D_1(6,1)<= WINDOW(6,3);end if;
            ------------------FMAP even_7---------------

			if  WINDOW(7,0) > WINDOW(7,1)  then  MAX_D_1(7,0)<= WINDOW(7,0);
			else  MAX_D_1(7,0)<= WINDOW(7,1);end if;
			if  WINDOW(7,2) > WINDOW(7,3)  then  MAX_D_1(7,1)<= WINDOW(7,2);
			else  MAX_D_1(7,1)<= WINDOW(7,3);end if;
            ------------------FMAP even_8---------------

			if  WINDOW(8,0) > WINDOW(8,1)  then  MAX_D_1(8,0)<= WINDOW(8,0);
			else  MAX_D_1(8,0)<= WINDOW(8,1);end if;
			if  WINDOW(8,2) > WINDOW(8,3)  then  MAX_D_1(8,1)<= WINDOW(8,2);
			else  MAX_D_1(8,1)<= WINDOW(8,3);end if;
            ------------------FMAP even_9---------------

			if  WINDOW(9,0) > WINDOW(9,1)  then  MAX_D_1(9,0)<= WINDOW(9,0);
			else  MAX_D_1(9,0)<= WINDOW(9,1);end if;
			if  WINDOW(9,2) > WINDOW(9,3)  then  MAX_D_1(9,1)<= WINDOW(9,2);
			else  MAX_D_1(9,1)<= WINDOW(9,3);end if;
            ------------------FMAP even_10---------------

			if  WINDOW(10,0) > WINDOW(10,1)  then  MAX_D_1(10,0)<= WINDOW(10,0);
			else  MAX_D_1(10,0)<= WINDOW(10,1);end if;
			if  WINDOW(10,2) > WINDOW(10,3)  then  MAX_D_1(10,1)<= WINDOW(10,2);
			else  MAX_D_1(10,1)<= WINDOW(10,3);end if;
            ------------------FMAP even_11---------------

			if  WINDOW(11,0) > WINDOW(11,1)  then  MAX_D_1(11,0)<= WINDOW(11,0);
			else  MAX_D_1(11,0)<= WINDOW(11,1);end if;
			if  WINDOW(11,2) > WINDOW(11,3)  then  MAX_D_1(11,1)<= WINDOW(11,2);
			else  MAX_D_1(11,1)<= WINDOW(11,3);end if;
            ------------------FMAP even_12---------------

			if  WINDOW(12,0) > WINDOW(12,1)  then  MAX_D_1(12,0)<= WINDOW(12,0);
			else  MAX_D_1(12,0)<= WINDOW(12,1);end if;
			if  WINDOW(12,2) > WINDOW(12,3)  then  MAX_D_1(12,1)<= WINDOW(12,2);
			else  MAX_D_1(12,1)<= WINDOW(12,3);end if;
            ------------------FMAP even_13---------------

			if  WINDOW(13,0) > WINDOW(13,1)  then  MAX_D_1(13,0)<= WINDOW(13,0);
			else  MAX_D_1(13,0)<= WINDOW(13,1);end if;
			if  WINDOW(13,2) > WINDOW(13,3)  then  MAX_D_1(13,1)<= WINDOW(13,2);
			else  MAX_D_1(13,1)<= WINDOW(13,3);end if;
            ------------------FMAP even_14---------------

			if  WINDOW(14,0) > WINDOW(14,1)  then  MAX_D_1(14,0)<= WINDOW(14,0);
			else  MAX_D_1(14,0)<= WINDOW(14,1);end if;
			if  WINDOW(14,2) > WINDOW(14,3)  then  MAX_D_1(14,1)<= WINDOW(14,2);
			else  MAX_D_1(14,1)<= WINDOW(14,3);end if;
            ------------------FMAP even_15---------------

			if  WINDOW(15,0) > WINDOW(15,1)  then  MAX_D_1(15,0)<= WINDOW(15,0);
			else  MAX_D_1(15,0)<= WINDOW(15,1);end if;
			if  WINDOW(15,2) > WINDOW(15,3)  then  MAX_D_1(15,1)<= WINDOW(15,2);
			else  MAX_D_1(15,1)<= WINDOW(15,3);end if;

			Enable_MX_2<='1';

           ------------------------- Enable MAX STAGES START -------------------------				

            ---------------DEPTH_2---------------
            if Enable_MX_2='1' then 
                if  MAX_D_1(0,0) > MAX_D_1(0,1)  then  MAX_D_2(0,0)<= MAX_D_1(0,0);
                else  MAX_D_2(0,0)<= MAX_D_1(0,1);end if;

                if  MAX_D_1(1,0) > MAX_D_1(1,1)  then  MAX_D_2(1,0)<= MAX_D_1(1,0);
                else  MAX_D_2(1,0)<= MAX_D_1(1,1);end if;

                if  MAX_D_1(2,0) > MAX_D_1(2,1)  then  MAX_D_2(2,0)<= MAX_D_1(2,0);
                else  MAX_D_2(2,0)<= MAX_D_1(2,1);end if;

                if  MAX_D_1(3,0) > MAX_D_1(3,1)  then  MAX_D_2(3,0)<= MAX_D_1(3,0);
                else  MAX_D_2(3,0)<= MAX_D_1(3,1);end if;

                if  MAX_D_1(4,0) > MAX_D_1(4,1)  then  MAX_D_2(4,0)<= MAX_D_1(4,0);
                else  MAX_D_2(4,0)<= MAX_D_1(4,1);end if;

                if  MAX_D_1(5,0) > MAX_D_1(5,1)  then  MAX_D_2(5,0)<= MAX_D_1(5,0);
                else  MAX_D_2(5,0)<= MAX_D_1(5,1);end if;

                if  MAX_D_1(6,0) > MAX_D_1(6,1)  then  MAX_D_2(6,0)<= MAX_D_1(6,0);
                else  MAX_D_2(6,0)<= MAX_D_1(6,1);end if;

                if  MAX_D_1(7,0) > MAX_D_1(7,1)  then  MAX_D_2(7,0)<= MAX_D_1(7,0);
                else  MAX_D_2(7,0)<= MAX_D_1(7,1);end if;

                if  MAX_D_1(8,0) > MAX_D_1(8,1)  then  MAX_D_2(8,0)<= MAX_D_1(8,0);
                else  MAX_D_2(8,0)<= MAX_D_1(8,1);end if;

                if  MAX_D_1(9,0) > MAX_D_1(9,1)  then  MAX_D_2(9,0)<= MAX_D_1(9,0);
                else  MAX_D_2(9,0)<= MAX_D_1(9,1);end if;

                if  MAX_D_1(10,0) > MAX_D_1(10,1)  then  MAX_D_2(10,0)<= MAX_D_1(10,0);
                else  MAX_D_2(10,0)<= MAX_D_1(10,1);end if;

                if  MAX_D_1(11,0) > MAX_D_1(11,1)  then  MAX_D_2(11,0)<= MAX_D_1(11,0);
                else  MAX_D_2(11,0)<= MAX_D_1(11,1);end if;

                if  MAX_D_1(12,0) > MAX_D_1(12,1)  then  MAX_D_2(12,0)<= MAX_D_1(12,0);
                else  MAX_D_2(12,0)<= MAX_D_1(12,1);end if;

                if  MAX_D_1(13,0) > MAX_D_1(13,1)  then  MAX_D_2(13,0)<= MAX_D_1(13,0);
                else  MAX_D_2(13,0)<= MAX_D_1(13,1);end if;

                if  MAX_D_1(14,0) > MAX_D_1(14,1)  then  MAX_D_2(14,0)<= MAX_D_1(14,0);
                else  MAX_D_2(14,0)<= MAX_D_1(14,1);end if;

                if  MAX_D_1(15,0) > MAX_D_1(15,1)  then  MAX_D_2(15,0)<= MAX_D_1(15,0);
                else  MAX_D_2(15,0)<= MAX_D_1(15,1);end if;

			  EN_OUT_BUF<='1';
            end if; -- enable stage


		if SIG_STRIDE>1 and EN_OUT_BUF='1' then
                 SIG_STRIDE<=SIG_STRIDE-1;
               elsif VALID_NXTLYR_PIX<(IMAGE_WIDTH-F_SIZE) then
		 SIG_STRIDE<=STRIDE; end if;

	if  EN_OUT_BUF='1' then
	if SIG_STRIDE>(STRIDE-1) and VALID_ROWS<=(IMAGE_WIDTH-F_SIZE) then  
			DOUT_BUF_1_4<=std_logic_vector(MAX_D_2(0,0));
			DOUT_BUF_2_4<=std_logic_vector(MAX_D_2(1,0));
			DOUT_BUF_3_4<=std_logic_vector(MAX_D_2(2,0));
			DOUT_BUF_4_4<=std_logic_vector(MAX_D_2(3,0));
			DOUT_BUF_5_4<=std_logic_vector(MAX_D_2(4,0));
			DOUT_BUF_6_4<=std_logic_vector(MAX_D_2(5,0));
			DOUT_BUF_7_4<=std_logic_vector(MAX_D_2(6,0));
			DOUT_BUF_8_4<=std_logic_vector(MAX_D_2(7,0));
			DOUT_BUF_9_4<=std_logic_vector(MAX_D_2(8,0));
			DOUT_BUF_10_4<=std_logic_vector(MAX_D_2(9,0));
			DOUT_BUF_11_4<=std_logic_vector(MAX_D_2(10,0));
			DOUT_BUF_12_4<=std_logic_vector(MAX_D_2(11,0));
			DOUT_BUF_13_4<=std_logic_vector(MAX_D_2(12,0));
			DOUT_BUF_14_4<=std_logic_vector(MAX_D_2(13,0));
			DOUT_BUF_15_4<=std_logic_vector(MAX_D_2(14,0));
			DOUT_BUF_16_4<=std_logic_vector(MAX_D_2(15,0));
			EN_NXT_LYR_4<='1';
			FRST_TIM_EN_4<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
           EN_NXT_LYR_4<='0';
           DOUT_BUF_1_4<=(others => '0');
           DOUT_BUF_2_4<=(others => '0');
           DOUT_BUF_3_4<=(others => '0');
           DOUT_BUF_4_4<=(others => '0');
           DOUT_BUF_5_4<=(others => '0');
           DOUT_BUF_6_4<=(others => '0');
           DOUT_BUF_7_4<=(others => '0');
           DOUT_BUF_8_4<=(others => '0');
           DOUT_BUF_9_4<=(others => '0');
           DOUT_BUF_10_4<=(others => '0');
           DOUT_BUF_11_4<=(others => '0');
           DOUT_BUF_12_4<=(others => '0');
           DOUT_BUF_13_4<=(others => '0');
           DOUT_BUF_14_4<=(others => '0');
           DOUT_BUF_15_4<=(others => '0');
           DOUT_BUF_16_4<=(others => '0');

		end if; -- end Validnxt layer

			if VALID_ROWS=((IMAGE_WIDTH*STRIDE)-1) then VALID_ROWS<=0;SIG_STRIDE<=STRIDE;   -- reset sride and valid pixels
			else VALID_ROWS<=VALID_ROWS+1;end if;
			end if;  -- enable BUFOUT



		end if;	-- END MAX


elsif OUT_PIXEL_COUNT>=VALID_CYCLES  then INTERNAL_RST<='1';SIG_STRIDE<=STRIDE;EN_NXT_LYR_4<='1';  -- order is very important
else  EN_NXT_LYR_4<='0';-- In case stream stopped

end if; -- end enable_condition 
end if; -- for RST	
end if; -- rising edge
end process LAYER_4;

EN_STREAM_OUT_4<= EN_STREAM_OUT_5;
VALID_OUT_4<= VALID_OUT_5;
DOUT_1_4<=DOUT_1_5;
DOUT_2_4<=DOUT_2_5;
DOUT_3_4<=DOUT_3_5;
DOUT_4_4<=DOUT_4_5;
DOUT_5_4<=DOUT_5_5;
DOUT_6_4<=DOUT_6_5;
DOUT_7_4<=DOUT_7_5;
DOUT_8_4<=DOUT_8_5;
DOUT_9_4<=DOUT_9_5;
DOUT_10_4<=DOUT_10_5;

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

