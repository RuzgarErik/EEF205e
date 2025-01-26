library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity JK_Latch_tb is
end JK_Latch_tb;

architecture Behavioral of JK_Latch_tb is

    component JK_Latch
        Port ( J : in  STD_LOGIC;
               K : in  STD_LOGIC;
               EN: in STD_LOGIC;
               Q : out  STD_LOGIC;
               QN : out  STD_LOGIC);
    end component;

    signal JTB : STD_LOGIC := '0';
    signal KTB : STD_LOGIC := '0';
    signal ENTB : STD_LOGIC := '0';
    signal QTB : STD_LOGIC;
    signal QNTB : STD_LOGIC;

begin

    UUT: JK_Latch port map (J => JTB, K => KTB, EN => ENTB, Q => QTB, QN => QNTB);

    stim_proc: process
    begin

        -- Initial state

        JTB <= '0';
        KTB <= '0';
        ENTB <= '0';
        wait for 100 ns;


        -- No change expected
        ENTB <= '1';
        JTB <= '0';
        KTB <= '0';
        wait for 100 ns;

        -- Q = 1
        ENTB <= '1';
        JTB <= '1';
        KTB <= '0';
        wait for 100 ns;
        
        -- Q = 0
        ENTB <= '1';
        JTB <= '0';
        KTB <= '1';
        wait for 100 ns;


        -- Toggle

        ENTB <= '1';
        JTB <= '1';
        KTB <= '1';
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
