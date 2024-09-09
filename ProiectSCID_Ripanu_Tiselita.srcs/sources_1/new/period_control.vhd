library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity period_control is
    Port ( switches : in STD_LOGIC_VECTOR (2 downto 0);
           period : out STD_LOGIC_VECTOR (7 downto 0));
end period_control;

architecture Behavioral of period_control is
begin
    process(switches)
    begin
        case switches is
            when "000" => period <= "00001010"; -- 2 secunde
            when "001" => period <= "00001100"; -- 2.2 secunde
            when "010" => period <= "00001110"; -- 2.4 secunde
            when "011" => period <= "00010000"; -- 2.6 secunde
            when "100" => period <= "00010010"; -- 2.8 secunde
            when "101" => period <= "00010100"; -- 3 secunde
            when "110" => period <= "00010110"; -- 3.2 secunde
            when "111" => period <= "00011000"; -- 4 secunde
            when others => period <= "00001010"; -- Default 2 secunde
        end case;
    end process;
end Behavioral;
