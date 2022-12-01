----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 09:18:55 AM
-- Design Name: 
-- Module Name: Instruction_Decode - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_Decode is
    Port ( Instruction : in STD_LOGIC_VECTOR (31 downto 0);
           PCCarry : inout STD_LOGIC;
           WBControl : out STD_LOGIC_VECTOR (1 downto 0);
           EXControl : out STD_LOGIC_VECTOR (2 downto 0);
           MEMControl : out STD_LOGIC_VECTOR (2 downto 0);
           RD : out STD_LOGIC_VECTOR (4 downto 0);
           RT : out STD_LOGIC_VECTOR (4 downto 0);
           IMMCarry: out STD_LOGIC_VECTOR (31 downto 0);
           ReadData1 : out STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out STD_LOGIC_VECTOR (31 downto 0));
end Instruction_Decode;

architecture Behavioral of Instruction_Decode is
    alias opcode is Instruction(31 downto 26);
    alias funct is Instruction(5 downto 0);
    alias shamt is Instruction(10 downto 6);
    alias rd_decoded is Instruction(15 downto 11);
    alias rt_decoded is Instruction(20 downto 16);
    alias rs_decoded is Instruction(25 downto 21);
begin


end Behavioral;
