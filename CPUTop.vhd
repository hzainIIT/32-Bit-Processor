----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 01:11:23 AM
-- Design Name: 
-- Module Name: IF_EX - Behavioral
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

entity CPUTop is
--  Port ( );
end CPUTop;

architecture Behavioral of CPUTop is

component Instruction_Fetch is
    port(
        --CLK : in std_logic;
        NewPC : in std_logic_vector(31 downto 0);
        PCCarry : out std_logic_vector(31 downto 0);
        Instruction : out std_logic_vector(31 downto 0)
    );
end component Instruction_Fetch;

signal IF_PC_in : std_logic_vector (31 downto 0) := (others => '0');
signal IF_PC_out : std_logic_vector (31 downto 0) := (others => '0');
signal IF_Instruction_out : std_logic_vector (31 downto 0) := (others => '0');

component Instruction_Decode is
    Port ( 
--           CLK : in STD_LOGIC; -- TODO
           Reset : in STD_LOGIC;
           Instruction : in STD_LOGIC_VECTOR (31 downto 0);
--           PCCarry : inout STD_LOGIC_VECTOR (31 downto 0);
           WriteReg : in STD_LOGIC_VECTOR (4 downto 0);
           WriteData: in STD_LOGIC_VECTOR (31 downto 0);
           RegWriteControl: in STD_LOGIC;
           -- reg_write[1], MemtoReg[0]
           WBControl : out STD_LOGIC_VECTOR (1 downto 0); --size subject to change
           -- PCsrc[5] JumpEn[4] ALUOp[3:2], RegDst[1], ALUSrc[0]
           EXControl : out STD_LOGIC_VECTOR (5 downto 0); --size subject to change
           -- , MemRead[1], MemWrite[0]
           MEMControl : out STD_LOGIC_VECTOR (1 downto 0); --size subject to change
           jumpaddr : out STD_LOGIC_VECTOR (25 downto 0);
           RD : out STD_LOGIC_VECTOR (4 downto 0);
           RT : out STD_LOGIC_VECTOR (4 downto 0);
           SECarry: out STD_LOGIC_VECTOR (31 downto 0); --includes funct for R and IMM for I
           ReadData1 : out STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out STD_LOGIC_VECTOR (31 downto 0));
end component Instruction_Decode;

component EX is
    Port (  
            ExOp : in STD_LOGIC_VECTOR (3 downto 0);
            Rt, Rd : in STD_LOGIC_VECTOR (4 downto 0);
            JumpAdr : in STD_LOGIC_VECTOR (25 downto 0);
            PCadr, RD1, RD2, SigCarry : in STD_LOGIC_VECTOR (31 downto 0);
            JumpEn : in STD_LOGIC;
            zeroin : out STD_LOGIC;
            RegdstOut: out STD_LOGIC_VECTOR (4 downto 0);
            ALUr, RD2Out, PCaddout : out STD_LOGIC_VECTOR (31 downto 0));
end component EX;

signal EX_ALU_Result : std_logic_vector (31 downto 0);
signal EX_Reg2Out : std_logic_vector (31 downto 0);
signal EX_PC_Out : std_logic_vector (31 downto 0);
signal EX_Regdst_Out : std_logic_vector (4 downto 0);

signal ID_reset : STD_LOGIC := '1';
signal ID_Instruction_in : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal ID_WriteReg_in : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
signal ID_WriteData_in : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal ID_RegWriteControl_in : STD_LOGIC := '0';
-- reg_write[1], MemtoReg[0]
signal ID_WBControl_out : STD_LOGIC_VECTOR (1 downto 0) := (others => '0'); 
-- PCsrc[5] JumpEn[4] ALUOp[3:2], RegDst[1], ALUSrc[0]
signal ID_EXControl_out : STD_LOGIC_VECTOR (5 downto 0);
-- , MemRead[1], MemWrite[0]
signal ID_MEMControl_out : STD_LOGIC_VECTOR (1 downto 0);
signal ID_jumpaddr_out : STD_LOGIC_VECTOR (25 downto 0);
signal ID_RD_out : STD_LOGIC_VECTOR (4 downto 0);
signal ID_RT_out : STD_LOGIC_VECTOR (4 downto 0);
signal ID_SignExt_out: STD_LOGIC_VECTOR (31 downto 0); 
signal ID_ReadData1_out : STD_LOGIC_VECTOR (31 downto 0);
signal ID_ReadData2_out : STD_LOGIC_VECTOR (31 downto 0);

component MEM is
    Port (  Memwritein, Memreadin, rst : STD_LOGIC;
            ALUR, RD2 : in STD_LOGIC_VECTOR (31 downto 0);
            RD : out STD_LOGIC_VECTOR (31 downto 0));
end component MEM;

signal Mem_RD_Out : STD_LOGIC_VECTOR (31 downto 0);

component Write_Back is
    Port ( WBControl : in STD_LOGIC_VECTOR (1 downto 0);
           MemIn : in STD_LOGIC_VECTOR (31 downto 0);
           ALUIn : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : out STD_LOGIC);
end component Write_Back;

signal WB_DataOut : STD_LOGIC_VECTOR (31 downto 0);
signal WB_RegWrite : STD_LOGIC;

begin
-- Instantiate IF stage
IFStage: Instruction_Fetch port map (
    NewPC => IF_PC_in,
    PCCarry => IF_PC_out,
    Instruction => IF_Instruction_out
);


-- Instantiate ID stage
IDStage: Instruction_Decode port map (
   Reset => ID_reset,
   Instruction => IF_Instruction_out, --TBD
   WriteReg => ID_WriteReg_in,
   WriteData => ID_WriteData_in,
   RegWriteControl => ID_RegWriteControl_in,
   -- reg_write[1], MemtoReg[0]
   WBControl => ID_WBControl_out,
   -- PCsrc[5] JumpEn[4] ALUOp[3:2], RegDst[1], ALUSrc[0]
   EXControl => ID_EXControl_out,
   -- , MemRead[1], MemWrite[0]
   MEMControl => ID_MEMControl_out,
   jumpaddr => ID_jumpaddr_out,
   RD => ID_RD_out,
   RT =>  ID_RT_out,
   SECarry => ID_SignExt_out,
   ReadData1 => ID_ReadData1_out,
   ReadData2 => ID_ReadData2_out
);

TestEx : EX port map(   
    ExOp => ID_EXControl_out(3 downto 0),
    Rt => ID_RT_out,
    Rd => ID_RD_out,
    PCadr => IF_PC_out,
    RD1 => ID_ReadData1_out,
    RD2 => ID_ReadData2_out,
    SigCarry => ID_SignExt_out,
    JumpAdr => ID_jumpaddr_out,
    JumpEn => ID_EXControl_out(4),
    RegdstOut => EX_Regdst_Out, 
    ALUr => EX_ALU_Result,
    RD2Out => EX_Reg2Out,
    PCaddout => EX_PC_Out
);

TestMem : MEM port map(
    Memwritein => ID_MEMControl_out(0),
    Memreadin => ID_MEMControl_out(1),
    rst => ID_reset,
    ALUr => EX_ALU_Result,
    RD2 => EX_Reg2Out,
    RD => Mem_RD_Out
);

TestWB : Write_Back port map(
    WBControl => ID_WBControl_out,
    MemIn => Mem_RD_Out,
    ALUin => EX_ALU_Result,
    DataOut => WB_DataOut,
    RegWrite => WB_RegWrite
);
    

induv_stim_proc : process
    constant cc : time := 10 ps;
    begin 
    -- set up reg file
--    wait for cc;
    ID_reset <= '0';
    
    -- test instruction fetch
--    wait for cc;
    IF_PC_in <= "00000000000000000000000000000000"; --00
--    wait for cc;
--    ID_Instruction_in <=IF_Instruction_out;
--    ID_WriteReg_in <= ID_RD_out;
    
    wait for cc;
    IF_PC_in <= "00000000000000000000000000000100"; --04
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;

    wait for cc;
    IF_PC_in <= "00000000000000000000000000001000"; --08
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;
    
    wait for cc;
    IF_PC_in <= "00000000000000000000000000001100"; --0c
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;
    
    wait for cc;
    IF_PC_in <= "00000000000000000000000000010000"; --10
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;
    
    wait for cc;
    IF_PC_in <= "00000000000000000000000000010100"; --14
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;
        
    wait for cc;
    IF_PC_in <= "00000000000000000000000000011000"; --18
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;
        
    wait for cc;
    IF_PC_in <= "00000000000000000000000000011100"; --1c
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;
        
    wait for cc;
    IF_PC_in <= "00000000000000000000000000100000"; --20
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;    
    
    wait for cc;
    IF_PC_in <= "00000000000000000000000000100100"; --24
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;
        
    wait for cc;
    IF_PC_in <= "00000000000000000010010100000000"; --28
--    wait for cc;
    ID_Instruction_in <= IF_instruction_out;
        
--    wait for cc;
--    ID_RegWriteControl_in <= '1';
--    ID_WriteReg_in <= "00000";
--    ID_WriteData_in <= "10000000000000000000000000000000";
    
end process;

end Behavioral;
