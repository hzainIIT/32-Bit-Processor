----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 01:03:44 AM
-- Design Name: 
-- Module Name: ALUCntrl - Behavioral
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

entity ALUCntrl is
    Port (  FuncField : in STD_LOGIC_VECTOR (5 downto 0);
            ALUop : in STD_LOGIC_VECTOR (1 downto 0);
            ALUCon : out STD_LOGIC_VECTOR (5 downto 0));
end ALUCntrl;

architecture Behavioral of ALUCntrl is

    signal ALUC: STD_LOGIC_VECTOR (5 downto 0);
    
    begin
        process(ALUop, FuncField)
        begin
            if ALUop = "00" then
                ALUC <= "000010";
            elsif ALUop = "01" then
                ALUC <= "000110";
            elsif ALUop = "00" then
                case FuncField is
                    when "000000" => ALUC <= "000010";
                    when "000010" => ALUC <= "000110";
                    when "000100" => ALUC <= "000000";
                    when "000101" => ALUC <= "000111";
                    when "000111" => ALUC <= "001100";
                end case;
            end if;
         end process;
end Behavioral;
