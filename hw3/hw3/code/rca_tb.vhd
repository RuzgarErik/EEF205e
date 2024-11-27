library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryAdder_tb is
end RippleCarryAdder_tb;

architecture Behavioral of RippleCarryAdder_tb is
    -- Component Declaration
    component RippleCarryAdder
        Port ( 
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Sum : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;
    
    -- Test signals
    signal A_test : STD_LOGIC_VECTOR(3 downto 0);
    signal B_test : STD_LOGIC_VECTOR(3 downto 0);
    signal Sum_test : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout_test : STD_LOGIC;
    
begin
    -- Connecting the component
    UUT: RippleCarryAdder port map (
        A => A_test,
        B => B_test,
        Sum => Sum_test,
        Cout => Cout_test
    );
    
    -- Test process
    test_process: process
    begin
        -- Test case 1: 0 + 0 = 0
        A_test <= "0000";
        B_test <= "0000";
        wait for 10 ns;
        
        -- Test case 2: 5 + 3 = 8
        A_test <= "0101";  -- 5 in binary
        B_test <= "0011";  -- 3 in binary
        wait for 10 ns;
        
        -- Test case 3: 7 + 4 = 11
        A_test <= "0111";  -- 7 in binary
        B_test <= "0100";  -- 4 in binary
        wait for 10 ns;
        
        -- Test case 4: Testing carry out
        A_test <= "1111";  -- 15 in binary
        B_test <= "0001";  -- 1 in binary
        wait for 10 ns;
        
        -- Test case 5: Another simple addition
        A_test <= "0110";  -- 6 in binary
        B_test <= "0010";  -- 2 in binary
        wait for 10 ns;
        
        wait;  -- End simulation
    end process;
    
end Behavioral;