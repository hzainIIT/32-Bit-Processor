----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 07:30:57 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCReg is
    Port ( --CLK : in STD_LOGIC;
--           Reset : in STD_LOGIC;
           PCIn : in STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out STD_LOGIC_VECTOR (31 downto 0)
    );
end PCReg;

architecture Behavioral of PCReg is

begin
SYNCH_PCREG:
    process( PCIn) begin
--        if rising_edge(CLK) then
            PCOut <= PCIn;
--        end if;
    end process;
end Behavioral;
