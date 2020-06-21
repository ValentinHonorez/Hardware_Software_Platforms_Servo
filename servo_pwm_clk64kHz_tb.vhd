library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

--Test Bench Driver





ENTITY servo_pwm_clk64kHz_tb IS

END servo_pwm_clk64kHz_tb;

 

ARCHITECTURE behavior OF servo_pwm_clk64kHz_tb IS

    -- Unit under test.

    COMPONENT servo_pwm_clk64kHz

        PORT(

            clk   : IN  std_logic;

            reset : IN  std_logic;

            pos   : IN  std_logic_vector(6 downto 0);

            servo : OUT std_logic

        );

    END COMPONENT;



    -- Inputs.

    signal clk  : std_logic := '0';

    signal reset: std_logic := '0';

    signal pos  : std_logic_vector(6 downto 0) := (others => '0');

    -- Outputs.

    signal servo : std_logic;

    -- Clock definition.

    constant clk_period : time := 10 ns;

BEGIN

    -- Instance of the unit under test.

    uut: servo_pwm_clk64kHz PORT MAP (

        clk => clk,

        reset => reset,

        pos => pos,

        servo => servo

    );



   -- Definition of the clock process.

   clk_process :process begin

        clk <= '0';

        wait for clk_period/2;

        clk <= '1';

        wait for clk_period/2;

   end process;

 

    -- Stimuli process.

    stimuli: process begin

        reset <= '1';

        wait for 50 ns;

        reset <= '0';

        wait for 50 ns;

        pos <= "0000000";

        --wait for 20 ms;

		  wait until servo='1';

        pos <= "0101000";

        wait until servo='1';

        pos <= "1010000";

        wait until servo='1';

        pos <= "1111000";

        wait until servo='1';

        pos <= "1111111";

        wait;

    end process;

END;