library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequence_detector_tb is
end sequence_detector_tb;

architecture Behavioral of sequence_detector_tb is
    signal CLK : STD_LOGIC := '0';
    signal A1  : STD_LOGIC := '0';
    signal A0  : STD_LOGIC := '0';
    signal Z   : STD_LOGIC;

    component sequence_detector is
        Port (
            clk : in  STD_LOGIC;
            A1  : in  STD_LOGIC;
            A0  : in  STD_LOGIC;
            Z   : out STD_LOGIC
        );
    end component;

begin
    uut: sequence_detector
        port map (
            clk => CLK,
            A1  => A1,
            A0  => A0,
            Z   => Z
        );

    clock : process
    begin
        while true loop
            CLK <= '0';
            wait for 10 ns;
            CLK <= '1';
            wait for 10 ns;
        end loop;
    end process;

    stimulus : process
    begin
        wait for 20 ns;
        A1 <= '1'; A0 <= '0'; wait for 20 ns;
        A1 <= '1'; A0 <= '0'; wait for 20 ns;
        A1 <= '1'; A0 <= '1'; wait for 20 ns;
        A1 <= '1'; A0 <= '1'; wait for 20 ns;
        A1 <= '0'; A0 <= '0'; wait for 20 ns;
        A1 <= '0'; A0 <= '1'; wait for 20 ns;
        A1 <= '0'; A0 <= '0'; wait for 20 ns;
        A1 <= '1'; A0 <= '0'; wait for 20 ns;
        A1 <= '1'; A0 <= '0'; wait for 20 ns;
        A1 <= '1'; A0 <= '1'; wait for 20 ns;
        A1 <= '1'; A0 <= '0'; wait for 20 ns;
        A1 <= '1'; A0 <= '0'; wait for 20 ns;
        A1 <= '1'; A0 <= '1'; wait for 20 ns;
        wait;
    end process;

end Behavioral;
