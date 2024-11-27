library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port (
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        c : in STD_LOGIC;
        Sum : out STD_LOGIC;
        Carry_Out : out STD_LOGIC
    );
end FullAdder;

architecture Behavioral of FullAdder is
begin
    Sum <= a XOR b XOR c;
    Carry_Out <= (a AND b) OR (b AND c) OR (a AND c);
end Behavioral;
