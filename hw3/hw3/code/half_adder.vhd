library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is
begin
    s <= a xor b;
    c <= a and b;
end Behavioral;
