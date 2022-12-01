----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 02:12:12 AM
-- Design Name: 
-- Module Name: ALU1bit_tb - Behavioral
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

entity ALU1bit_tb is
end ALU1bit_tb;

architecture Behavioral of ALU1bit_tb is

    component ALU_1bit
            Port (  op : in STD_LOGIC_VECTOR (1 downto 0);
                    a, b, less, a_inv, b_inv, CIn : in STD_LOGIC;
                    c_out, result : out STD_LOGIC);
    end component;

signal ain, bin, lessin, ainvin, binvin, cinin, co, r : STD_LOGIC;
signal opin : STD_LOGIC_VECTOR (1 downto 0);

begin

 uut: ALU_1bit port map ( 
    op => opin,
    a => ain,
    b => bin,
    less => lessin,
    a_inv => ainvin,
    b_inv => binvin,
    CIn => cinin,
    c_out => co,
    result => r
    );

stim_proc: process
    constant period: time := 10 ns;
begin

wait for period;    opin <= "00"; ain <= '1'; bin <= '1';
                    lessin <= '0'; ainvin <= '0'; binvin <= '0'; cinin <= '0'; 
                    
wait for period;    opin <= "00"; ain <= '0'; bin <= '1';
                    lessin <= '0'; ainvin <= '0'; binvin <= '0'; cinin <= '0';                     
                    

end process;
end Behavioral;
