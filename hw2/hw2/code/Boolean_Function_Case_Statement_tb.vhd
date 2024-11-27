library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY Boolean_Function_Case_Statement_tb IS
END Boolean_Function_Case_Statement_tb;
 
ARCHITECTURE behavior OF Boolean_Function_Case_Statement_tb IS
    COMPONENT Boolean_Function_Case_Statement
        PORT(
            a1, a0, b1, b0 : in STD_LOGIC;
            c2, c1, c0 : out STD_LOGIC
        );
    END COMPONENT;
   
    signal a1_tb, a0_tb, b1_tb, b0_tb: STD_LOGIC := '0';  
    signal c2_tb, c1_tb, c0_tb : STD_LOGIC;
    signal input_vector_tb : STD_LOGIC_VECTOR(3 downto 0) := "0000";  

   
BEGIN
    UUT: Boolean_Function_Case_Statement PORT MAP (
        a1 => a1_tb,
        a0 => a0_tb,
        b1 => b1_tb,
        b0 => b0_tb,
        c2 => c2_tb,
        c1 => c1_tb,
        c0 => c0_tb
    );
     
    stim_proc: process
    begin
        for i in 0 to 15 loop
            input_vector_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for 1 ns;
            a1_tb <= input_vector_tb(3);
            a0_tb <= input_vector_tb(2);
            b1_tb <= input_vector_tb(1);
            b0_tb <= input_vector_tb(0);
            
            wait for 10 ns;

        end loop;
        
        wait;
    end process;

END behavior;

