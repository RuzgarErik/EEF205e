library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryAdder is
    Port ( 
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        Sum : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC
    );
end RippleCarryAdder;

architecture Structural of RippleCarryAdder is
    component half_adder
        Port ( 
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            s : out STD_LOGIC;
            c : out STD_LOGIC
        );
    end component;
    
    component FullAdder
        Port ( 
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            c : in STD_LOGIC;
            Sum : out STD_LOGIC;
            Carry_Out : out STD_LOGIC
        );
    end component;
    
    signal carry_internal : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    HA0: half_adder port map (
        a => A(0),
        b => B(0),
        s => Sum(0),
        c => carry_internal(0)
    );
    
    FA1: FullAdder port map (
        a => A(1),
        b => B(1),
        c => carry_internal(0),
        Sum => Sum(1),
        Carry_Out => carry_internal(1)
    );
    
    FA2: FullAdder port map (
        a => A(2),
        b => B(2),
        c => carry_internal(1),
        Sum => Sum(2),
        Carry_Out => carry_internal(2)
    );
    
    FA3: FullAdder port map (
        a => A(3),
        b => B(3),
        c => carry_internal(2),
        Sum => Sum(3),
        Carry_Out => carry_internal(3)
    );
    
    Cout <= carry_internal(3);
    
end Structural; 