library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pwm is
    Port ( clk : in STD_LOGIC;
           duty_cycle : in STD_LOGIC_VECTOR (7 downto 0);
           pwm_out : out STD_LOGIC);
end pwm;

architecture Behavioral of pwm is
    signal counter : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if counter < duty_cycle then
                pwm_out <= '1';
            else
                pwm_out <= '0';
            end if;
            counter <= counter + 1;
        end if;
    end process;
end Behavioral;
