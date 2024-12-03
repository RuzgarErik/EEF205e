library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMP_1_bit_tb is
end COMP_1_bit_tb;

architecture Behavioral of COMP_1_bit_tb is

    component COMP_1_bit
        port (
            a : in  STD_LOGIC;
            b : in  STD_LOGIC;
            x : out STD_LOGIC;
            y : out STD_LOGIC;
            z : out STD_LOGIC
        );
    end component;


    signal a_tb : STD_LOGIC := '0';
    signal b_tb : STD_LOGIC := '0';
    signal x_tb : STD_LOGIC;
    signal y_tb : STD_LOGIC;
    signal z_tb : STD_LOGIC;

begin

    UUT: COMP_1_bit port map (
        a => a_tb,
        b => b_tb,
        x => x_tb,
        y => y_tb,
        z => z_tb
    );

    stim_proc: process
    
    begin

        a_tb <= '0';
        b_tb <= '0';
        wait for 100 ns;
        
        a_tb <= '0';
        b_tb <= '1';
        wait for 100 ns;
        
        a_tb <= '1';
        b_tb <= '0';
        wait for 100 ns;
        
        a_tb <= '1';
        b_tb <= '1';
        wait for 100 ns;
        
        wait;
        
    end process;

end Behavioral;