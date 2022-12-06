----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2022 06:34:35 PM
-- Design Name: 
-- Module Name: IF_testbench - Behavioral
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

entity IF_testbench is
end IF_testbench;

architecture Behavioral of IF_testbench is

-- IF component
component Instruction_Fetch is
    port(
        --CLK : in std_logic;
        NewPC : in std_logic_vector(31 downto 0);
        PCCarry : out std_logic_vector(31 downto 0);
        Instruction : out std_logic_vector(31 downto 0)
    );
end component Instruction_Fetch;

-- signals
signal PCin : std_logic_vector (31 downto 0) := (others => '0');
signal PCout : std_logic_vector (31 downto 0) := (others => '0');
signal InstructionOut : std_logic_vector (31 downto 0) := (others => '0');

begin

-- instantiate IF stage
IFStage: Instruction_Fetch port map (
    NewPC => PCin,
    PCCarry => PCout,
    Instruction => InstructionOut
);

-- stim proc
stim_proc : process
    constant cc: time := 10 ps;
    begin
    -- fetch first instruction
--    wait for cc;
    PCin <= "00000000000000000000000000000000";
    
    wait for cc;
    
    -- fetch second instruction
    PCin <= "00000000000000000000000000000100";
    
    wait for cc;
    
    -- fetch 3rd instruction
    PCin <= "00000000000000000000000000001000";
    
    wait for cc;
    
    PCin <= "00000000000000000000000000001100";
    
    wait for cc;
    
    PCin <= "00000000000000000000000000010000";
    
    wait for cc;
    
    PCin <= "00000000000000000000000000010100";
    
    wait for cc;
    
    PCin <= "00000000000000000000000000011000";
    
    wait for cc;
    
    PCin <= "00000000000000000000000000011100";
    
    wait for cc;
    
    PCin <= "00000000000000000000000000100000";
    
    wait for cc;
    
    PCin <= "00000000000000000000000000100100";
    
    wait for cc;
    
    PCin <= "00000000000000000010010100000000";
    end process;

end Behavioral;
