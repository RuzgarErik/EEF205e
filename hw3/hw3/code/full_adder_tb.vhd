library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
    component FullAdder
        Port ( 
            a : in  STD_LOGIC;
            b : in  STD_LOGIC;
            c : in  STD_LOGIC;
            Sum : out  STD_LOGIC;
            Carry_Out : out  STD_LOGIC
        );
    end component;
    
    signal a_test : STD_LOGIC := '0';
    signal b_test : STD_LOGIC := '0';
    signal c_test : STD_LOGIC := '0';
    signal sum_test : STD_LOGIC;
    signal carry_test : STD_LOGIC;

begin

    UUT: FullAdder
        Port map (
            a => a_test,
            b => b_test,
            c => c_test,
            Sum => sum_test,
            Carry_Out => carry_test
        );

    stimulus: process
    begin
        a_test <= '0'; b_test <= '0'; c_test <= '0';
        wait for 10 ns;
        assert (sum_test = '0' and carry_test = '0')
        report "Test failed for input combination: 0,0,0"
        severity ERROR;

        a_test <= '0'; b_test <= '0'; c_test <= '1';
        wait for 10 ns;
        assert (sum_test = '1' and carry_test = '0')
        report "Test failed for input combination: 0,0,1"
        severity ERROR;

        a_test <= '0'; b_test <= '1'; c_test <= '0';
        wait for 10 ns;
        assert (sum_test = '1' and carry_test = '0')
        report "Test failed for input combination: 0,1,0"
        severity ERROR;

        a_test <= '0'; b_test <= '1'; c_test <= '1';
        wait for 10 ns;
        assert (sum_test = '0' and carry_test = '1')
        report "Test failed for input combination: 0,1,1"
        severity ERROR;

        a_test <= '1'; b_test <= '0'; c_test <= '0';
        wait for 10 ns;
        assert (sum_test = '1' and carry_test = '0')
        report "Test failed for input combination: 1,0,0"
        severity ERROR;

        a_test <= '1'; b_test <= '0'; c_test <= '1';
        wait for 10 ns;
        assert (sum_test = '0' and carry_test = '1')
        report "Test failed for input combination: 1,0,1"
        severity ERROR;

        a_test <= '1'; b_test <= '1'; c_test <= '0';
        wait for 10 ns;
        assert (sum_test = '0' and carry_test = '1')
        report "Test failed for input combination: 1,1,0"
        severity ERROR;

        a_test <= '1'; b_test <= '1'; c_test <= '1';
        wait for 10 ns;
        assert (sum_test = '1' and carry_test = '1')
        report "Test failed for input combination: 1,1,1"
        severity ERROR;

        wait for 10 ns;
        report "All test cases completed successfully!"
        severity NOTE;

        wait;
    end process;

end Behavioral;
