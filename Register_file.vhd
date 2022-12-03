----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2022 10:58:55 PM
-- Design Name: 
-- Module Name: Register_file - Behavioral
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

entity Register_file is
    port(
        Reset : in STD_LOGIC;
        RS : in STD_LOGIC_VECTOR (4 downto 0);
        ReadReg2 : in STD_LOGIC_VECTOR (4 downto 0);
        WriteReg : in STD_LOGIC_VECTOR (4 downto 0);
        WriteData : in STD_LOGIC_VECTOR (31 downto 0);
        RegWriteControl : STD_LOGIC;
        ReadData1 : out STD_LOGIC_VECTOR (31 downto 0);
        ReadData2 : out STD_LOGIC_VECTOR (31 downto 0)
    );
    
end Register_file;

architecture Behavioral of Register_file is

    -- make datatypes for ease of notation
    subtype REG_T is STD_LOGIC_VECTOR (31 downto 0);
    type REGFILE_T is array (integer range <>) of REG_T;
    
    signal regfile : REGFILE_T(0 to 31);
    
begin

--write before read
process (regfile, RS, ReadReg2) begin
    if Reset = '1' then
        regfile(0) <= "00000000000000000000000000000001";
        regfile(1) <= "00000000000000000000000000000010";
        regfile(2) <= "00000000000000000000000000000100";
        regfile(3) <= "00000000000000000000000000001000";
        regfile(4) <= "00000000000000000000000000010000";
        regfile(5) <= "00000000000000000000000000100000";
        regfile(6) <= "00000000000000000000000001000000";
        regfile(7) <= "00000000000000000000000010000000";
        regfile(8) <= "00000000000000000000000100000000";
        regfile(9) <= "00000000000000000000001000000000";
        regfile(10) <= "00000000000000000000100000000000";
        regfile(11) <= "00000000000000000001000000000000";
        regfile(12) <= "00000000000000000010000000000000";
        regfile(13) <= "00000000000000000100000000000000";
        regfile(14) <= "00000000000000001000000000000000";
        regfile(15) <= "00000000000000010000000000000000";
        regfile(16) <= "00000000000000100000000000000000";
        regfile(17) <= "00000000000001000000000000000000";
        regfile(18) <= "00000000000010000000000000000000";
        regfile(19) <= "00000000000100000000000000000000";
        regfile(20) <= "00000000001000000000000000000000";
        regfile(21) <= "00000000010000000000000000000000";
        regfile(22) <= "00000000100000000000000000000000";
        regfile(23) <= "00000001000000000000000000000000";
        regfile(24) <= "00000010000000000000000000000000";
        regfile(25) <= "00000100000000000000000000000000";
        regfile(26) <= "00001000000000000000000000000000";
        regfile(27) <= "00010000000000000000000000000000";
        regfile(28) <= "00100000000000000000000000000000"; --28
        regfile(29) <= "01000000000000000000000000000000";
        regfile(30) <= "10000000000000000000000000000000";
        regfile(31) <= "00000000000000000000000000000000";
    
    elsif RegWriteControl = '1' then
        regfile(to_integer(unsigned(WriteReg))) <= WriteData;
--        regfile(0) <= "10000000000000000000000000000000";
    end if;
    ReadData1 <= regfile(to_integer(unsigned(RS)));
    ReadData2 <= regfile(to_integer(unsigned(ReadReg2)));
end process;



end Behavioral;
