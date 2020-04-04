------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Sat Apr 04 01:57:36 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    CONV - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Number of Total Operaiton: 50
-- Number of Clock Cycles: 7
-- Number of GOPS = 0.0
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity CONV_LAYER_3 is

GENERIC
 	( 
	constant PERCISION      : positive := 5; 	
	constant DOUT_WIDTH     : positive := 5; 	
	constant BIAS_SIZE      : positive := 5;	
	constant MULT_SIZE      : positive := 10;	
	constant DIN_WIDTH      : positive := 5;	
	constant IMAGE_WIDTH    : positive := 7;	
	constant IMAGE_SIZE     : positive := 225;	
	constant F_SIZE         : positive := 2;	
	constant WEIGHT_SIZE    : positive := 5;	
	constant BIASES_SIZE	: positive := 2;
	constant PADDING        : positive := 1;	
	constant STRIDE         : positive := 1;	
	constant FEATURE_MAPS   : positive := 5;	
	constant VALID_CYCLES   : positive := 36;	
	constant STRIDE_CYCLES  : positive := 6;	
	constant VALID_LOCAL_PIX: positive := 6;	
	constant ADD_TREE_DEPTH : positive := 2;	
	constant INPUT_DEPTH    : positive := 2;
	constant FIFO_DEPTH     : positive := 6;	
	constant USED_FIFOS     : positive := 1;	
	constant MULT_SUM_D_1   : positive := 2;
	constant MULT_SUM_SIZE_1: positive := 6;
	constant MULT_SUM_D_2   : positive := 1;
	constant MULT_SUM_SIZE_2: positive := 6;
	constant ADD_1        : positive := 2;    	
	constant ADD_SIZE_1   : positive := 6;   	
	constant ADD_2        : positive := 1;    	
	constant ADD_SIZE_2   : positive := 6;   	
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN_1_3         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_2_3         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	DIN_3_3         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
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

end CONV_LAYER_3;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of CONV_LAYER_3 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(WEIGHT_SIZE- 1 downto 0);
type       FIFO_Memory             is array (0 to FIFO_DEPTH - 1)          of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
type       SLIDING_WINDOW          is array (0 to F_SIZE-1, 0 to F_SIZE-1) of STD_LOGIC_VECTOR(DIN_WIDTH- 1 downto 0);
signal     VALID_NXTLYR_PIX        :integer range 0 to STRIDE_CYCLES;
signal     PIXEL_COUNT             :integer range 0 to VALID_CYCLES;
signal     OUT_PIXEL_COUNT         :integer range 0 to VALID_CYCLES;
signal     EN_NXT_LYR_3            :std_logic;
signal     FRST_TIM_EN_3           :std_logic;
signal     Enable_MULT             :std_logic;
signal     Enable_ADDER            :std_logic;
signal     Enable_ReLU             :std_logic;
signal     Enable_BIAS             :std_logic;
signal     SIG_STRIDE              :integer range 0 to IMAGE_SIZE;
signal     PADDING_count           :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     ROW_COUNT               :integer range 0 to IMAGE_SIZE; -- TEMPORARY
signal     WINDOW_1:SLIDING_WINDOW; 
signal     WINDOW_2:SLIDING_WINDOW; 
signal     WINDOW_3:SLIDING_WINDOW; 


------------------------------ INTERNAL DYNAMIC SIGNALS DECLARATION ARRAY TYPE- START---------------------------------------------

type    AADD_DEPTH_1	is array (0 to ADD_1-1, 0 to FEATURE_MAPS-1 ) of signed(ADD_SIZE_1- 1 downto 0);
signal  ADD_DEPTH_1:AADD_DEPTH_1;
signal  Enable_STAGE_1	: std_logic;
type    AADD_DEPTH_2	is array (0 to ADD_2-1, 0 to FEATURE_MAPS-1 ) of signed(ADD_SIZE_2- 1 downto 0);
signal  ADD_DEPTH_2:AADD_DEPTH_2;
signal  Enable_STAGE_2	: std_logic;


------------------------------------------------------ MULT SUMMATION DECLARATION-----------------------------------------------------------
type    MULT_X_SUM_1	is array (0 to F_SIZE-1, 0 to F_SIZE-1 ) of signed(MULT_SUM_SIZE_1- 1 downto 0);
signal  EN_SUM_MULT_1	: std_logic;
signal  MULTS_1_1_1:MULT_X_SUM_1;
signal  MULTS_1_1_2:MULT_X_SUM_1;
signal  MULTS_1_1_3:MULT_X_SUM_1;
signal  MULTS_1_2_1:MULT_X_SUM_1;
signal  MULTS_1_2_2:MULT_X_SUM_1;
signal  MULTS_1_2_3:MULT_X_SUM_1;
signal  MULTS_1_3_1:MULT_X_SUM_1;
signal  MULTS_1_3_2:MULT_X_SUM_1;
signal  MULTS_1_3_3:MULT_X_SUM_1;
signal  MULTS_1_4_1:MULT_X_SUM_1;
signal  MULTS_1_4_2:MULT_X_SUM_1;
signal  MULTS_1_4_3:MULT_X_SUM_1;
signal  MULTS_1_5_1:MULT_X_SUM_1;
signal  MULTS_1_5_2:MULT_X_SUM_1;
signal  MULTS_1_5_3:MULT_X_SUM_1;
type    MULT_X_SUM_2	is array (0 to F_SIZE-1, 0 to F_SIZE-1 ) of signed(MULT_SUM_SIZE_2- 1 downto 0);
signal  EN_SUM_MULT_2	: std_logic;
signal  MULTS_2_1_1:MULT_X_SUM_2;
signal  MULTS_2_1_2:MULT_X_SUM_2;
signal  MULTS_2_1_3:MULT_X_SUM_2;
signal  MULTS_2_2_1:MULT_X_SUM_2;
signal  MULTS_2_2_2:MULT_X_SUM_2;
signal  MULTS_2_2_3:MULT_X_SUM_2;
signal  MULTS_2_3_1:MULT_X_SUM_2;
signal  MULTS_2_3_2:MULT_X_SUM_2;
signal  MULTS_2_3_3:MULT_X_SUM_2;
signal  MULTS_2_4_1:MULT_X_SUM_2;
signal  MULTS_2_4_2:MULT_X_SUM_2;
signal  MULTS_2_4_3:MULT_X_SUM_2;
signal  MULTS_2_5_1:MULT_X_SUM_2;
signal  MULTS_2_5_2:MULT_X_SUM_2;
signal  MULTS_2_5_3:MULT_X_SUM_2;

type   MULT_X		is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(MULT_SIZE-1 downto 0);
signal MULT_1_1:MULT_X;signal MULT_1_2:MULT_X;signal MULT_1_3:MULT_X;
signal DOUT_BUF_1_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_1		: signed(BIAS_SIZE-1   downto 0);
signal ReLU_1		: signed(BIAS_SIZE-1   downto 0);

signal MULT_2_1:MULT_X;signal MULT_2_2:MULT_X;signal MULT_2_3:MULT_X;
signal DOUT_BUF_2_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_2		: signed(BIAS_SIZE-1   downto 0);
signal ReLU_2		: signed(BIAS_SIZE-1   downto 0);

signal MULT_3_1:MULT_X;signal MULT_3_2:MULT_X;signal MULT_3_3:MULT_X;
signal DOUT_BUF_3_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_3		: signed(BIAS_SIZE-1   downto 0);
signal ReLU_3		: signed(BIAS_SIZE-1   downto 0);

signal MULT_4_1:MULT_X;signal MULT_4_2:MULT_X;signal MULT_4_3:MULT_X;
signal DOUT_BUF_4_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_4		: signed(BIAS_SIZE-1   downto 0);
signal ReLU_4		: signed(BIAS_SIZE-1   downto 0);

signal MULT_5_1:MULT_X;signal MULT_5_2:MULT_X;signal MULT_5_3:MULT_X;
signal DOUT_BUF_5_3	: std_logic_vector(LOCAL_OUTPUT-1 downto 0);
signal BIAS_5		: signed(BIAS_SIZE-1   downto 0);
signal ReLU_5		: signed(BIAS_SIZE-1   downto 0);



------------------------------------------------------ FIFO_1_1 DECLARATION---------------------------------------------------------
signal FIFO_1_ROW_1  	: FIFO_Memory;
signal HEAD_1_1       : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_1_1       : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_1_1	: std_logic;
signal ReadEn_1_1 	: std_logic;
signal Async_Mode_1_1 : boolean;

------------------------------------------------------ FIFO_2_1 DECLARATION---------------------------------------------------------
signal FIFO_2_ROW_1  	: FIFO_Memory;
signal HEAD_2_1       : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_2_1       : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_2_1	: std_logic;
signal ReadEn_2_1 	: std_logic;
signal Async_Mode_2_1 : boolean;

------------------------------------------------------ FIFO_3_1 DECLARATION---------------------------------------------------------
signal FIFO_3_ROW_1  	: FIFO_Memory;
signal HEAD_3_1       : natural range 0 to FIFO_DEPTH - 1;
signal TAIL_3_1       : natural range 0 to FIFO_DEPTH - 1;
signal WriteEn_3_1	: std_logic;
signal ReadEn_3_1 	: std_logic;
signal Async_Mode_3_1 : boolean;


-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_4          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_2_4          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal EN_STREAM_OUT_4	 : std_logic;
signal VALID_OUT_4       : std_logic;

--------------------------------------------- FILTER HARDCODED CONSTANTS -WEIGHTS START--------------------------------

constant FMAP_1_1: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_2_1: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_3_1: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_1_2: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_2_2: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_3_2: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_1_3: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_2_3: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_3_3: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_1_4: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_2_4: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_3_4: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_1_5: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_2_5: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );

constant FMAP_3_5: FILTER_TYPE:=		(("00001","00010"),
                                     ("00011","00010")
                                    );


constant BIAS_VAL_1: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_2: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_3: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_4: signed (BIASES_SIZE-1 downto 0):="01";
constant BIAS_VAL_5: signed (BIASES_SIZE-1 downto 0):="01";


---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT POOL_LAYER_4
    port(	CLK,RST			:IN std_logic;
		DIN_1_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_2_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_3_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_4_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		DIN_5_4		:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
		EN_STREAM_OUT_4	:OUT std_logic;
		VALID_OUT_4		:OUT std_logic;
		DOUT_1_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_2_4        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		EN_STREAM		:IN std_logic;
		EN_LOC_STREAM_4	:IN std_logic
      			);
END COMPONENT POOL_LAYER_4;

begin

POOL_LYR_4 : POOL_LAYER_4 
          port map(
          CLK                 => CLK,
          RST                 => RST,
          DIN_1_4             => DOUT_BUF_1_3,
          DIN_2_4             => DOUT_BUF_2_3,
          DIN_3_4             => DOUT_BUF_3_3,
          DIN_4_4             => DOUT_BUF_4_3,
          DIN_5_4             => DOUT_BUF_5_3,
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
    Enable_MULT<='0';Enable_ADDER<='0';Enable_ReLU<='0';Enable_BIAS<='0';
    INTERNAL_RST<='0';PADDING_count<=0;ROW_COUNT<=0;SIG_STRIDE<=STRIDE;

-------------------DYNAMIC SIGNALS RESET------------------------
    WINDOW_1<=((others=> (others=> (others=>'0'))));
    WINDOW_2<=((others=> (others=> (others=>'0'))));
    WINDOW_3<=((others=> (others=> (others=>'0'))));

    MULTS_1_1_1<=((others=> (others=> (others=>'0'))));
    MULTS_1_1_2<=((others=> (others=> (others=>'0'))));
    MULTS_1_1_3<=((others=> (others=> (others=>'0'))));
    MULTS_1_2_1<=((others=> (others=> (others=>'0'))));
    MULTS_1_2_2<=((others=> (others=> (others=>'0'))));
    MULTS_1_2_3<=((others=> (others=> (others=>'0'))));
    MULTS_1_3_1<=((others=> (others=> (others=>'0'))));
    MULTS_1_3_2<=((others=> (others=> (others=>'0'))));
    MULTS_1_3_3<=((others=> (others=> (others=>'0'))));
    MULTS_1_4_1<=((others=> (others=> (others=>'0'))));
    MULTS_1_4_2<=((others=> (others=> (others=>'0'))));
    MULTS_1_4_3<=((others=> (others=> (others=>'0'))));
    EN_SUM_MULT_1<='0';
    MULTS_1_1_1<=((others=> (others=> (others=>'0'))));
    MULTS_1_1_2<=((others=> (others=> (others=>'0'))));
    MULTS_1_1_3<=((others=> (others=> (others=>'0'))));
    MULTS_1_2_1<=((others=> (others=> (others=>'0'))));
    MULTS_1_2_2<=((others=> (others=> (others=>'0'))));
    MULTS_1_2_3<=((others=> (others=> (others=>'0'))));
    MULTS_1_3_1<=((others=> (others=> (others=>'0'))));
    MULTS_1_3_2<=((others=> (others=> (others=>'0'))));
    MULTS_1_3_3<=((others=> (others=> (others=>'0'))));
    MULTS_1_4_1<=((others=> (others=> (others=>'0'))));
    MULTS_1_4_2<=((others=> (others=> (others=>'0'))));
    MULTS_1_4_3<=((others=> (others=> (others=>'0'))));
    MULTS_2_1_1<=((others=> (others=> (others=>'0'))));
    MULTS_2_1_2<=((others=> (others=> (others=>'0'))));
    MULTS_2_1_3<=((others=> (others=> (others=>'0'))));
    MULTS_2_2_1<=((others=> (others=> (others=>'0'))));
    MULTS_2_2_2<=((others=> (others=> (others=>'0'))));
    MULTS_2_2_3<=((others=> (others=> (others=>'0'))));
    MULTS_2_3_1<=((others=> (others=> (others=>'0'))));
    MULTS_2_3_2<=((others=> (others=> (others=>'0'))));
    MULTS_2_3_3<=((others=> (others=> (others=>'0'))));
    MULTS_2_4_1<=((others=> (others=> (others=>'0'))));
    MULTS_2_4_2<=((others=> (others=> (others=>'0'))));
    MULTS_2_4_3<=((others=> (others=> (others=>'0'))));
    EN_SUM_MULT_2<='0';

    ADD_DEPTH_1<=((others=> (others=> (others=>'0'))));Enable_STAGE_1<='0';
    ADD_DEPTH_2<=((others=> (others=> (others=>'0'))));Enable_STAGE_2<='0';

    MULT_1_1<=((others=> (others=> (others=>'0'))));    MULT_1_2<=((others=> (others=> (others=>'0'))));    MULT_1_3<=((others=> (others=> (others=>'0'))));
    DOUT_BUF_1_3<=(others => '0');BIAS_1<=(others => '0');ReLU_1<=(others => '0');
    MULT_2_1<=((others=> (others=> (others=>'0'))));    MULT_2_2<=((others=> (others=> (others=>'0'))));    MULT_2_3<=((others=> (others=> (others=>'0'))));
    DOUT_BUF_2_3<=(others => '0');BIAS_2<=(others => '0');ReLU_2<=(others => '0');
    MULT_3_1<=((others=> (others=> (others=>'0'))));    MULT_3_2<=((others=> (others=> (others=>'0'))));    MULT_3_3<=((others=> (others=> (others=>'0'))));
    DOUT_BUF_3_3<=(others => '0');BIAS_3<=(others => '0');ReLU_3<=(others => '0');
    MULT_4_1<=((others=> (others=> (others=>'0'))));    MULT_4_2<=((others=> (others=> (others=>'0'))));    MULT_4_3<=((others=> (others=> (others=>'0'))));
    DOUT_BUF_4_3<=(others => '0');BIAS_4<=(others => '0');ReLU_4<=(others => '0');
    MULT_5_1<=((others=> (others=> (others=>'0'))));    MULT_5_2<=((others=> (others=> (others=>'0'))));    MULT_5_3<=((others=> (others=> (others=>'0'))));
    DOUT_BUF_5_3<=(others => '0');BIAS_5<=(others => '0');ReLU_5<=(others => '0');

----------------- FIFO_1_1 RESET---------------
    FIFO_1_ROW_1<= ((others=> (others=>'0')));HEAD_1_1<=0;TAIL_1_1<=0;
    WriteEn_1_1<= '0';ReadEn_1_1<= '0';Async_Mode_1_1<= false;

----------------- FIFO_2_1 RESET---------------
    FIFO_2_ROW_1<= ((others=> (others=>'0')));HEAD_2_1<=0;TAIL_2_1<=0;
    WriteEn_2_1<= '0';ReadEn_2_1<= '0';Async_Mode_2_1<= false;

----------------- FIFO_3_1 RESET---------------
    FIFO_3_ROW_1<= ((others=> (others=>'0')));HEAD_3_1<=0;TAIL_3_1<=0;
    WriteEn_3_1<= '0';ReadEn_3_1<= '0';Async_Mode_3_1<= false;




------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_3='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_3='1' then EN_NXT_LYR_3<='1';end if;


               WINDOW_1(0,0)<=DIN_1_3;
               WINDOW_1(0,1)<=WINDOW_1(0,0);

               WINDOW_1(1,1)<=WINDOW_1(1,0);



               WINDOW_2(0,0)<=DIN_2_3;
               WINDOW_2(0,1)<=WINDOW_2(0,0);

               WINDOW_2(1,1)<=WINDOW_2(1,0);



               WINDOW_3(0,0)<=DIN_3_3;
               WINDOW_3(0,1)<=WINDOW_3(0,0);

               WINDOW_3(1,1)<=WINDOW_3(1,0);


                if PIXEL_COUNT=(F_SIZE-1) then
                WriteEn_1_1 <= '1';
                WriteEn_2_1 <= '1';
                WriteEn_3_1 <= '1';
                else
                PIXEL_COUNT<=PIXEL_COUNT+1;
                end if;

           ----------------- Enable Read FIFO-1-1 START -------------------
				if (ReadEn_1_1 = '1') then 
				 	  WINDOW_1(1,0) <= FIFO_1_ROW_1(TAIL_1_1);
				if(TAIL_1_1 = FIFO_DEPTH-1) then
				   	TAIL_1_1<=0;  -- Rest Tail
				elsif (TAIL_1_1 = F_SIZE-1) then Enable_MULT<='1'; TAIL_1_1<=TAIL_1_1+1;
				else
				  	 TAIL_1_1<=TAIL_1_1+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_1_1 END -------------------

			----------------- Enable Write to FIFO_1_1 START --------------	
				if (WriteEn_1_1 = '1') then
					FIFO_1_ROW_1(HEAD_1_1)<= WINDOW_1(0,1);
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
			----------------- Enable Write to FIFO_1-1 END --------------


	

           ----------------- Enable Read FIFO-2-1 START -------------------
				if (ReadEn_2_1 = '1') then 
				 	  WINDOW_2(1,0) <= FIFO_2_ROW_1(TAIL_2_1);
				if(TAIL_2_1 = FIFO_DEPTH-1) then
				   	TAIL_2_1<=0;  -- Rest Tail
				elsif (TAIL_2_1 = F_SIZE-1) then Enable_MULT<='1'; TAIL_2_1<=TAIL_2_1+1;
				else
				  	 TAIL_2_1<=TAIL_2_1+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_2_1 END -------------------

			----------------- Enable Write to FIFO_2_1 START --------------	
				if (WriteEn_2_1 = '1') then
					FIFO_2_ROW_1(HEAD_2_1)<= WINDOW_2(0,1);
				if (HEAD_2_1 = FIFO_DEPTH - 2 and Async_Mode_2_1 = false) then				 
					ReadEn_2_1<='1';
					HEAD_2_1 <= HEAD_2_1 + 1;
					Async_Mode_2_1<= true;
				else if (HEAD_2_1 = FIFO_DEPTH -1) then
					HEAD_2_1<=0;  -- Rest Head
				else
					HEAD_2_1 <= HEAD_2_1 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO_2-1 END --------------


	

           ----------------- Enable Read FIFO-3-1 START -------------------
				if (ReadEn_3_1 = '1') then 
				 	  WINDOW_3(1,0) <= FIFO_3_ROW_1(TAIL_3_1);
				if(TAIL_3_1 = FIFO_DEPTH-1) then
				   	TAIL_3_1<=0;  -- Rest Tail
				elsif (TAIL_3_1 = F_SIZE-1) then Enable_MULT<='1'; TAIL_3_1<=TAIL_3_1+1;
				else
				  	 TAIL_3_1<=TAIL_3_1+1;
				end if;
				end if;	
			----------------- Enable Read FIFO_3_1 END -------------------

			----------------- Enable Write to FIFO_3_1 START --------------	
				if (WriteEn_3_1 = '1') then
					FIFO_3_ROW_1(HEAD_3_1)<= WINDOW_3(0,1);
				if (HEAD_3_1 = FIFO_DEPTH - 2 and Async_Mode_3_1 = false) then				 
					ReadEn_3_1<='1';
					HEAD_3_1 <= HEAD_3_1 + 1;
					Async_Mode_3_1<= true;
				else if (HEAD_3_1 = FIFO_DEPTH -1) then
					HEAD_3_1<=0;  -- Rest Head
				else
					HEAD_3_1 <= HEAD_3_1 + 1;
				end if;
				end if;
				end if;
			----------------- Enable Write to FIFO_3-1 END --------------


	

      -------------------------------------------- Enable MULT START --------------------------------------------				
	
		if Enable_MULT='1' then
			------------------------ NAME OF MULT CORROSPONDS TO WEIGHT INDEX------------------------
			MULT_1_1(0,0)<=signed(WINDOW_1(1,1))*signed(FMAP_1_1(0,0));
			MULT_1_2(0,0)<=signed(WINDOW_2(1,1))*signed(FMAP_2_1(0,0));
			MULT_1_3(0,0)<=signed(WINDOW_3(1,1))*signed(FMAP_3_1(0,0));
			------------------------- END FMAP(1) ---------------------
			MULT_2_1(0,0)<=signed(WINDOW_1(1,1))*signed(FMAP_1_2(0,0));
			MULT_2_2(0,0)<=signed(WINDOW_2(1,1))*signed(FMAP_2_2(0,0));
			MULT_2_3(0,0)<=signed(WINDOW_3(1,1))*signed(FMAP_3_2(0,0));
			------------------------- END FMAP(2) ---------------------
			MULT_3_1(0,0)<=signed(WINDOW_1(1,1))*signed(FMAP_1_3(0,0));
			MULT_3_2(0,0)<=signed(WINDOW_2(1,1))*signed(FMAP_2_3(0,0));
			MULT_3_3(0,0)<=signed(WINDOW_3(1,1))*signed(FMAP_3_3(0,0));
			------------------------- END FMAP(3) ---------------------
			MULT_4_1(0,0)<=signed(WINDOW_1(1,1))*signed(FMAP_1_4(0,0));
			MULT_4_2(0,0)<=signed(WINDOW_2(1,1))*signed(FMAP_2_4(0,0));
			MULT_4_3(0,0)<=signed(WINDOW_3(1,1))*signed(FMAP_3_4(0,0));
			------------------------- END FMAP(4) ---------------------
			MULT_5_1(0,0)<=signed(WINDOW_1(1,1))*signed(FMAP_1_5(0,0));
			MULT_5_2(0,0)<=signed(WINDOW_2(1,1))*signed(FMAP_2_5(0,0));
			MULT_5_3(0,0)<=signed(WINDOW_3(1,1))*signed(FMAP_3_5(0,0));
			------------------------- END FMAP(5) ---------------------
			-------------------------END OF INDEX(0,0) -----------------------

			MULT_1_1(0,1)<=signed(WINDOW_1(1,0))*signed(FMAP_1_1(0,1));
			MULT_1_2(0,1)<=signed(WINDOW_2(1,0))*signed(FMAP_2_1(0,1));
			MULT_1_3(0,1)<=signed(WINDOW_3(1,0))*signed(FMAP_3_1(0,1));
			------------------------- END FMAP(1) ---------------------
			MULT_2_1(0,1)<=signed(WINDOW_1(1,0))*signed(FMAP_1_2(0,1));
			MULT_2_2(0,1)<=signed(WINDOW_2(1,0))*signed(FMAP_2_2(0,1));
			MULT_2_3(0,1)<=signed(WINDOW_3(1,0))*signed(FMAP_3_2(0,1));
			------------------------- END FMAP(2) ---------------------
			MULT_3_1(0,1)<=signed(WINDOW_1(1,0))*signed(FMAP_1_3(0,1));
			MULT_3_2(0,1)<=signed(WINDOW_2(1,0))*signed(FMAP_2_3(0,1));
			MULT_3_3(0,1)<=signed(WINDOW_3(1,0))*signed(FMAP_3_3(0,1));
			------------------------- END FMAP(3) ---------------------
			MULT_4_1(0,1)<=signed(WINDOW_1(1,0))*signed(FMAP_1_4(0,1));
			MULT_4_2(0,1)<=signed(WINDOW_2(1,0))*signed(FMAP_2_4(0,1));
			MULT_4_3(0,1)<=signed(WINDOW_3(1,0))*signed(FMAP_3_4(0,1));
			------------------------- END FMAP(4) ---------------------
			MULT_5_1(0,1)<=signed(WINDOW_1(1,0))*signed(FMAP_1_5(0,1));
			MULT_5_2(0,1)<=signed(WINDOW_2(1,0))*signed(FMAP_2_5(0,1));
			MULT_5_3(0,1)<=signed(WINDOW_3(1,0))*signed(FMAP_3_5(0,1));
			------------------------- END FMAP(5) ---------------------
			-------------------------END OF INDEX(0,1) -----------------------

			MULT_1_1(1,0)<=signed(WINDOW_1(0,1))*signed(FMAP_1_1(1,0));
			MULT_1_2(1,0)<=signed(WINDOW_2(0,1))*signed(FMAP_2_1(1,0));
			MULT_1_3(1,0)<=signed(WINDOW_3(0,1))*signed(FMAP_3_1(1,0));
			------------------------- END FMAP(1) ---------------------
			MULT_2_1(1,0)<=signed(WINDOW_1(0,1))*signed(FMAP_1_2(1,0));
			MULT_2_2(1,0)<=signed(WINDOW_2(0,1))*signed(FMAP_2_2(1,0));
			MULT_2_3(1,0)<=signed(WINDOW_3(0,1))*signed(FMAP_3_2(1,0));
			------------------------- END FMAP(2) ---------------------
			MULT_3_1(1,0)<=signed(WINDOW_1(0,1))*signed(FMAP_1_3(1,0));
			MULT_3_2(1,0)<=signed(WINDOW_2(0,1))*signed(FMAP_2_3(1,0));
			MULT_3_3(1,0)<=signed(WINDOW_3(0,1))*signed(FMAP_3_3(1,0));
			------------------------- END FMAP(3) ---------------------
			MULT_4_1(1,0)<=signed(WINDOW_1(0,1))*signed(FMAP_1_4(1,0));
			MULT_4_2(1,0)<=signed(WINDOW_2(0,1))*signed(FMAP_2_4(1,0));
			MULT_4_3(1,0)<=signed(WINDOW_3(0,1))*signed(FMAP_3_4(1,0));
			------------------------- END FMAP(4) ---------------------
			MULT_5_1(1,0)<=signed(WINDOW_1(0,1))*signed(FMAP_1_5(1,0));
			MULT_5_2(1,0)<=signed(WINDOW_2(0,1))*signed(FMAP_2_5(1,0));
			MULT_5_3(1,0)<=signed(WINDOW_3(0,1))*signed(FMAP_3_5(1,0));
			------------------------- END FMAP(5) ---------------------
			-------------------------END OF INDEX(1,0) -----------------------

			MULT_1_1(1,1)<=signed(WINDOW_1(0,0))*signed(FMAP_1_1(1,1));
			MULT_1_2(1,1)<=signed(WINDOW_2(0,0))*signed(FMAP_2_1(1,1));
			MULT_1_3(1,1)<=signed(WINDOW_3(0,0))*signed(FMAP_3_1(1,1));
			------------------------- END FMAP(1) ---------------------
			MULT_2_1(1,1)<=signed(WINDOW_1(0,0))*signed(FMAP_1_2(1,1));
			MULT_2_2(1,1)<=signed(WINDOW_2(0,0))*signed(FMAP_2_2(1,1));
			MULT_2_3(1,1)<=signed(WINDOW_3(0,0))*signed(FMAP_3_2(1,1));
			------------------------- END FMAP(2) ---------------------
			MULT_3_1(1,1)<=signed(WINDOW_1(0,0))*signed(FMAP_1_3(1,1));
			MULT_3_2(1,1)<=signed(WINDOW_2(0,0))*signed(FMAP_2_3(1,1));
			MULT_3_3(1,1)<=signed(WINDOW_3(0,0))*signed(FMAP_3_3(1,1));
			------------------------- END FMAP(3) ---------------------
			MULT_4_1(1,1)<=signed(WINDOW_1(0,0))*signed(FMAP_1_4(1,1));
			MULT_4_2(1,1)<=signed(WINDOW_2(0,0))*signed(FMAP_2_4(1,1));
			MULT_4_3(1,1)<=signed(WINDOW_3(0,0))*signed(FMAP_3_4(1,1));
			------------------------- END FMAP(4) ---------------------
			MULT_5_1(1,1)<=signed(WINDOW_1(0,0))*signed(FMAP_1_5(1,1));
			MULT_5_2(1,1)<=signed(WINDOW_2(0,0))*signed(FMAP_2_5(1,1));
			MULT_5_3(1,1)<=signed(WINDOW_3(0,0))*signed(FMAP_3_5(1,1));
			------------------------- END FMAP(5) ---------------------
			-------------------------END OF INDEX(1,1) -----------------------


			EN_SUM_MULT_1<='1';	
		end if;

		------------------------- Enable SUM_MULT START -----------------------
		if EN_SUM_MULT_1 = '1' then
			------------------------------------STAGE-1--------------------------------------
			MULTS_1_1_1(0,0)<=signed(MULT_1_1(0,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_2_1(0,0)<=signed(MULT_2_1(0,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_3_1(0,0)<=signed(MULT_3_1(0,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_4_1(0,0)<=signed(MULT_4_1(0,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_5_1(0,0)<=signed(MULT_5_1(0,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));

			MULTS_1_1_1(0,1)<=signed(MULT_1_1(0,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_2_1(0,1)<=signed(MULT_2_1(0,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_3_1(0,1)<=signed(MULT_3_1(0,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_4_1(0,1)<=signed(MULT_4_1(0,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_5_1(0,1)<=signed(MULT_5_1(0,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));

			MULTS_1_1_1(1,0)<=signed(MULT_1_1(1,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_2_1(1,0)<=signed(MULT_2_1(1,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_3_1(1,0)<=signed(MULT_3_1(1,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_4_1(1,0)<=signed(MULT_4_1(1,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_5_1(1,0)<=signed(MULT_5_1(1,0)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));

			MULTS_1_1_1(1,1)<=signed(MULT_1_1(1,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_2_1(1,1)<=signed(MULT_2_1(1,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_3_1(1,1)<=signed(MULT_3_1(1,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_4_1(1,1)<=signed(MULT_4_1(1,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));
			MULTS_1_5_1(1,1)<=signed(MULT_5_1(1,1)(MULT_SIZE-2 downto MULT_SIZE-PERCISION-2));

			MULTS_1_1_2(0,0)<=signed(MULT_1_2(0,0)(MULT_SIZE-1) & MULT_1_2(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_1_2(0,0)(MULT_SIZE-1) & MULT_1_3(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(1) ------------------

			MULTS_1_2_2(0,0)<=signed(MULT_2_2(0,0)(MULT_SIZE-1) & MULT_2_2(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_2_2(0,0)(MULT_SIZE-1) & MULT_2_3(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(2) ------------------

			MULTS_1_3_2(0,0)<=signed(MULT_3_2(0,0)(MULT_SIZE-1) & MULT_3_2(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_3_2(0,0)(MULT_SIZE-1) & MULT_3_3(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(3) ------------------

			MULTS_1_4_2(0,0)<=signed(MULT_4_2(0,0)(MULT_SIZE-1) & MULT_4_2(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_4_2(0,0)(MULT_SIZE-1) & MULT_4_3(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(4) ------------------

			MULTS_1_5_2(0,0)<=signed(MULT_5_2(0,0)(MULT_SIZE-1) & MULT_5_2(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_5_2(0,0)(MULT_SIZE-1) & MULT_5_3(0,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(5) ------------------

                            -----------------------END OF INDEX(0,0) ------------------

			MULTS_1_1_2(0,1)<=signed(MULT_1_2(0,1)(MULT_SIZE-1) & MULT_1_2(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_1_2(0,1)(MULT_SIZE-1) & MULT_1_3(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(1) ------------------

			MULTS_1_2_2(0,1)<=signed(MULT_2_2(0,1)(MULT_SIZE-1) & MULT_2_2(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_2_2(0,1)(MULT_SIZE-1) & MULT_2_3(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(2) ------------------

			MULTS_1_3_2(0,1)<=signed(MULT_3_2(0,1)(MULT_SIZE-1) & MULT_3_2(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_3_2(0,1)(MULT_SIZE-1) & MULT_3_3(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(3) ------------------

			MULTS_1_4_2(0,1)<=signed(MULT_4_2(0,1)(MULT_SIZE-1) & MULT_4_2(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_4_2(0,1)(MULT_SIZE-1) & MULT_4_3(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(4) ------------------

			MULTS_1_5_2(0,1)<=signed(MULT_5_2(0,1)(MULT_SIZE-1) & MULT_5_2(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_5_2(0,1)(MULT_SIZE-1) & MULT_5_3(0,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(5) ------------------

                            -----------------------END OF INDEX(0,1) ------------------

			MULTS_1_1_2(1,0)<=signed(MULT_1_2(1,0)(MULT_SIZE-1) & MULT_1_2(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_1_2(1,0)(MULT_SIZE-1) & MULT_1_3(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(1) ------------------

			MULTS_1_2_2(1,0)<=signed(MULT_2_2(1,0)(MULT_SIZE-1) & MULT_2_2(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_2_2(1,0)(MULT_SIZE-1) & MULT_2_3(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(2) ------------------

			MULTS_1_3_2(1,0)<=signed(MULT_3_2(1,0)(MULT_SIZE-1) & MULT_3_2(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_3_2(1,0)(MULT_SIZE-1) & MULT_3_3(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(3) ------------------

			MULTS_1_4_2(1,0)<=signed(MULT_4_2(1,0)(MULT_SIZE-1) & MULT_4_2(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_4_2(1,0)(MULT_SIZE-1) & MULT_4_3(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(4) ------------------

			MULTS_1_5_2(1,0)<=signed(MULT_5_2(1,0)(MULT_SIZE-1) & MULT_5_2(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_5_2(1,0)(MULT_SIZE-1) & MULT_5_3(1,0)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(5) ------------------

                            -----------------------END OF INDEX(1,0) ------------------

			MULTS_1_1_2(1,1)<=signed(MULT_1_2(1,1)(MULT_SIZE-1) & MULT_1_2(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_1_2(1,1)(MULT_SIZE-1) & MULT_1_3(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(1) ------------------

			MULTS_1_2_2(1,1)<=signed(MULT_2_2(1,1)(MULT_SIZE-1) & MULT_2_2(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_2_2(1,1)(MULT_SIZE-1) & MULT_2_3(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(2) ------------------

			MULTS_1_3_2(1,1)<=signed(MULT_3_2(1,1)(MULT_SIZE-1) & MULT_3_2(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_3_2(1,1)(MULT_SIZE-1) & MULT_3_3(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(3) ------------------

			MULTS_1_4_2(1,1)<=signed(MULT_4_2(1,1)(MULT_SIZE-1) & MULT_4_2(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_4_2(1,1)(MULT_SIZE-1) & MULT_4_3(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(4) ------------------

			MULTS_1_5_2(1,1)<=signed(MULT_5_2(1,1)(MULT_SIZE-1) & MULT_5_2(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2)) + signed(MULT_5_2(1,1)(MULT_SIZE-1) & MULT_5_3(1,1)(MULT_SIZE-3 downto MULT_SIZE-PERCISION-2));
                        ---------------------SUM P_MAPS of FMAP(5) ------------------

                            -----------------------END OF INDEX(1,1) ------------------



                     EN_SUM_MULT_2<='1';
		end if;


		------------------------- Enable NEXT STATGE MULTS START -----------------------

		if EN_SUM_MULT_2 = '1' then
			------------------------------------STAGE-2--------------------------------------
			MULTS_2_1_1(0,0)<=signed(MULTS_1_1_1(0,0)(PERCISION) & MULTS_1_1_1(0,0)(PERCISION downto 1)) + signed(MULTS_1_1_2(0,0)(PERCISION) & MULTS_1_1_2(0,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(1) -----------------------

			MULTS_2_2_1(0,0)<=signed(MULTS_1_2_1(0,0)(PERCISION) & MULTS_1_2_1(0,0)(PERCISION downto 1)) + signed(MULTS_1_2_2(0,0)(PERCISION) & MULTS_1_2_2(0,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(2) -----------------------

			MULTS_2_3_1(0,0)<=signed(MULTS_1_3_1(0,0)(PERCISION) & MULTS_1_3_1(0,0)(PERCISION downto 1)) + signed(MULTS_1_3_2(0,0)(PERCISION) & MULTS_1_3_2(0,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(3) -----------------------

			MULTS_2_4_1(0,0)<=signed(MULTS_1_4_1(0,0)(PERCISION) & MULTS_1_4_1(0,0)(PERCISION downto 1)) + signed(MULTS_1_4_2(0,0)(PERCISION) & MULTS_1_4_2(0,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(4) -----------------------

			MULTS_2_5_1(0,0)<=signed(MULTS_1_5_1(0,0)(PERCISION) & MULTS_1_5_1(0,0)(PERCISION downto 1)) + signed(MULTS_1_5_2(0,0)(PERCISION) & MULTS_1_5_2(0,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(5) -----------------------

			-----------------------END OF INDEX(0,0) ------------------

			MULTS_2_1_1(0,1)<=signed(MULTS_1_1_1(0,1)(PERCISION) & MULTS_1_1_1(0,1)(PERCISION downto 1)) + signed(MULTS_1_1_2(0,1)(PERCISION) & MULTS_1_1_2(0,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(1) -----------------------

			MULTS_2_2_1(0,1)<=signed(MULTS_1_2_1(0,1)(PERCISION) & MULTS_1_2_1(0,1)(PERCISION downto 1)) + signed(MULTS_1_2_2(0,1)(PERCISION) & MULTS_1_2_2(0,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(2) -----------------------

			MULTS_2_3_1(0,1)<=signed(MULTS_1_3_1(0,1)(PERCISION) & MULTS_1_3_1(0,1)(PERCISION downto 1)) + signed(MULTS_1_3_2(0,1)(PERCISION) & MULTS_1_3_2(0,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(3) -----------------------

			MULTS_2_4_1(0,1)<=signed(MULTS_1_4_1(0,1)(PERCISION) & MULTS_1_4_1(0,1)(PERCISION downto 1)) + signed(MULTS_1_4_2(0,1)(PERCISION) & MULTS_1_4_2(0,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(4) -----------------------

			MULTS_2_5_1(0,1)<=signed(MULTS_1_5_1(0,1)(PERCISION) & MULTS_1_5_1(0,1)(PERCISION downto 1)) + signed(MULTS_1_5_2(0,1)(PERCISION) & MULTS_1_5_2(0,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(5) -----------------------

			-----------------------END OF INDEX(0,1) ------------------

			MULTS_2_1_1(1,0)<=signed(MULTS_1_1_1(1,0)(PERCISION) & MULTS_1_1_1(1,0)(PERCISION downto 1)) + signed(MULTS_1_1_2(1,0)(PERCISION) & MULTS_1_1_2(1,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(1) -----------------------

			MULTS_2_2_1(1,0)<=signed(MULTS_1_2_1(1,0)(PERCISION) & MULTS_1_2_1(1,0)(PERCISION downto 1)) + signed(MULTS_1_2_2(1,0)(PERCISION) & MULTS_1_2_2(1,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(2) -----------------------

			MULTS_2_3_1(1,0)<=signed(MULTS_1_3_1(1,0)(PERCISION) & MULTS_1_3_1(1,0)(PERCISION downto 1)) + signed(MULTS_1_3_2(1,0)(PERCISION) & MULTS_1_3_2(1,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(3) -----------------------

			MULTS_2_4_1(1,0)<=signed(MULTS_1_4_1(1,0)(PERCISION) & MULTS_1_4_1(1,0)(PERCISION downto 1)) + signed(MULTS_1_4_2(1,0)(PERCISION) & MULTS_1_4_2(1,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(4) -----------------------

			MULTS_2_5_1(1,0)<=signed(MULTS_1_5_1(1,0)(PERCISION) & MULTS_1_5_1(1,0)(PERCISION downto 1)) + signed(MULTS_1_5_2(1,0)(PERCISION) & MULTS_1_5_2(1,0)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(5) -----------------------

			-----------------------END OF INDEX(1,0) ------------------

			MULTS_2_1_1(1,1)<=signed(MULTS_1_1_1(1,1)(PERCISION) & MULTS_1_1_1(1,1)(PERCISION downto 1)) + signed(MULTS_1_1_2(1,1)(PERCISION) & MULTS_1_1_2(1,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(1) -----------------------

			MULTS_2_2_1(1,1)<=signed(MULTS_1_2_1(1,1)(PERCISION) & MULTS_1_2_1(1,1)(PERCISION downto 1)) + signed(MULTS_1_2_2(1,1)(PERCISION) & MULTS_1_2_2(1,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(2) -----------------------

			MULTS_2_3_1(1,1)<=signed(MULTS_1_3_1(1,1)(PERCISION) & MULTS_1_3_1(1,1)(PERCISION downto 1)) + signed(MULTS_1_3_2(1,1)(PERCISION) & MULTS_1_3_2(1,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(3) -----------------------

			MULTS_2_4_1(1,1)<=signed(MULTS_1_4_1(1,1)(PERCISION) & MULTS_1_4_1(1,1)(PERCISION downto 1)) + signed(MULTS_1_4_2(1,1)(PERCISION) & MULTS_1_4_2(1,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(4) -----------------------

			MULTS_2_5_1(1,1)<=signed(MULTS_1_5_1(1,1)(PERCISION) & MULTS_1_5_1(1,1)(PERCISION downto 1)) + signed(MULTS_1_5_2(1,1)(PERCISION) & MULTS_1_5_2(1,1)(PERCISION downto 1));
			---------------------SUM P_MAPS of FMAP(5) -----------------------

			-----------------------END OF INDEX(1,1) ------------------



		Enable_STAGE_1<='1';
		end if;


		------------------------- Enable ADDER-TREE START -----------------------

		if Enable_STAGE_1 = '1' then
			------------------------------------STAGE-1--------------------------------------

			ADD_DEPTH_1(0,0)<=signed(MULTS_2_1_1(0,0)) + signed(MULTS_2_1_1(1,1));
			ADD_DEPTH_1(0,1)<=signed(MULTS_2_2_1(0,0)) + signed(MULTS_2_2_1(1,1));
			ADD_DEPTH_1(0,2)<=signed(MULTS_2_3_1(0,0)) + signed(MULTS_2_3_1(1,1));
			ADD_DEPTH_1(0,3)<=signed(MULTS_2_4_1(0,0)) + signed(MULTS_2_4_1(1,1));
			ADD_DEPTH_1(0,4)<=signed(MULTS_2_5_1(0,0)) + signed(MULTS_2_5_1(1,1));


			ADD_DEPTH_1(1,0)<=signed(MULTS_2_1_1(0,1)) + signed(MULTS_2_1_1(1,0));
			ADD_DEPTH_1(1,1)<=signed(MULTS_2_2_1(0,1)) + signed(MULTS_2_2_1(1,0));
			ADD_DEPTH_1(1,2)<=signed(MULTS_2_3_1(0,1)) + signed(MULTS_2_3_1(1,0));
			ADD_DEPTH_1(1,3)<=signed(MULTS_2_4_1(0,1)) + signed(MULTS_2_4_1(1,0));
			ADD_DEPTH_1(1,4)<=signed(MULTS_2_5_1(0,1)) + signed(MULTS_2_5_1(1,0));



				Enable_STAGE_2<= '1';
			end if; 
			------------------------------------STAGE-2--------------------------------------
		if Enable_STAGE_2 = '1' then


			ADD_DEPTH_2(0,0)<=signed(ADD_DEPTH_1(0,0)) + signed(ADD_DEPTH_1(1,0));
			ADD_DEPTH_2(0,1)<=signed(ADD_DEPTH_1(0,1)) + signed(ADD_DEPTH_1(1,1));
			ADD_DEPTH_2(0,2)<=signed(ADD_DEPTH_1(0,2)) + signed(ADD_DEPTH_1(1,2));
			ADD_DEPTH_2(0,3)<=signed(ADD_DEPTH_1(0,3)) + signed(ADD_DEPTH_1(1,3));
			ADD_DEPTH_2(0,4)<=signed(ADD_DEPTH_1(0,4)) + signed(ADD_DEPTH_1(1,4));


			Enable_BIAS<='1'; 
		end if;
		------------------------------------STAGE-BIAS--------------------------------------
		
		if Enable_BIAS = '1' then

			BIAS_1<=(signed(BIAS_VAL_1)+signed(ADD_DEPTH_2(0,0)(PERCISION downto 1)));
			BIAS_2<=(signed(BIAS_VAL_2)+signed(ADD_DEPTH_2(0,1)(PERCISION downto 1)));
			BIAS_3<=(signed(BIAS_VAL_3)+signed(ADD_DEPTH_2(0,2)(PERCISION downto 1)));
			BIAS_4<=(signed(BIAS_VAL_4)+signed(ADD_DEPTH_2(0,3)(PERCISION downto 1)));
			BIAS_5<=(signed(BIAS_VAL_5)+signed(ADD_DEPTH_2(0,4)(PERCISION downto 1)));

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
			DOUT_BUF_1_3<=std_logic_vector(BIAS_1);
			else
			ReLU_1<= (others => '0');
			DOUT_BUF_1_3<=(others => '0');
			end if;
			if BIAS_2>0 then
			ReLU_2<=BIAS_2;
			DOUT_BUF_2_3<=std_logic_vector(BIAS_2);
			else
			ReLU_2<= (others => '0');
			DOUT_BUF_2_3<=(others => '0');
			end if;
			if BIAS_3>0 then
			ReLU_3<=BIAS_3;
			DOUT_BUF_3_3<=std_logic_vector(BIAS_3);
			else
			ReLU_3<= (others => '0');
			DOUT_BUF_3_3<=(others => '0');
			end if;
			if BIAS_4>0 then
			ReLU_4<=BIAS_4;
			DOUT_BUF_4_3<=std_logic_vector(BIAS_4);
			else
			ReLU_4<= (others => '0');
			DOUT_BUF_4_3<=(others => '0');
			end if;
			if BIAS_5>0 then
			ReLU_5<=BIAS_5;
			DOUT_BUF_5_3<=std_logic_vector(BIAS_5);
			else
			ReLU_5<= (others => '0');
			DOUT_BUF_5_3<=(others => '0');
			end if;

			EN_NXT_LYR_3<='1';FRST_TIM_EN_3<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
               EN_NXT_LYR_3<='0';
               DOUT_BUF_1_3<=(others => '0');
               DOUT_BUF_2_3<=(others => '0');
               DOUT_BUF_3_3<=(others => '0');
               DOUT_BUF_4_3<=(others => '0');
               DOUT_BUF_5_3<=(others => '0');

		end if; -- VALIDPIXELS

		if VALID_NXTLYR_PIX=((IMAGE_WIDTH*STRIDE)-1) then VALID_NXTLYR_PIX<=0;SIG_STRIDE<=STRIDE;   -- reset sride and valid pixels
		else VALID_NXTLYR_PIX<=VALID_NXTLYR_PIX+1;end if; 

	end if;  --ReLU

	--end if;  --enable window              canceled 

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

