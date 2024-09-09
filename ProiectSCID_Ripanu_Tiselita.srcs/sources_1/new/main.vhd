library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( clk : in STD_LOGIC;
           switches : in STD_LOGIC_VECTOR (2 downto 0);
           pwm_out : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is
    signal period : STD_LOGIC_VECTOR (7 downto 0);
    signal duty_cycle : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal counter : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal direction : STD_LOGIC := '1'; 

    component period_control
        Port ( switches : in STD_LOGIC_VECTOR (2 downto 0);
               period : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component seven_segment_display
        Port ( period : in STD_LOGIC_VECTOR (7 downto 0);
               seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    component pwm
        Port ( clk : in STD_LOGIC;
               duty_cycle : in STD_LOGIC_VECTOR (7 downto 0);
               pwm_out : out STD_LOGIC);
    end component;

begin
    pc: period_control port map (
        switches => switches,
        period => period
    );

    ssd: seven_segment_display port map (
        period => period,
        seg => seg
    );

    pwm_gen: pwm port map (
        clk => clk,
        duty_cycle => duty_cycle,
        pwm_out => pwm_out
    );

    process(clk)
    begin
        if rising_edge(clk) then
            if counter = period then
                counter <= (others => '0');
                if direction = '1' then
                    if duty_cycle < "11111111" then
                        duty_cycle <= duty_cycle + 1;
                    else
                        direction <= '0';
                    end if;
                else
                    if duty_cycle > "00000000" then
                        duty_cycle <= duty_cycle - 1;
                    else
                        direction <= '1';
                    end if;
                end if;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
