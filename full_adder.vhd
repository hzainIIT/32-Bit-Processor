----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alex Maliwat
-- 
-- Create Date: 10/16/2022 06:39:00 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
-- Project Name: Project 2
-- Target Devices: 
-- Tool Versions: 
-- Description: full adder/1 bit ripple carry adder
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( carryIn : in STD_LOGIC;
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           sum : out STD_LOGIC;
           carryOut : out STD_LOGIC);
end full_adder;

architecture equations of full_adder is

begin

    sum <= in0 XOR in1 XOR carryIn;
    carryOut <= (in0 AND in1) OR (carryIn AND in0) OR (carryIN AND in1);

end equations;
