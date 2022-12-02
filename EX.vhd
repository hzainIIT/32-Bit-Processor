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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EX is
    Port (  ALUsrc, RegDst : STD_LOGIC;
            ALUopin : in STD_LOGIC_VECTOR (1 downto 0);
            Inst2, Inst3 : in STD_LOGIC_VECTOR (4 downto 0);
            PCadr, RD1, RD2, Inst1 : in STD_LOGIC_VECTOR (31 downto 0);
            ovfin, zeroin : out STD_LOGIC;
            RegdstOut: out STD_LOGIC_VECTOR (4 downto 0);
            ALUr, RD2Out, PCaddout : out STD_LOGIC_VECTOR (31 downto 0));
end EX;

architecture Behavioral of EX is

    signal ALUconout : STD_LOGIC_VECTOR (3 downto 0);
    signal ALUIn, Shiftp, OffShift : STD_LOGIC_VECTOR (31 downto 0);
    signal CAux, ALUcontOut	: STD_LOGIC;
    
    component ALUCntrl is
        Port (  FuncField : in STD_LOGIC_VECTOR (5 downto 0);
                ALUop : in STD_LOGIC_VECTOR (1 downto 0);
                ALUCon : out STD_LOGIC_VECTOR (3 downto 0));
    end component ALUCntrl;
    
    component ALU is
            Port (  ALUCont : in STD_LOGIC_VECTOR (3 downto 0);
                    A, B : in STD_LOGIC_VECTOR (31 downto 0);
                    ALUResult: out STD_LOGIC_VECTOR (31 downto 0);
                    ovf, zero : out STD_LOGIC);
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

    OffShift <= Inst1(29 downto 0) & "00";
    
    ALUC :  ALUCntrl port map(FuncField => Inst1(5 downto 0), ALUop => ALUOpin, ALUCon => ALUConout);
    A1 :    Adder port map(CIN => '0', X => PCadr, Y => OffShift, COUT => CAux, R => PCaddout);
    ALU1 :  ALU port map(ALUCont => ALUConout, A => RD1, B=> ALUIn, zero => zeroin, ovf => ovfin, ALUResult => ALUr);
    
    MUX_Inst:
		process(RegDst, Inst2, Inst3) is
    		begin
    	 		if( RegDst = '0') then
    	 			RD2Out <= Inst2; 
	    	 	else
    		 		RD2Out <= Inst3;
    		 	end if;
    	 end process;
    	 
    MUX_EX:
		process(ALUsrc, Inst1, RD2) is
    		begin
    	 		if( ALUsrc = '0') then
    	 			ALUIn <= RD2; 
	    	 	else
    		 		ALUIn <= Inst1;
    		 	end if;
    	 end process;

end Behavioral;
