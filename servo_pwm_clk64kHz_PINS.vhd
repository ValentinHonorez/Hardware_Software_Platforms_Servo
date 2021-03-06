library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;




-- connects the signals with the pins of the board




entity servo_pwm_clk64kHz_PINS is

    PORT(

        CLOCK_50  : IN  STD_LOGIC;

        KEY: IN  STD_LOGIC_VECTOR(3 downto 0);

        SW  : IN  STD_LOGIC_VECTOR(7 downto 0);

        LEDR  : OUT  STD_LOGIC_VECTOR(8 downto 0);

        GPIO_1: OUT STD_LOGIC_VECTOR(3 downto 0)

    );

end servo_pwm_clk64kHz_PINS;



architecture itf of servo_pwm_clk64kHz_PINS is

 

	component servo_pwm_clk64kHz is

		 PORT(

		     clk  : IN  STD_LOGIC;

			  reset: IN  STD_LOGIC;

			  pos  : IN  STD_LOGIC_VECTOR(6 downto 0);

			  servo: OUT STD_LOGIC 

		 );

	end component;

	

signal Ipos_after: STD_LOGIC_VECTOR (6 downto 0):= "0000000";

signal sReset: STD_LOGIC;

begin

	 sReset <= not KEY(0);

    clk64kHz_map: servo_pwm_clk64kHz PORT MAP(

        clk => CLOCK_50, 

		  reset => sReset, 

		  pos => iPos_after,

		  servo => GPIO_1(1) 

    );

    LEDR(0) <= not KEY(0);

	 LEDR(7 downto 1) <= SW(6 downto 0);

	 GPIO_1(0) <= '0'; 

	 GPIO_1(2) <= '1'; 

	 

	 bouton : process(KEY(1)) begin 

			if rising_edge(KEY(1)) then

				 iPos_after <= SW(6 downto 0); 

			end if;

	end process;

		  

	 

end;