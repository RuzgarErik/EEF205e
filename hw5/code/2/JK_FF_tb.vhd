library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF_TB is
end JK_FF_TB;

architecture Behavioral of JK_FF_TB is

    component JK_FF
        Port ( J : in  STD_LOGIC;
               K : in  STD_LOGIC;
               CLK: in STD_LOGIC;
               Q : out  STD_LOGIC;
               QN : out  STD_LOGIC);
    end component;

    signal JTB : STD_LOGIC := '0';
    signal KTB : STD_LOGIC := '0';
    signal CLKTB : STD_LOGIC := '0';
    signal QTB : STD_LOGIC;
    signal QNTB : STD_LOGIC;

begin

    UUT: JK_FF port map (J => JTB, K => KTB, CLK => CLKTB, Q => QTB, QN => QNTB);

    clock : process
    begin
        CLKTB <= '0';
        wait for 5 ns;
        CLKTB <= '1';
        wait for 5 ns;
    end process;

    stim_proc: process
    begin
        JTB <= '0';
        KTB <= '0';
        wait for 100 ns;

        JTB <= '0';
        KTB <= '0';
        wait for 100 ns;

        JTB <= '1';
        KTB <= '0';
        wait for 100 ns;
        
        JTB <= '0';
        KTB <= '1';
        wait for 100 ns;

        JTB <= '1';
        KTB <= '1';
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
