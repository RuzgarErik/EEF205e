library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;

architecture Behavioral of half_adder_tb is
    component half_adder
        Port ( a : in  STD_LOGIC;
               b : in  STD_LOGIC;
               s : out  STD_LOGIC;
               c : out  STD_LOGIC);
    end component;
    
    signal a_test : STD_LOGIC := '0';
    signal b_test : STD_LOGIC := '0';
    signal s_test : STD_LOGIC;
    signal c_test : STD_LOGIC;
begin

    stimulus: process
    begin
        a_test <= '0';
        b_test <= '0';
        wait for 10 ns;
        assert (s_test = '0' and c_test = '0')
        report "Test failed for input combination: 0,0"
        severity ERROR;
        
        a_test <= '0';
        b_test <= '1';
        wait for 10 ns;
        assert (s_test = '1' and c_test = '0')
        report "Test failed for input combination: 0,1"
        severity ERROR;
        
        a_test <= '1';
        b_test <= '0';
        wait for 10 ns;
        assert (s_test = '1' and c_test = '0')
        report "Test failed for input combination: 1,0"
        severity ERROR;
        
        a_test <= '1';
        b_test <= '1';
        wait for 10 ns;
        assert (s_test = '0' and c_test = '1')
        report "Test failed for input combination: 1,1"
        severity ERROR;
        
        wait for 10 ns;
        report "All test cases completed successfully!"
        severity NOTE;
        
        wait;
    end process;

end behavioral;