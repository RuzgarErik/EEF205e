library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity JK_Latch is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           EN: in STD_LOGIC;
           Q : out  STD_LOGIC;
           QN : out  STD_LOGIC);
           
end JK_Latch;


architecture Behavioral of JK_Latch is

    signal state : STD_LOGIC := '0';

begin
    process (J, K, EN)
    begin
        if (EN = '1') then
            if (J = '0' and K = '0') then
                state <= state;
            elsif (J = '0' and K = '1') then
                state <= '0';
            elsif (J = '1' and K = '0') then
                state <= '1';
            elsif (J = '1' and K = '1') then
                state <= not state;
            end if;
        end if;
    end process;

    Q <= state;
    QN <= not state;

end Behavioral;