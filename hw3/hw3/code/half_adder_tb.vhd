library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;

architecture Behavioral of half_adder_tb is
    -- Component Declaration
    component half_adder
        Port ( a : in  STD_LOGIC;
               b : in  STD_LOGIC;
               s : out  STD_LOGIC;
               c : out  STD_LOGIC);
    end component;
    
    -- Signal Declaration
    signal a_test : STD_LOGIC := '0';
    signal b_test : STD_LOGIC := '0';
    signal s_test : STD_LOGIC;
    signal c_test : STD_LOGIC;

begin
    -- Unit Under Test (UUT)
    UUT: half_adder port map (
        a => a_test,
        b => b_test,
        s => s_test,
        c => c_test
    );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test case 1: 0 + 0 = 0, carry = 0
        a_test <= '0';
        b_test <= '0';
        wait for 100 ns;
        assert (s_test = '0' and c_test = '0')
            report "Test failed for input combination 0,0"
            severity ERROR;
            
        -- Test case 2: 0 + 1 = 1, carry = 0
        a_test <= '0';
        b_test <= '1';
        wait for 100 ns;
        assert (s_test = '1' and c_test = '0')
            report "Test failed for input combination 0,1"
            severity ERROR;
            
        -- Test case 3: 1 + 0 = 1, carry = 0
        a_test <= '1';
        b_test <= '0';
        wait for 100 ns;
        assert (s_test = '1' and c_test = '0')
            report "Test failed for input combination 1,0"
            severity ERROR;
            
        -- Test case 4: 1 + 1 = 0, carry = 1
        a_test <= '1';
        b_test <= '1';
        wait for 100 ns;
        assert (s_test = '0' and c_test = '1')
            report "Test failed for input combination 1,1"
            severity ERROR;
            
        -- End simulation
        wait for 100 ns;
        report "Simulation completed successfully!"
        severity NOTE;
        wait; -- Wait forever
    end process;

end Behavioral;