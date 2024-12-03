library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity POZ_COMPARE is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           X : out STD_LOGIC;
           Y : out STD_LOGIC;
           Z : out STD_LOGIC);
end POZ_COMPARE;

architecture Structural of POZ_COMPARE is
    component COMP_1_bit is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               x : out STD_LOGIC;
               y : out STD_LOGIC;
               z : out STD_LOGIC);
    end component;
    
    component CON_COMP_1_bit is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               x_prev : in STD_LOGIC;
               y_prev : in STD_LOGIC;
               z_prev : in STD_LOGIC;
               x_out : out STD_LOGIC;
               y_out : out STD_LOGIC;
               z_out : out STD_LOGIC);
    end component;
    
    signal x_results : STD_LOGIC_VECTOR(3 downto 0);
    signal y_results : STD_LOGIC_VECTOR(3 downto 0);
    signal z_results : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    COMP3: COMP_1_bit port map (
        a => A(3),
        b => B(3),
        x => x_results(3),
        y => y_results(3),
        z => z_results(3)
    );
    
    COMP2: CON_COMP_1_bit port map (
        a => A(2),
        b => B(2),
        x_prev => x_results(3),
        y_prev => y_results(3),
        z_prev => z_results(3),
        x_out => x_results(2),
        y_out => y_results(2),
        z_out => z_results(2)
    );
    
    COMP1: CON_COMP_1_bit port map (
        a => A(1),
        b => B(1),
        x_prev => x_results(2),
        y_prev => y_results(2),
        z_prev => z_results(2),
        x_out => x_results(1),
        y_out => y_results(1),
        z_out => z_results(1)
    );
    
    COMP0: CON_COMP_1_bit port map (
        a => A(0),
        b => B(0),
        x_prev => x_results(1),
        y_prev => y_results(1),
        z_prev => z_results(1),
        x_out => x_results(0),
        y_out => y_results(0),
        z_out => z_results(0)
    );
    
    X <= x_results(0);
    Y <= y_results(0);
    Z <= z_results(0);
    
end Structural;