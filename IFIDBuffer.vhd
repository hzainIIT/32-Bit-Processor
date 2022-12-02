----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 07:37:51 PM
-- Design Name: 
-- Module Name: IFIDBuffer - Behavioral
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

entity IFIDBuffer is
    Port ( CLK : in STD_LOGIC;
           PCCarryIn : in STD_LOGIC_VECTOR (31 downto 0);
           InstRegIn : in STD_LOGIC_VECTOR (31 downto 0);
           PCCarryOut : out STD_LOGIC_VECTOR (31 downto 0);
           InstRegOut : out STD_LOGIC_VECTOR (31 downto 0)
     );
end IFIDBuffer;

architecture Behavioral of IFIDBuffer is

begin
SYNC_IF_ID:	
	process(CLK,PCCarryIn,InstRegIn) begin
        if rising_edge(CLK) then
            PCCarryOut <= PCCarryIn;
            InstRegOut <= InstRegIn;
        end if;
	end process; 
end Behavioral;
