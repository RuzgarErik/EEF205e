library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is
    Port (
        J : in STD_LOGIC;
        K : in STD_LOGIC;
        CLK : in STD_LOGIC;
        Q : out STD_LOGIC;
        QN : out STD_LOGIC
    );
end JK_FF;

architecture Behavioral of JK_FF is
    signal state : STD_LOGIC := '0';
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if J = '0' and K = '0' then
                state <= state;
            elsif J = '0' and K = '1' then
                state <= '0';
            elsif J = '1' and K = '0' then
                state <= '1';
            elsif J = '1' and K = '1' then
                state <= not state;
            end if;
        end if;
    end process;

    Q <= state;
    QN <= not state;

end Behavioral;
