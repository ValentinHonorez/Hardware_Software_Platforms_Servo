# Hardware_Software_Platforms_Servo

This project is part of the course Hardware/Software Platforms at the polytechnic faculty of Mons. 
The goal of this project is to control a servomotor with a DE1-SoC Board. It allows to learn the VHDL programming language and it allows to handle an entire electronical project.
 -> Group Members: Fattahi Idriss and Honorez Valentin
 -> Project title: Control of a servo-motor with a DE1-SoC.
The software used to implement the project is "Quartus II".
The main goal of the project is to be able to change the position of a servomotor by controlling the switches on the DE1-SoC board. There is a button available for the user on the board.
To achieve that, there are 4 parts in our code. 
The first one, called " clk64kHz.vhd", is the construction of the clock of 64kHz. 
The second one, called "servo_pwm.vhd" is the code building the PWM signal to control the servomotor. 
The third one, called "servo_pwm_clk64kHz.vhd" assemble the clock and the pwm signal to control the servomotor. 
The last one, called  "servo-pwm-clk64kHz_PINS.vhd" that connects the signals with the pins of the board.
The DE1-SoC-Servo.zip file countains the Altera project in it. 
The presentation of this project can be found in the "Hardware_software_project presentation Fattahi Idriss and Honorez Valentin.pptx" file.
The Tutorial technical document can be found in the  “Hardware_software_project Fattahi Idriss and Honorez Valentin.pdf” file.
