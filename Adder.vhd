----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 06:16:08 PM
-- Design Name: 
-- Module Name: EX - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
 
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
 
entity ADDER is   
	port(
		X	: in	STD_LOGIC_VECTOR(31 downto 0);
		Y	: in	STD_LOGIC_VECTOR(31 downto 0);
		CIN	: in	STD_LOGIC;
		COUT	: out	STD_LOGIC;
		R	: out	STD_LOGIC_VECTOR(31 downto 0)
	);
end ADDER;

architecture ADDER_ARC of ADDER is

--Declaraci�n de componentes
  
	component FULL_ADDER is
	    port(
			in0	: in STD_LOGIC;
			in1	: in STD_LOGIC;
			carryIn	: in STD_LOGIC;
			carryOut : out STD_LOGIC;
			sum	: out STD_LOGIC
	    );
	end component FULL_ADDER;

--Declaraci�n de se�ales

	signal CAUX :	STD_LOGIC_VECTOR (31 downto 0);
      
begin

	BEGIN_FA:
		FULL_ADDER port map (
			in0	=> X(0),
			in1	=> Y(0),
			carryIn	=> CIN,
			carryOut => CAUX(0),
			sum	=> R(0)
		);
	GEN_ADDER:
		for i in 1 to 31 generate
			NEXT_FA:
				FULL_ADDER port map (
					in0	=> X(i),
					in1	=> Y(i),	
					carryIn	=> CAUX(i-1),
					carryOut => CAUX(i),
					sum	=> R(i)
				);
		end generate;
	COUT <= CAUX(31);
	
end ADDER_ARC;
