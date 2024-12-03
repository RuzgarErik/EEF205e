library  IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONNECT is
    port (

        x_prev : in std_logic;
        y_prev : in std_logic;
        z_prev : in std_logic;

        x_in : in std_logic;
        y_in : in std_logic;
        z_in : in std_logic;

        x_out : out std_logic;
        y_out : out std_logic;
        z_out : out std_logic

    );
end entity;

Architecture Dataflow of CONNECT is
begin

    x_out <= x_prev OR (y_prev AND x_in);
    y_out <= y_prev AND y_in;
    z_out <= z_prev OR (y_prev AND z_in);


end architecture;   