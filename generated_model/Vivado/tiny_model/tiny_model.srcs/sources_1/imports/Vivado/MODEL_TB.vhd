------------------------------------------HEADER START-----------------------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Fri May 08 00:40:56 CDT 2020
------------------------------------------HEADER END-----------------------------------------------------------



----------------------------------DESCRIPTION AND LIBRARY DECLARATION-START--------------------------------------
-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    TESTBENCH - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;  ENTITY conv_layer_tb IS
  END conv_layer_tb;

ARCHITECTURE behavior OF conv_layer_tb IS 
constant DOUT_WIDTH		: positive := 5;
constant DIN_WIDTH		: positive := 8;
  COMPONENT CONV_LAYER_1


          PORT(
		CLK		: IN std_logic;
		RST		: IN std_logic;		
		DIN		: IN std_logic_vector(DIN_WIDTH-1 downto 0);
		EN_STREAM	: IN std_logic;
		DIS_STREAM	: out std_logic;
		EN_STREAM_OUT_1	: OUT std_logic; 
		EN_LOC_STREAM_1	: IN std_logic;
		DOUT_1_1        : OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		DOUT_2_1        : OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
		INTERNAL_RST    : OUT std_logic
					);
          END COMPONENT;


  	 	SIGNAL CLK 		: std_logic := '0';
  	  	SIGNAL RST 		: std_logic := '0';
       	SIGNAL DIN 		: std_logic_vector(DIN_WIDTH-1 downto 0);
		SIGNAL EN_STREAM	: std_logic;
	  	SIGNAL DIS_STREAM	: std_logic;
		SIGNAL EN_STREAM_OUT_1	: std_logic;
		SIGNAL EN_LOC_STREAM_1	: std_logic;
		SIGNAL INTERNAL_RST 	: std_logic;
		SIGNAL DOUT_1_1        : std_logic_vector(DOUT_WIDTH-1 downto 0);
		SIGNAL DOUT_2_1        : std_logic_vector(DOUT_WIDTH-1 downto 0);
	  	CONSTANT clk_period 	: time := 10 ns;   -- 100MHz

  BEGIN

          CONV_LYR_1: CONV_LAYER_1 PORT MAP(
        	CLK => CLK,
        	RST => RST,
		INTERNAL_RST =>INTERNAL_RST,
		DIN => DIN,
		EN_STREAM_OUT_1 => EN_STREAM_OUT_1,
		EN_LOC_STREAM_1	=>EN_LOC_STREAM_1,
		DOUT_1_1=> DOUT_1_1,
		DOUT_2_1=> DOUT_2_1,
		EN_STREAM => EN_STREAM,
		DIS_STREAM  => DIS_STREAM 
          );
   -- Clock process definitions( clock with 50% duty cycle is generated here.
   clk_process :process
   begin
        CLK <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        CLK <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;


	 ---  stimulus ---
	cnn: process
        begin   	
        wait for 5 ns;
        RST <='1';
        wait for 20 ns;
        RST <='0';
        wait for 5 ns;



	-------------ROW-1---------- 
	 wait for CLK_period * 1; 
	 EN_STREAM<='1';
	 EN_LOC_STREAM_1<='1';
	 DIN<=x"01";
	 wait for CLK_period * 1; 
	 DIN<=x"02";
	 wait for CLK_period * 1; 
	 DIN<=x"03";
	 wait for CLK_period * 1; 
	 DIN<=x"04";
	 wait for CLK_period * 1; 
	 DIN<=x"05";


	-------------ROW-2---------- 
	 wait for CLK_period * 1; 
	 DIN<=x"01";
	 wait for CLK_period * 1; 
	 DIN<=x"02";
	 wait for CLK_period * 1; 
	 DIN<=x"03";
	 wait for CLK_period * 1; 
	 DIN<=x"04";
	 wait for CLK_period * 1; 
	 DIN<=x"05";


	-------------ROW-3---------- 
	 wait for CLK_period * 1; 
	 DIN<=x"01";
	 wait for CLK_period * 1; 
	 DIN<=x"02";
	 wait for CLK_period * 1; 
	 DIN<=x"03";
	 wait for CLK_period * 1; 
	 DIN<=x"04";
	 wait for CLK_period * 1; 
	 DIN<=x"05";


	-------------ROW-4---------- 
	 wait for CLK_period * 1; 
	 DIN<=x"01";
	 wait for CLK_period * 1; 
	 DIN<=x"02";
	 wait for CLK_period * 1; 
	 DIN<=x"03";
	 wait for CLK_period * 1; 
	 DIN<=x"04";
	 wait for CLK_period * 1; 
	 DIN<=x"05";


	-------------ROW-5---------- 
	 wait for CLK_period * 1; 
	 DIN<=x"01";
	 wait for CLK_period * 1; 
	 DIN<=x"02";
	 wait for CLK_period * 1; 
	 DIN<=x"03";
	 wait for CLK_period * 1; 
	 DIN<=x"04";
	 wait for CLK_period * 1; 
	 DIN<=x"05";

    wait; -- will wait forever
    END PROCESS cnn;
  --  End Test Bench 

  END;

