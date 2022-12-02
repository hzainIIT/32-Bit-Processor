----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 07:24:50 PM
-- Design Name: 
-- Module Name: Adder - Behavioral
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

--
-- Sumador convencional. Usado en las etapas etapas IF y EX. 
--
-- Licencia: Copyright 2008 Emmanuel Luján
--
-- 	This program is free software; you can redistribute it and/or
-- 	modify it under the terms of the GNU General Public License as
-- 	published by the Free Software Foundation; either version 2 of
-- 	the License, or (at your option) any later version. This program
-- 	is distributed in the hope that it will be useful, but WITHOUT
-- 	ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- 	or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
-- 	License for more details. You should have received a copy of the
-- 	GNU General Public License along with this program; if not, write
-- 	to the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
-- 	Boston, MA 02110-1301 USA.
-- 
-- Autor:	Emmanuel Luján
-- Email:	info@emmanuellujan.com.ar
-- Versión:	1.0
--
 
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

--Declaración de componentes
  
	component FULL_ADDER is
	    port(
			X	: in	STD_LOGIC;
			Y	: in	STD_LOGIC;
			CIN	: in	STD_LOGIC;
			COUT	: out	STD_LOGIC;
			R	: out	STD_LOGIC
	    );
	end component FULL_ADDER;

--Declaración de señales

	signal CAUX :	STD_LOGIC_VECTOR (31 downto 0);
      
begin

	BEGIN_FA:
		FULL_ADDER port map (
			X	=> X(0),
			Y	=> Y(0),
			CIN	=> CIN,
			COUT	=> CAUX(0),
			R	=> R(0)
		);
	GEN_ADDER:
		for i in 1 to 31 generate
			NEXT_FA:
				FULL_ADDER port map (
					X	=> X(i),
					Y	=> Y(i),	
					CIN	=> CAUX(i-1),
					COUT=> CAUX(i),
					R	=> R(i)
				);
		end generate;
	COUT <= CAUX(31);
	
end ADDER_ARC;
