----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2022 08:51:02 PM
-- Design Name: 
-- Module Name: EX_tb2 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EX_tb2 is
--  Port ( );
end EX_tb2;

architecture Behavioral of EX_tb2 is

    component EX is
    Port (  ExOp : in STD_LOGIC_VECTOR (3 downto 0);
            Rt, Rd : in STD_LOGIC_VECTOR (4 downto 0);
            --JumpAdr : in STD_LOGIC_VECTOR (25 downto 0);
            PCadr, RD1, RD2, SigCarry : in STD_LOGIC_VECTOR (31 downto 0);
            ovfin, zeroin, JumpEn : out STD_LOGIC;
            RegdstOut: out STD_LOGIC_VECTOR (4 downto 0);
            ALUr, RD2Out, PCaddout : out STD_LOGIC_VECTOR (31 downto 0));
    end component EX;
    
    signal ExOpin : STD_LOGIC_VECTOR (3 downto 0);
    signal Rtin, Rdin : STD_LOGIC_VECTOR (4 downto 0);
    signal PCadrin, RD1in, RD2in, SigCarryin, Instruction : STD_LOGIC_VECTOR (31 downto 0);
    signal ovfin, JumpEn : STD_LOGIC;
    signal RegdstOut : STD_LOGIC_VECTOR (4 downto 0);
    signal ALUr, RD2Out, PCaddout : STD_LOGIC_VECTOR (31 downto 0);

begin

    TestEx : EX port map(   Exop => ExOpin,
                            Rt => Rtin,
                            Rd => Rdin,
                            PCadr => PCadrin,
                            RD1 => RD1in,
                            RD2 => RD2in,
                            SigCarry => SigCarryin,
                            ovfin => ovfin,
                            JumpEn => Jumpen,
                            RegdstOut => RegdstOut, 
                            ALUr => ALUr,
                            RD2Out => RD2Out,
                            PCaddout => PCaddout);

stim_proc : process
    constant cc: time := 10 ns;
    begin
    
    --wait for cc;

    Instruction <= "00100001011101000000001000000000";  -- 21740200
    ExOpin <= "0001";
    Rtin <= "10100";
    Rdin <= "00000";
    PCadrin <= "11011110101011011011111011101111";
    RD1in <= "00010001000100010001000100010001";  --11111111
    RD2in <= "00100010001000100010001000100010";  --22222222
    SigCarryin <= "00000000000000000000001000000000";
    
    wait for cc;
    
    Instruction <= "00000010010100100100100000101010";
    ExOpin <= "1010";
    Rtin <= "10010";
    Rdin <= "01001";
    PCadrin <= "11011110101011011011111011101111";
    RD1in <= "00010001000100010001000100010001";  --11111111
    RD2in <= "00100010001000100010001000100010";  --22222222
    SigCarryin <= "00000000000000000100100000101010";
 
    wait for cc;
    end process;


end Behavioral;
