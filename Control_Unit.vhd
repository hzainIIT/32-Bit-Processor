----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 09:06:18 AM
-- Design Name: 
-- Module Name: Control_Unit - Behavioral
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

entity Control_Unit is
    Port ( Opcode : in STD_LOGIC_VECTOR (5 downto 0);
           RegWrite : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           BranchEn : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           RegDst : out STD_LOGIC;
           ALUOP : out STD_LOGIC_VECTOR (3 downto 0);
           ALUSrc : out STD_LOGIC);
end Control_Unit;

architecture Behavioral of Control_Unit is

begin


end Behavioral;
