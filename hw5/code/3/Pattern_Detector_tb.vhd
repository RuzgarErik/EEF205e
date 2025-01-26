library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pattern_Detector_tb is
end Pattern_Detector_tb;

architecture Behavioral of Pattern_Detector_tb is
    signal CLK : STD_LOGIC := '0';
    signal DATA_IN : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Z : STD_LOGIC;

    component Pattern_Detector is
        Port (
            CLK : in STD_LOGIC;
            DATA_IN : in STD_LOGIC_VECTOR(1 downto 0);
            Z : out STD_LOGIC
        );
    end component;

begin
    uut: Pattern_Detector
        port map (
            CLK => CLK,
            DATA_IN => DATA_IN,
            Z => Z
        );

    clock : process
    begin
        while true loop
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;
        end loop;
    end process;

    process
    begin
        wait for 10 ns; 
        DATA_IN <= "00";
        wait for 10 ns;
        DATA_IN <= "10";
        wait for 10 ns;
        DATA_IN <= "10";
        wait for 10 ns;
        DATA_IN <= "11";
        wait for 10 ns;
        DATA_IN <= "01";
        wait for 10 ns;
        DATA_IN <= "10";
        wait for 10 ns;
        DATA_IN <= "11";
        wait for 10 ns;
        DATA_IN <= "00";
        wait for 10 ns;
        DATA_IN <= "01";
        wait for 10 ns;
        DATA_IN <= "00";
        wait for 10 ns;
        DATA_IN <= "10";
        wait for 10 ns;
        DATA_IN <= "00";
        wait for 10 ns;
        DATA_IN <= "10";
        wait for 10 ns;
        DATA_IN <= "10";
        wait for 10 ns;
        DATA_IN <= "11";
        wait for 10 ns;
        DATA_IN <= "10";
        wait for 10 ns;
        DATA_IN <= "10";
        wait for 10 ns;
        DATA_IN <= "11";
        wait for 10 ns;
        wait;
    end process;

end Behavioral;
