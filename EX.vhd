----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 06:16:08 PM
-- Design Name: 
-- Module Name: EX - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EX is
    Port (  ExOp : in STD_LOGIC_VECTOR (3 downto 0);
            Rt, Rd : in STD_LOGIC_VECTOR (4 downto 0);
            JumpAdr : in STD_LOGIC_VECTOR (25 downto 0);
            PCadr, RD1, RD2, SigCarry : in STD_LOGIC_VECTOR (31 downto 0);
            JumpEn : in STD_LOGIC;
            zeroin : out STD_LOGIC;
            RegdstOut: out STD_LOGIC_VECTOR (4 downto 0);
            ALUr, RD2Out, PCaddout : out STD_LOGIC_VECTOR (31 downto 0));
end EX;

architecture Behavioral of EX is

    signal RegDst, ALUsrc : STD_LOGIC;
    signal ALUOpin : STD_LOGIC_VECTOR (1 downto 0);
    signal ALUconout : STD_LOGIC_VECTOR (3 downto 0);
    signal ALUIn, Shiftp, OffShift, PCinc: STD_LOGIC_VECTOR (31 downto 0);
    signal CAux, ALUcontOut	: STD_LOGIC;
    
    component ALUCntrl is
        Port (  FuncField : in STD_LOGIC_VECTOR (5 downto 0);
                ALUop : in STD_LOGIC_VECTOR (1 downto 0);
                ALUCon : out STD_LOGIC_VECTOR (3 downto 0));
    end component ALUCntrl;
    
    component ALU is
            Port (  ALUCont : in STD_LOGIC_VECTOR (3 downto 0);
                    A, B : in STD_LOGIC_VECTOR (31 downto 0);
                    ALUResult : out STD_LOGIC_VECTOR (31 downto 0);
                    ovf : out STD_LOGIC);
    end component ALU;
    
    component Adder is
            port(
                    X : in STD_LOGIC_VECTOR(31 downto 0);
                    Y : in STD_LOGIC_VECTOR(31 downto 0);
                    CIN	: in STD_LOGIC;
                    COUT : out STD_LOGIC;
                    R : out STD_LOGIC_VECTOR(31 downto 0)
            );
    end component Adder;
    
begin

    RegDst <= ExOp(1);
    ALUsrc <= ExOp(0);
    ALUOpin <= ExOp(3 downto 2);

    OffShift <= "00000000000000000000000000000100";
    
    ALUC :  ALUCntrl port map(FuncField => SigCarry(5 downto 0), ALUop => ALUOpin, ALUCon => ALUConout);
    --A1 :    Adder port map(CIN => '0', X => PCadr, Y => OffShift, COUT => CAux, R => PCinc);
    ALU1 :  ALU port map(ALUCont => ALUConout, A => RD1, B=> ALUIn, ovf => zeroin, ALUResult => ALUr);
    
    MUX_Inst:
		process(RegDst, Rt, Rd) is
    		begin
    	 		if( RegDst = '0') then
    	 			RegdstOut <= Rt; 
	    	 	else
    		 		RegdstOut <= Rd;
    		 	end if;
    	 end process;
    	 
    MUX_EX:
		process(ALUsrc, SigCarry, RD2) is
    		begin
    	 		if( ALUsrc = '0') then
    	 			ALUIn <= RD2; 
	    	 	else
    		 		ALUIn <= SigCarry;
    		 		RD2Out <= RD2;
    		 	end if;
    	 end process;
    	 
    process(JumpEn, JumpAdr, PCadr) is begin
        if JumpEn = '1' then
            PCaddout <= "0000" & JumpAdr & "00";
        else
            PCaddout <= PCadr + OffShift;
        end if;
    end process;

end Behavioral;