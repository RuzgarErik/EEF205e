library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY AND_gate_tb IS
END AND_gate_tb;
 
ARCHITECTURE behavior OF AND_gate_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AND_gate
    PORT(
         IN1 : IN  std_logic;
         IN2 : IN  std_logic;
         OUT1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN1 : std_logic := '0';
   signal IN2 : std_logic := '0';

 	--Outputs
   signal OUT1 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AND_gate PORT MAP (
          IN1 => IN1,
          IN2 => IN2,
          OUT1 => OUT1
        );

     -- insert stimulus here 
     process
     begin
     wait for 10 ns;

     IN1 <= '1';
     IN2 <= '0';

     wait for 10 ns;

     IN1 <= '0';
     IN2 <= '1';

    wait for 10 ns;

     IN1 <= '1';
     IN2 <= '1';
     
     wait for 10 ns;

     IN1 <= '0';
     IN2 <= '0';

      wait;
   end process;

END;
