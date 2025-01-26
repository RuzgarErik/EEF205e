library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pattern_Detector is
    Port (
        CLK : in STD_LOGIC;
        DATA_IN : in STD_LOGIC_VECTOR(1 downto 0);
        Z : out STD_LOGIC
    );
end Pattern_Detector;

architecture Behavioral of Pattern_Detector is
    type state_type is (S0, S1, S2, S3, S4, S5, S6);
    signal STATE_CURRENT, STATE_NEXT : state_type := S0;
    signal Z_internal : STD_LOGIC := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            STATE_CURRENT <= STATE_NEXT;
            Z <= Z_internal;
        end if;
    end process;

    process (STATE_CURRENT, DATA_IN)
    begin
        STATE_NEXT <= S0;
        Z_internal <= '0';

        case STATE_CURRENT is
            when S0 =>
                if DATA_IN = "10" then
                    STATE_NEXT <= S1;
                elsif DATA_IN = "11" then
                    STATE_NEXT <= S4;
                end if;

            when S1 =>
                if DATA_IN = "10" then
                    STATE_NEXT <= S2;
                else
                    STATE_NEXT <= S0;
                end if;

            when S2 =>
                if DATA_IN = "11" then
                    STATE_NEXT <= S3;
                    Z_internal <= '1';
                else
                    STATE_NEXT <= S0;
                end if;

            when S3 =>
                STATE_NEXT <= S0;

            when S4 =>
                if DATA_IN = "00" then
                    STATE_NEXT <= S5;
                else
                    STATE_NEXT <= S0;
                end if;

            when S5 =>
                if DATA_IN = "01" then
                    STATE_NEXT <= S6;
                    Z_internal <= '1';
                else
                    STATE_NEXT <= S0;
                end if;

            when S6 =>
                STATE_NEXT <= S0;

            when others =>
                STATE_NEXT <= S0;
        end case;
    end process;
end Behavioral;
