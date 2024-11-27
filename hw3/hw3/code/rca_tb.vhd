library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RippleCarryAdder_TB is
end RippleCarryAdder_TB;

architecture Behavioral of RippleCarryAdder_TB is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Sum : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;
    
    signal error_count : integer := 0;
    signal test_count : integer := 0;
    
begin
    UUT: entity work.RippleCarryAdder
        port map (
            A => A,
            B => B,
            Sum => Sum,
            Cout => Cout
        );

    stimulus: process
        variable expected_sum : unsigned(4 downto 0);
        variable actual_sum : unsigned(4 downto 0);
    begin
        report "Starting full range addition test (0-15 for both inputs)";
        
        for i in 0 to 15 loop
            for j in 0 to 15 loop
                A <= std_logic_vector(to_unsigned(i, 4));
                B <= std_logic_vector(to_unsigned(j, 4));
                
                test_count <= test_count + 1;
                
                wait for 10 ns;
                
                expected_sum := to_unsigned(i + j, 5);
                actual_sum := '0' & unsigned(Sum);
                if (Cout = '1') then
                    actual_sum := actual_sum + 16;
                end if;
                
                if (actual_sum /= expected_sum) then
                    error_count <= error_count + 1;
                    report "Error: " & 
                           integer'image(i) & " + " & 
                           integer'image(j) & " = " & 
                           integer'image(to_integer(expected_sum)) & 
                           " but got " & 
                           integer'image(to_integer(actual_sum));
                end if;
                
                report "Test " & 
                       integer'image(test_count) & ": " & 
                       integer'image(i) & " + " & 
                       integer'image(j) & " = " & 
                       integer'image(to_integer(actual_sum)) & 
                       " (Expected: " & 
                       integer'image(to_integer(expected_sum)) & ")";
            end loop;
        end loop;
        
        wait for 10 ns;
        
        if (error_count = 0) then
            report "All tests passed successfully!";
        else
            report "Tests completed with " & 
                   integer'image(error_count) & 
                   " errors out of " & 
                   integer'image(test_count) & 
                   " tests";
        end if;
        
        wait;
    end process;
    
    display_process: process(A, B, Sum, Cout)
    begin
        report "Current test: A=" & 
               integer'image(to_integer(unsigned(A))) & 
               ", B=" & 
               integer'image(to_integer(unsigned(B))) & 
               ", Sum=" & 
               integer'image(to_integer(unsigned(Sum))) & 
               ", Cout=" & 
               std_logic'image(Cout);
    end process;
end Behavioral;