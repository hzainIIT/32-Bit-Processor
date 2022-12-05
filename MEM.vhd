----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 09:43:48 PM
-- Design Name: 
-- Module Name: MEM - Behavioral
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

entity MEM is
    Port (  Branch, zero, Memwritein, Memreadin : STD_LOGIC;
            ALUR, RD2 : in STD_LOGIC_VECTOR (31 downto 0);
            Bout : out STD_LOGIC;
            RD : out STD_LOGIC_VECTOR (31 downto 0));
end MEM;

architecture Behavioral of MEM is
    
    component Datamem is
        Port (  Memwrite, Memread : STD_LOGIC;
                Addr, WriteData : in STD_LOGIC_VECTOR (31 downto 0);
                Read : out STD_LOGIC_VECTOR (31 downto 0));
    end component Datamem;
    
    --anda <= branch AND zero AND Bout;
    
begin

    dmem1 : Datamem port map(Memwrite => Memwritein, Memread => Memreadin, Addr => ALUR, WriteData => RD2, Read => RD);

end Behavioral;
