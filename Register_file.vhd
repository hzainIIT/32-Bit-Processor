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
    if RegWriteControl = '1' then
        regfile(to_integer(unsigned(WriteReg))) <= WriteData;
    end if;
    ReadData1 <= regfile(to_integer(unsigned(RS)));
    ReadData2 <= regfile(to_integer(unsigned(ReadReg2)));
end process;



end Behavioral;
