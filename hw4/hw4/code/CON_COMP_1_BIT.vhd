library ieee;
use ieee.std_logic_1164.all;

entity CON_COMP_1_BIT is
    port (
        a : in std_logic;
        b : in std_logic;

        x_prev : in std_logic;
        y_prev : in std_logic;
        z_prev : in std_logic;

        x_out : out std_logic;
        y_out : out std_logic;
        z_out : out std_logic);
end CON_COMP_1_BIT;

architecture Structural of CON_COMP_1_BIT is
    component COMP_1_BIT is
        port (
            a: in std_logic;
            b: in std_logic;
            x: out std_logic;
            y: out std_logic;
            z: out std_logic
        );
    end component;

    component CONNECT is
        port(
            x_in: in std_logic;
            y_in: in std_logic;
            z_in: in std_logic;

            x_prev: in std_logic;
            y_prev: in std_logic;
            z_prev: in std_logic;
            
            x_out: out std_logic;
            y_out: out std_logic;
            z_out: out std_logic
        );
    end component;

    signal x_internal, y_internal, z_internal: std_logic; 

begin
    COMP_1_BIT_inst: COMP_1_BIT port map(
        a => a,
        b => b,
        x => x_internal,
        y => y_internal,
        z => z_internal
    );

    CONNECT_inst: CONNECT port map(
        x_in => x_internal,
        y_in => y_internal,
        z_in => z_internal,
        x_prev => x_prev,
        y_prev => y_prev,
        z_prev => z_prev,
        x_out => x_out,
        y_out => y_out,
        z_out => z_out
    );

end Structural;