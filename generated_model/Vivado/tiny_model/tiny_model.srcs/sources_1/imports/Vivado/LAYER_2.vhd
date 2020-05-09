------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Fri May 08 00:40:55 CDT 2020
------------------------------------------HEADER END"--------------------------------------------



------------------------------DESCRIPTION AND LIBRARY DECLARATION-START---------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    POOL - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Number of Total Operaiton: 10
-- Number of Clock Cycles: 3
-- Number of GOPS = 0.0
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity POOL_LAYER_2 is

GENERIC
 	( 
	constant PRECISION      : positive := 5; 	
	constant DOUT_WIDTH     : positive := 5; 
	constant BIAS_SIZE      : positive := 5;
	constant MULT_SIZE      : positive := 5;
	constant DIN_WIDTH      : positive := 5;	
	constant IMAGE_WIDTH    : positive := 4;
	constant IMAGE_SIZE     : positive := 25;	
	constant F_SIZE         : positive := 2;
	constant WEIGHT_SIZE    : positive := 5;
	constant BIASES_SIZE	: positive := 2;
	constant PADDING        : positive := 1;
	constant STRIDE         : positive := 2;
	constant FEATURE_MAPS   : positive := 1;
	constant F_SIZEX2       : positive := 4;
	constant VALID_CYCLES   : positive := 4;
	constant VALID_LOCAL_PIX: positive := 2;
	constant MAX_DEPTH      : positive := 2;
	constant INPUT_DEPTH    : positive := 1;
	constant FIFO_DEPTH     : positive := 3;	
	constant USED_FIFOS     : positive := 1;	
	constant MAX_1          : positive := 2;    	
	constant MAX_2          : positive := 1;    	
	constant LOCAL_OUTPUT   : positive := 5	
		); 

port(
	DIN_1_2         :IN std_logic_vector(DIN_WIDTH-1 downto 0);
	CLK,RST         :IN std_logic;
   	DIS_STREAM      :OUT std_logic; 					-- S_AXIS_TVALID  : Data in is valid
   	EN_STREAM       :IN std_logic; 						-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_2 :OUT std_logic; 				-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_2     :OUT std_logic;  				-- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_2 :IN std_logic;
	DOUT_1_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_2        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST    :OUT std_logic
	);	

end POOL_LAYER_2;

------------------------------ ARCHITECTURE DECLARATION - START---------------------------------------------

architecture Behavioral of POOL_LAYER_2 is

------------------------------ INTERNAL FIXED CONSTANT & SIGNALS DECLARATION - START---------------------------------------------
type       FILTER_TYPE             is array (0 to F_SIZE-1, 0 to F_SIZE-1) of signed(WEIGHT_SIZE- 1 downto 0);
type       FIFO_Memory             is array (0 to FIFO_DEPTH - 1)          of STD_LOGIC_VECTOR(DIN_WIDTH - 1 downto 0);
type       SLIDING_WINDOW          is array (0 to FEATURE_MAPS-1, 0 to F_SIZEX2-1) of STD_LOGIC_VECTOR(DIN_WIDTH- 1 downto 0);
signal     WINDOW:SLIDING_WINDOW;
signal     VALID_NXTLYR_PIX        :integer range 0 to VALID_CYCLES;
signal     PIXEL_COUNT             :integer range 0 to VALID_CYCLES;
signal     OUT_PIXEL_COUNT         :integer range 0 to VALID_CYCLES;
signal     EN_NXT_LYR_2            :std_logic;
signal     FRST_TIM_EN_2           :std_logic;
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


------------------------------------------------------ DOUT NEXT LAYER SIGS DECLARATION---------------------------------------------------------

signal DOUT_BUF_1_2        : std_logic_vector(LOCAL_OUTPUT-1 downto 0);

-------------------------------------- OUTPUT FROM LOWER COMPONENT SIGNALS--------------------------------------------------
signal DOUT_1_3	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_2_3	: std_logic_vector(DOUT_WIDTH-1 downto 0);
signal EN_STREAM_OUT_3	: std_logic;
signal VALID_OUT_3          : std_logic;

---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT Flatten_LAYER_3
    port(	CLK,RST		:IN std_logic;
			DIN_1_3			:IN std_logic_vector(LOCAL_OUTPUT-1 downto 0);
			EN_STREAM_OUT_3	:OUT std_logic;
			VALID_OUT_3	:OUT std_logic;
			DOUT_1_3        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			DOUT_2_3        :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
			EN_STREAM	:IN std_logic;
			EN_LOC_STREAM_3	:IN std_logic
      			);
END COMPONENT Flatten_LAYER_3;

begin

Flatten_LYR_3 : Flatten_LAYER_3 
          port map(
            CLK              => CLK,
            RST              => RST,
            DIN_1_3 	     => DOUT_BUF_1_2,
            DOUT_1_3         => DOUT_1_3,
            DOUT_2_3         => DOUT_2_3,
            VALID_OUT_3      => VALID_OUT_3,
            EN_STREAM_OUT_3  => EN_STREAM_OUT_3,
            EN_LOC_STREAM_3  => EN_NXT_LYR_2,
            EN_STREAM        => EN_STREAM
                );

----------------------------------------------- MAP NEXT LAYER - COMPONENTS END----------------------------------------------------


-------------------------------------------------------- ARCHITECTURE BEGIN--------------------------------------------------------

LAYER_2: process(CLK)

begin
------------------------------------------------ RESET AND PROCESS TOP START ------------------------------------------------------
if rising_edge(CLK) then
  if RST = '1' then
	-------------------FIXED SIGNALS RESET------------------------
    WINDOW<=((others=> (others=> (others=>'0'))));
    PIXEL_COUNT<=0;VALID_NXTLYR_PIX<=0;OUT_PIXEL_COUNT<=0;
    EN_NXT_LYR_2<='0';FRST_TIM_EN_2<='0';EN_OUT_BUF<='0';
    Enable_MAX<='0';Enable_ADDER<='0';
    INTERNAL_RST<='0';PADDING_count<=0;ROW_COUNT<=0;SIG_STRIDE<=STRIDE;VALID_ROWS<=0;

-------------------DYNAMIC SIGNALS RESET------------------------
    MAX_D_1<=((others=> (others=> (others=>'0'))));Enable_MX_2<='0';
    MAX_D_2<=((others=> (others=> (others=>'0'))));

    DOUT_BUF_1_2<=(others => '0');

----------------- FIFO_1 RESET---------------
    FIFO_ROW_1_1<= ((others=> (others=>'0')));HEAD_1_1<=0;
    WriteEn_1_1<= '0';ReadEn_1_1<= '0';Async_Mode_1_1<= false;


------------------------------------------------ PROCESS START------------------------------------------------------
	  
   else 	
	if EN_LOC_STREAM_2='1' and EN_STREAM= '1' and OUT_PIXEL_COUNT<VALID_CYCLES  then    -- check valid data and enable stream
		
		if  FRST_TIM_EN_2='1' then EN_NXT_LYR_2<='1';end if;

                ---------------------F-MAP1---------------------

                WINDOW(0,0)<=DIN_1_2;
                WINDOW(0,1)<=WINDOW(0,0);

                WINDOW(0,3)<=WINDOW(0,2);



                if PIXEL_COUNT=(F_SIZE-1) then
                  WriteEn_1_1 <= '1';
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


	      -------------------------------------------- Enable MAX WIN START --------------------------------------------				
	
		if Enable_MAX='1' then
            ------------------FMAP even_0---------------

			if  WINDOW(0,0) > WINDOW(0,1)  then  MAX_D_1(0,0)<= WINDOW(0,0);
			else  MAX_D_1(0,0)<= WINDOW(0,1);end if;
			if  WINDOW(0,2) > WINDOW(0,3)  then  MAX_D_1(0,1)<= WINDOW(0,2);
			else  MAX_D_1(0,1)<= WINDOW(0,3);end if;

			Enable_MX_2<='1';

           ------------------------- Enable MAX STAGES START -------------------------				

            ---------------DEPTH_2---------------
            if Enable_MX_2='1' then 
                if  MAX_D_1(0,0) > MAX_D_1(0,1)  then  MAX_D_2(0,0)<= MAX_D_1(0,0);
                else  MAX_D_2(0,0)<= MAX_D_1(0,1);end if;

			  EN_OUT_BUF<='1';
            end if; -- enable stage


		if SIG_STRIDE>1 and EN_OUT_BUF='1' then
                 SIG_STRIDE<=SIG_STRIDE-1;
               elsif VALID_NXTLYR_PIX<(IMAGE_WIDTH-F_SIZE) then
		 SIG_STRIDE<=STRIDE; end if;

	if  EN_OUT_BUF='1' then
	if SIG_STRIDE>(STRIDE-1) and VALID_ROWS<=(IMAGE_WIDTH-F_SIZE) then  
			DOUT_BUF_1_2<=std_logic_vector(MAX_D_2(0,0));
			EN_NXT_LYR_2<='1';
			FRST_TIM_EN_2<='1';
			OUT_PIXEL_COUNT<=OUT_PIXEL_COUNT+1;
		else
           EN_NXT_LYR_2<='0';
           DOUT_BUF_1_2<=(others => '0');

		end if; -- end Validnxt layer

			if VALID_ROWS=((IMAGE_WIDTH*STRIDE)-1) then VALID_ROWS<=0;SIG_STRIDE<=STRIDE;   -- reset sride and valid pixels
			else VALID_ROWS<=VALID_ROWS+1;end if;
			end if;  -- enable BUFOUT



		end if;	-- END MAX


elsif OUT_PIXEL_COUNT>=VALID_CYCLES  then INTERNAL_RST<='1';SIG_STRIDE<=STRIDE;EN_NXT_LYR_2<='1';  -- order is very important
else  EN_NXT_LYR_2<='0';-- In case stream stopped

end if; -- end enable_condition 
end if; -- for RST	
end if; -- rising edge
end process LAYER_2;

EN_STREAM_OUT_2<= EN_STREAM_OUT_3;
VALID_OUT_2<= VALID_OUT_3;
DOUT_1_2<=DOUT_1_3;
DOUT_2_2<=DOUT_2_3;

end Behavioral;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

