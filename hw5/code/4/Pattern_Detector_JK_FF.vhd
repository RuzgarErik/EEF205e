library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequence_detector is
    Port ( 
        clk    : in  STD_LOGIC;
        A1     : in  STD_LOGIC;
        A0     : in  STD_LOGIC;
        Z      : out STD_LOGIC
    );
end sequence_detector;

architecture Behavioral of sequence_detector is
    component JK_FF
        Port ( 
            J     : in  STD_LOGIC;
            K     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            QN    : out STD_LOGIC
        );
    end component;

    signal Q2, Q1, Q0 : STD_LOGIC;
    signal QN2, QN1, QN0 : STD_LOGIC;
    signal J2, K2, J1, K1, J0, K0 : STD_LOGIC;

begin
    J2 <= (not Q2) and (not Q1) and (not Q0) and A1 and A0;
    
    K2 <= (Q2 and Q1) or 
          (Q2 and (not Q1) and (not Q0) and (A1 or A0)) or 
          (Q2 and (not Q1) and Q0 and (A1 or (not A0)));
    
    J1 <= (not Q1) and Q0 and 
          ((not Q2 and A1 and (not A0)) or (Q2 and (not A1) and A0));
    
    K1 <= ((not Q2) and Q1 and (not Q0) and ((not A1) or (not A0))) or
          ((not Q2) and Q1 and Q0) or 
          (Q2 and Q1 and (not Q0));
    
    J0 <= ((not Q2) and (not Q1) and (not Q0) and A1 and (not A0)) or
          ((not Q2) and Q1 and (not Q0) and A1 and A0) or
          (Q2 and (not Q1) and (not Q0) and (not A1) and (not A0));
    
    K0 <= ((not Q2) and (not Q1) and Q0 and ((not A1) or A0)) or
          ((not Q2) and Q1 and Q0) or
          (Q2 and (not Q1) and Q0);
    
    Z <= ((not Q2) and Q1 and (not Q0) and A1 and A0) or
         (Q2 and (not Q1) and Q0 and (not A1) and A0);

    FF2: JK_FF port map (
        J => J2,
        K => K2,
        CLK => clk,
        Q => Q2,
        QN => QN2
    );

    FF1: JK_FF port map (
        J => J1,
        K => K1,
        CLK => clk,
        Q => Q1,
        QN => QN1
    );

    FF0: JK_FF port map (
        J => J0,
        K => K0,
        CLK => clk,
        Q => Q0,
        QN => QN0
    );

end Behavioral;