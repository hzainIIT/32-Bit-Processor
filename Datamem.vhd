----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 01:57:31 PM
-- Design Name: 
-- Module Name: Datamem - Behavioral
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

entity Datamem is
        Port (  Memwrite, Memread, rst : STD_LOGIC;
                Addr, WriteData : in STD_LOGIC_VECTOR (31 downto 0);
                Read : out STD_LOGIC_VECTOR (31 downto 0));
end Datamem;

architecture Behavioral of Datamem is

    subtype Mem_T is STD_LOGIC_VECTOR (31 downto 0);
    type MemFILE_T is array (6000 downto 0) of Mem_t;
    
    signal Memfile : MemFILE_T; -- 32 addresses to access

begin

    process (Memwrite, Memread, WriteData, Addr, rst) begin
        if Memwrite = '1' then
            Memfile(to_integer(unsigned(Addr))) <= WriteData;
        elsif Memread = '1' then
            Read <= Memfile(to_integer(unsigned(Addr)));
        end if;
        
        if rst = '1' then
            for i in 0 to 6000 loop
                Memfile(i) <= (others=>'1');
            end loop;
            --Memfile(257) <= "00000000000000000000000000000011";
            --Memfile(101) <= "00000000000000000000000000000111";
        end if;
        
    end process;
            


end Behavioral;
