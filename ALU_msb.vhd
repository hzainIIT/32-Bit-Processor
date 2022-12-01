----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 12:17:24 AM
-- Design Name: 
-- Module Name: ALU_msb - Behavioral
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

entity ALU_msb is
    Port (  op : in STD_LOGIC_VECTOR (1 downto 0);
            a, b, less, a_inv, b_inv, CIn : in STD_LOGIC;
            overflow, result, set : out STD_LOGIC);
end ALU_msb;

architecture Behavioral of ALU_msb is

    signal ainv, binv, w1, w2, w3, COut, a1, o1, r: STD_LOGIC;

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
    a1 <= w1 AND w2;
    o1 <= w1 OR w2;
    
    M0: mux2_1 port map (in1 => a, in2 => ainv, sel => a_inv, o => w1);
    M1: mux2_1 port map (in1 => b, in2 => binv, sel => b_inv, o => w2);
    F0: full_adder port map (in0 => w1, in1 => w2, carryIn => CIn, sum => w3, carryOut => COut);
    
    process(a, b, less, a_inv, b_inv, CIn, op)
        begin
        case op is
            when "00" => r <= a1;
            when "01" => r <= o1;
            when "10" => r <= w3;
            when "11" => r <= less;
            when others => r <= a1;
        end case;
    end process;
    
    set <= w3;
    result <= r;

end Behavioral;
