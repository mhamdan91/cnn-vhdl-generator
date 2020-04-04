------------------------------------------HEADER START"------------------------------------------
--THIS FILE WAS GENERATED USING HIGH LANGUAGE DESCRIPTION TOOL DESIGNED BY: MUHAMMAD HAMDAN
--TOOL VERSION: 0.1
--GENERATION DATE/TIME:Sat Apr 04 01:57:36 CDT 2020
------------------------------------------HEADER END"-------------------------------------------



-----------------------------DESCRIPTION AND LIBRARY DECLARATION-START-----------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
-----------------------------------------------------------------------------------------------------

-- Engineer:       Muhammad Hamdan
-- Design Name:    HDL GENERATION - CONV LAYER 
-- Module Name:    CONV_1 - Behavioral 
-- Project Name:   CNN accelerator
-- Target Devices: Zynq-XC7Z020
-- Description: 
-- Dependencies: 
-- Revision:0.010 


library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
-------------------------------------------------------------------------------------
--
--
-- Definition of Ports
-- ACLK           : Synchronous clock
-- ARESETN        : System reset, active low
-- S_AXIS_TREADY  : Ready to accept data in
-- S_AXIS_TDATA   : Data in 
-- S_AXIS_TLAST   : Optional data in qualifier
-- S_AXIS_TVALID  : Data in is valid
-- M_AXIS_TVALID  : Data out is valid
-- M_AXIS_TDATA   : Data Out
-- M_AXIS_TLAST   : Optional data out qualifier
-- M_AXIS_TREADY  : Connected slave device is ready to accept data out
--
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Entity Section 
------------------------------------------------------------------------------
entity accelerator is
GENERIC( 
  	constant DATA_WIDTH 		: positive := 8;
	constant IMAGE_WIDTH 		: positive := 15;
	constant IMAGE_SIZE 		: positive := 225;
	constant DOUT_WIDTH		: positive := 5 -- TO BE CALCULATED
		); 

	port(
		-- DO NOT EDIT BELOW THIS LINE ---------------------
		-- Bus protocol ports, do not add or delete. 
		ACLK            : in	std_logic;
		ARESETN         : in	std_logic;
		S_AXIS_TREADY	: out	std_logic;
		S_AXIS_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_TLAST	: in	std_logic;
		S_AXIS_TVALID	: in	std_logic;
		M_AXIS_TVALID	: out	std_logic;
		M_AXIS_TDATA	: out	std_logic_vector(256 downto 0);
		M_AXIS_TLAST	: out	std_logic;
		M_AXIS_TREADY	: in	std_logic
		-- DO NOT EDIT ABOVE THIS LINE ---------------------
	);

end accelerator;

------------------------------------------------------------------------------
-- Architecture Section
------------------------------------------------------------------------------
architecture Behavior of accelerator is
signal DOUT_1_1          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal DOUT_2_1          : std_logic_vector(DOUT_WIDTH-1 downto 0);
signal EN_STREAM_OUT_1	 : std_logic;
signal VALID_OUT_1       : std_logic;
---------------------------------- MAP NEXT LAYER - COMPONENTS START----------------------------------
COMPONENT CONV_LAYER_1
   port(
	DIN                 :IN std_logic_vector(DATA_WIDTH-1 downto 0);
	CLK,RST             :IN std_logic;
	DIS_STREAM          :OUT std_logic; 				-- S_AXIS_TVALID  : Data in is valid
	EN_STREAM           :IN std_logic; 				-- S_AXIS_TREADY  : Ready to accept data in 
	EN_STREAM_OUT_1     :OUT std_logic; 				-- M_AXIS_TREADY  : Connected slave device is ready to accept data out/ Internal Enable
	VALID_OUT_1         :OUT std_logic;  				-- M_AXIS_TVALID  : Data out is valid
	EN_LOC_STREAM_1     :IN std_logic;
	DOUT_1_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	DOUT_2_1            :OUT std_logic_vector(DOUT_WIDTH-1 downto 0);
	INTERNAL_RST        :IN std_logic
      			);
END COMPONENT CONV_LAYER_1;

begin

CONV_LYR_1 : CONV_LAYER_1 
          port map(
           CLK               => ACLK,
           RST               => ARESETN,
           DIN               => S_AXIS_TDATA(7 downto 0),
           EN_STREAM         => M_AXIS_TREADY,		
           DOUT_1_1               => DOUT_1_1,
           DOUT_2_1               => DOUT_2_1,
           EN_STREAM_OUT_1        => EN_STREAM_OUT_1,
           VALID_OUT_1            => VALID_OUT_1
          );

M_AXIS_TDATA(5 downto 0)<= DOUT_1_1;
M_AXIS_TDATA(11 downto 6)<= DOUT_2_1;
S_AXIS_TREADY<= EN_STREAM_OUT_1;
M_AXIS_TVALID<= VALID_OUT_1;
 
end architecture Behavior;
------------------------------ ARCHITECTURE DECLARATION - END---------------------------------------------

