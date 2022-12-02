----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alex Maliwat
-- 
-- Create Date: 12/01/2022 06:11:12 PM
-- Design Name: 
-- Module Name: Instruction_Fetch - Behavioral
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

entity Instruction_Fetch is
    port(
        CLK : in std_logic;
        PCSrc : in std_logic;
        NewPC : in std_logic_vector(31 downto 0);
        IncPC : out std_logic_vector(31 downto 0);
        Instruction : out std_logic_vector(31 downto 0)
    );
end Instruction_Fetch;

architecture Behavioral of Instruction_Fetch is

component full_adder is --use full adder from project 2
    port ( carryIn : in STD_LOGIC;
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           sum : out STD_LOGIC;
           carryOut : out STD_LOGIC
     );
     
end component full_adder;

component PCReg is
    port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           PCIn : in STD_LOGIC;
           PCOut : out STD_LOGIC
    );
end component PCReg;

component Instruction_Memory is
    Port ( PCAddress : in STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out STD_LOGIC_VECTOR (31 downto 0));
end component Instruction_Memory;

--component IFIDBuffer is 
--    Port ( CLK : in STD_LOGIC;
--           PCCarryIn : in STD_LOGIC_VECTOR (31 downto 0);
--           InstRegIn : in STD_LOGIC_VECTOR (31 downto 0);
--           PCCarryOut : out STD_LOGIC_VECTOR (31 downto 0);
--           InstRegOut : out STD_LOGIC_VECTOR (31 downto 0)
--     );
--end component IFIDBuffer;
begin


end Behavioral;
