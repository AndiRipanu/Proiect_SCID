library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_display is
    Port ( period : in STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end seven_segment_display;

architecture Behavioral of seven_segment_display is
begin
    process(period)
    begin
        case period is
            when "00001010" => seg <= "1000000"; -- Afi?eaz? "2"
            when "00001100" => seg <= "1111001"; -- Afi?eaz? "2.2"
            when "00001110" => seg <= "0100100"; -- Afi?eaz? "2.4"
            when "00010000" => seg <= "0110000"; -- Afi?eaz? "2.6"
            when "00010010" => seg <= "0011001"; -- Afi?eaz? "2.8"
            when "00010100" => seg <= "0010010"; -- Afi?eaz? "3"
            when "00010110" => seg <= "0000010"; -- Afi?eaz? "3.2"
            when "00011000" => seg <= "1111000"; -- Afi?eaz? "4"
            when others => seg <= "1000000"; -- Default 2
        end case;
    end process;
end Behavioral;
