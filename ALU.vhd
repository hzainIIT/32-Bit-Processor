----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2022 10:48:11 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port (  ALUCont : in STD_LOGIC_VECTOR (5 downto 0);
            A, B : in STD_LOGIC_VECTOR (31 downto 0);
            ALUResult : out STD_LOGIC_VECTOR (31 downto 0);
            ovf, zero : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

    signal CO: STD_LOGIC_VECTOR (31 downto 0);
    signal s, CIn : STD_LOGIC;
    
    component ALU_1bit
            Port (  op : in STD_LOGIC_VECTOR (1 downto 0);
                    a, b, less, a_inv, b_inv, CIn : in STD_LOGIC;
                    c_out, result : out STD_LOGIC);
    end component;
    
    component ALU_msb
            Port (  op : in STD_LOGIC_VECTOR (1 downto 0);
                    a, b, less, a_inv, b_inv, CIn : in STD_LOGIC;
                    overflow, result, set : out STD_LOGIC);
    end component;    
    

begin

    s <= '0';
    CIn <= '0';
    Acont : process(ALUCont, CIn)
    begin
        case ALUCont is
            when "100110" => CIn <= '1';
            when "100111" => CIn <= '1';
            when others => CIn <= '0';
        end case;
    
    end process Acont;
    
    A0: ALU_1bit port map (a => A(0), b => B(0), less => s, a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CIn, op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(0), result => ALUResult(0));
    A1: ALU_1bit port map (a => A(1), b => B(1), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(0), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(1), result => ALUResult(1));
    A2: ALU_1bit port map (a => A(2), b => B(2), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(1), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(2), result => ALUResult(2));
    A3: ALU_1bit port map (a => A(3), b => B(3), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(2), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(3), result => ALUResult(3));
    A4: ALU_1bit port map (a => A(4), b => B(4), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(3), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(4), result => ALUResult(4));
    A5: ALU_1bit port map (a => A(5), b => B(5), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(4), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(5), result => ALUResult(5));
    A6: ALU_1bit port map (a => A(6), b => B(6), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(5), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(6), result => ALUResult(6));
    A7: ALU_1bit port map (a => A(7), b => B(7), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(6), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(7), result => ALUResult(7));
    A8: ALU_1bit port map (a => A(8), b => B(8), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(7), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(8), result => ALUResult(8));
    A9: ALU_1bit port map (a => A(9), b => B(9), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(8), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(9), result => ALUResult(9));
    A10: ALU_1bit port map (a => A(10), b => B(10), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(9), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(10), result => ALUResult(10));
    A11: ALU_1bit port map (a => A(11), b => B(11), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(10), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(11), result => ALUResult(11));
    A12: ALU_1bit port map (a => A(12), b => B(12), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(11), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(12), result => ALUResult(12));
    A13: ALU_1bit port map (a => A(13), b => B(13), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(12), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(13), result => ALUResult(13));
    A14: ALU_1bit port map (a => A(14), b => B(14), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(13), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(14), result => ALUResult(14));
    A15: ALU_1bit port map (a => A(15), b => B(15), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(14), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(15), result => ALUResult(15));
    A16: ALU_1bit port map (a => A(16), b => B(16), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(15), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(16), result => ALUResult(16));
    A17: ALU_1bit port map (a => A(17), b => B(17), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(16), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(17), result => ALUResult(17));
    A18: ALU_1bit port map (a => A(18), b => B(18), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(17), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(18), result => ALUResult(18));
    A19: ALU_1bit port map (a => A(19), b => B(19), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(18), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(19), result => ALUResult(19));
    A20: ALU_1bit port map (a => A(20), b => B(20), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(19), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(20), result => ALUResult(20));
    A21: ALU_1bit port map (a => A(21), b => B(21), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(20), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(21), result => ALUResult(21));
    A22: ALU_1bit port map (a => A(22), b => B(22), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(21), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(22), result => ALUResult(22));
    A23: ALU_1bit port map (a => A(23), b => B(23), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(22), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(23), result => ALUResult(23));
    A24: ALU_1bit port map (a => A(24), b => B(24), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(23), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(24), result => ALUResult(24));
    A25: ALU_1bit port map (a => A(25), b => B(25), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(24), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(25), result => ALUResult(25));
    A26: ALU_1bit port map (a => A(26), b => B(26), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(25), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(26), result => ALUResult(26));
    A27: ALU_1bit port map (a => A(27), b => B(27), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(26), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(27), result => ALUResult(27));
    A28: ALU_1bit port map (a => A(28), b => B(28), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(27), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(28), result => ALUResult(28));
    A29: ALU_1bit port map (a => A(29), b => B(29), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(28), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(29), result => ALUResult(29));
    A30: ALU_1bit port map (a => A(30), b => B(30), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(29), op(1 downto 0) => ALUCont(1 downto 0), c_out => CO(30), result => ALUResult(30));
    A31: ALU_msb port map (a => A(31), b => B(31), less => '0', a_inv => ALUCont(3), b_inv => ALUCont(2) , CIn => CO(30), op(1 downto 0) => ALUCont(1 downto 0), set => s, result => ALUResult(31), overflow => ovf);
    
end Behavioral;
