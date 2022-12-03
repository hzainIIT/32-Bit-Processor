----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 06:21:04 PM
-- Design Name: 
-- Module Name: Instruction_Memory - Behavioral
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

entity Instruction_Memory is
    Port ( PCAddress : in STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out STD_LOGIC_VECTOR (31 downto 0));
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is

begin

process (PCAddress) begin

    case PCAddress is 
    
        -- address space is 32 bit
            when "00000000000000000000000000000000" => --000
              --sub $s2, $s1, $s3
              Instruction <= "00000010001100111001000000100010";
			when "00000000000000000000000000000100" => --004
             -- and $t2, $s2, $t5
              Instruction <= "00000010010011010101000000100100";
			when "00000000000000000000000000001000" => --008
             -- or $t2, $s0, $t2
              Instruction <= "00000010000010100101000000100101";
			when "00000000000000000000000000001100" => --00C
             --add1 $s3, $t1, $t0
              Instruction <= "00000001001010001001100000100000";
			when "00000000000000000000000000010000" => --010
              -- lw $t3, 100($s2) NOTE: 100 is hex
              Instruction <= "10001110010010110000000100000000";
			when "00000000000000000000000000010100" => --014
              --addi $s4, $t3, 0x200
              Instruction <= "00100001011101000000001000000000";
			when "00000000000000000000000000011000" => --018
              --sw $t1, 100($t2)
              Instruction <= "10101101010010010000000100000000";
			when "00000000000000000000000000011100" => --01C
              --nor $t1, $s1, $t0
              Instruction <= "00000010001010000100100000100111";
			when "00000000000000000000000000100000" => --020
              --slt $t1, $s2, $s2
              Instruction <= "00000010010100100100100000101010";
			when "00000000000000000000000000100100" => --024
              -- j $2500
              Instruction <= "00001000000000000010010100000000";
			when "00000000000000000010010100000000" => --2500
              -- make it break
              Instruction <= "00000000000000000000000000000000";
            when others =>
               Instruction <= "00000000000000000000000000000000";
    end case;
end process;

end Behavioral;
