library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Boolean_Function_Dataflow is
    Port ( a1, a0, b1, b0 : in STD_LOGIC;
           c2, c1, c0 : out STD_LOGIC);
end Boolean_Function_Dataflow;

architecture Dataflow of Boolean_Function_Dataflow is

begin
    c2 <= (a1 and a0 and b0) or 
          (a0 and b1 and b0) or 
          (a1 and b1);

    c1 <= (not a1 and not a0 and b1) or 
          (not a1 and a0 and not b1 and b0) or 
          (not a1 and b1 and not b0) or 
          (a1 and not a0 and not b1) or 
          (a1 and not b1 and not b0) or 
          (a1 and a0 and b1 and b0);

    c0 <= (not a0 and b0) or 
          (a0 and not b0);

end Dataflow;