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

-- dont need to worry about enable - allow Instruction_Decode to worry about that
entity Control_Unit is
    Port ( Opcode : in STD_LOGIC_VECTOR (5 downto 0);
            -- reg_write[1], MemtoReg[0]
           WBControl : out STD_LOGIC_VECTOR (1 downto 0);
           -- JumpEn[2], MemRead[1], MemWrite[0]
           MEMControl : out STD_LOGIC_VECTOR (2 downto 0);
           -- ALUOp[3:2], RegDst[1], ALUSrc[0]
           EXControl : out STD_LOGIC_VECTOR (3 downto 0)
          ); 
end Control_Unit;

--Must Decode for:
    -- RTYPE
    -- lw
    -- sw
    -- jump
    -- addi
architecture Behavioral of Control_Unit is

begin
process (Opcode) begin
    -- set everything to zero
    WBControl <= (others => '0');
    MEMControl <= (others => '0');
    EXControl <= (others => '0');
    
    case Opcode is
        when "000000" => --Regtype 
            WBControl <= "10";
            MEMControl <= "000";
            EXControl <= "1010";

        when "100011" => --lw 
            WBControl <= "11";
            MEMControl <= "010";
            EXControl <= "0001";
            
         when "101011" => --sw 
            WBControl <= "00";
            MEMControl <= "001";
            EXControl <= "0001";
            
         when "000010" => --jump (what needs to be cleared for this to go off in mem)
            WBControl <= "00";
            MEMControl <= "100";
            EXControl <= "0000";
            
        when "0010000" => --addi 
            WBControl <= "10";
            MEMControl <= "000";
            EXControl <= "0001";
            
    end case;
 end process; 
 end Behavioral;
