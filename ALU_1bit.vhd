----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2022 10:25:48 PM
-- Design Name: 
-- Module Name: ALU_1bit - Behavioral
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

entity ALU_1bit is
    Port (  op : in STD_LOGIC_VECTOR (1 downto 0);
            a, b, less, a_inv, b_inv, CIn : in STD_LOGIC;
            c_out, result : out STD_LOGIC);
end ALU_1bit;

architecture Behavioral of ALU_1bit is

    signal ainv, binv, w1, w2, w3, COut, a1, o1: STD_LOGIC;

    component mux2_1
        Port (  in1, in2, sel : in STD_LOGIC;
                o : out STD_LOGIC);
    end component;
    
    component full_adder
        Port (  in0 : in std_logic;
                in1 : in std_logic;
                carryIn : in std_logic;
                sum : out std_logic;
                carryOut: out std_logic);
    end component;
    
begin

    ainv <=  NOT a;
    binv <=  NOT b;
    
    M0: mux2_1 port map (in1 => a, in2 => ainv, sel => a_inv, o => w1);
    M1: mux2_1 port map (in1 => b, in2 => binv, sel => b_inv, o => w2);
    
    a1 <= w1 AND w2;
    o1 <= w1 OR w2;

    F0: full_adder port map (in0 => w1, in1 => w2, carryIn => CIn, sum => w3, carryOut => c_out);
    
    process(op, a1, o1, less, w3)
        begin
        case op is
            when "00" => result <= a1;
            when "01" => result <= o1;
            when "10" => result <= w3;
            when "11" => result <= less;
            when others => result <= '0';
        end case;
    end process;

    
end Behavioral;
