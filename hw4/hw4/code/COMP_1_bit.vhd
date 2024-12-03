library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMP_1_bit is
    port (

        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        x : out STD_LOGIC;
        y : out STD_LOGIC;
        z : out STD_LOGIC
        
    );
end COMP_1_bit;


architecture Behavioral of COMP_1_bit is
begin


    x <= '1' when (a = '1' and b = '0') else '0';

    y <= '1' when (a = b) else '0';
    
    z <= '1' when (a = '0' and b = '1') else '0';

end Behavioral;

