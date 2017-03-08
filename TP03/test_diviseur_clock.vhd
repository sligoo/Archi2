--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:25:06 02/27/2017
-- Design Name:   
-- Module Name:   /home/sliguori/Archi2/TP03/test_diviseur_clock.vhd
-- Project Name:  TP03
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: diviseur_horloge
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_diviseur_clock IS
END test_diviseur_clock;
 
ARCHITECTURE behavior OF test_diviseur_clock IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT diviseur_horloge
	 generic (facteur : natural);
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         nclk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal nclk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	
   uut: diviseur_horloge 
	generic map (10)
	PORT MAP (
          clk => clk,
          reset => reset,
          nclk => nclk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

       reset <= '1';

      wait;
   end process;

END;
