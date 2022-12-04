----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2022 04:48:16 PM
-- Design Name: 
-- Module Name: Write_Back - Behavioral
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

entity Write_Back is
    Port ( WBControl : in STD_LOGIC_VECTOR (1 downto 0);
           MemIn : in STD_LOGIC_VECTOR (31 downto 0);
           ALUIn : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           PCSrc : out STD_LOGIC);
end Write_Back;

architecture Behavioral of Write_Back is
alias memtoreg is WBControl(1);
begin
PCSrc <= WBControl(0);

--memToReg 0 writes mem to reg
--memToReg 1 write ALU out to reg

process (memtoreg, MemIn, ALUIn) begin

if memtoreg = '0' then
    DataOut <= MemIn;
else
    DataOut <= ALUIn;
end if;
end process;

end Behavioral;
