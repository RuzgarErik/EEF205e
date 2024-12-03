library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity POZ_COMPARE_tb is
end POZ_COMPARE_tb;

architecture Behavioral of POZ_COMPARE_tb is

    component POZ_COMPARE
        port(
            A: in std_logic_vector(3 downto 0);
            B: in std_logic_vector(3 downto 0);
            X: out std_logic;
            Y: out std_logic;
            Z: out std_logic
        );
    end component;

    signal A: std_logic_vector(3 downto 0);
    signal B: std_logic_vector(3 downto 0);
    signal X: std_logic;
    signal Y: std_logic;
    signal Z: std_logic;

begin
    UUT : POZ_COMPARE port map(A => A, B => B, X => X, Y => Y, Z => Z);

    stim_proc: process
    begin  
        A <= "1000"; -- 8
        B <= "0111"; -- 7
        wait for 100 ns;

        A <= "1010"; -- 10
        B <= "1010"; -- 10
        wait for 100 ns;

        A <= "0101"; -- 5
        B <= "1001"; -- 9
        wait for 100 ns;

        A <= "1111"; -- 15
        B <= "0000"; -- 0
        wait for 100 ns;

        A <= "0000"; -- 0
        B <= "1111"; -- 15
        wait for 100 ns;

        A <= "0000"; -- 0
        B <= "0000"; -- 0
        wait for 100 ns;

        A <= "1111"; -- 15
        B <= "1111"; -- 15
        wait for 100 ns;

        A <= "0110"; -- 6
        B <= "0101"; -- 5
        wait for 100 ns;
        
        wait; 
    end process;

end Behavioral;