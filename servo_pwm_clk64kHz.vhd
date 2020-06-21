library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;




-- assemble the clock and the pwm to control the servo




entity servo_pwm_clk64kHz is

    PORT(

        clk  : IN  STD_LOGIC;

        reset: IN  STD_LOGIC;

        pos  : IN  STD_LOGIC_VECTOR(6 downto 0);

        servo: OUT STD_LOGIC

    );

end servo_pwm_clk64kHz;



architecture Behavioral of servo_pwm_clk64kHz is

    COMPONENT clk64kHz

        PORT(

            clk    : in  STD_LOGIC;

            reset  : in  STD_LOGIC;

            clk_out: out STD_LOGIC

        );

    END COMPONENT;

    

    COMPONENT servo_pwm

        PORT (

            clk   : IN  STD_LOGIC;

            reset : IN  STD_LOGIC;

            pos   : IN  STD_LOGIC_VECTOR(6 downto 0);

            servo : OUT STD_LOGIC

        );

    END COMPONENT;

    

    signal clk_out : STD_LOGIC := '0';

	 

	 

begin

    clk64kHz_map: clk64kHz PORT MAP(

        clk => clk, 

		  reset => reset, 

		  clk_out => clk_out

    );

    

    servo_pwm_map: servo_pwm PORT MAP(

        clk => clk_out,

		  reset => reset,

		  pos => pos,

		  servo => servo

    );

end Behavioral;