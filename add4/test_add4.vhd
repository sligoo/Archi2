--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:24:36 02/08/2017
-- Design Name:   
-- Module Name:   /mnt/nosave/sliguori/Xilinx/add4/test_add4.vhd
-- Project Name:  add4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: add4
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
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_add4 IS
END test_add4;
 
ARCHITECTURE behavior OF test_add4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT add4
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         S : OUT  STD_LOGIC_VECTOR (3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    
	constant periode:time := 50ns;
   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal S : STD_LOGIC_VECTOR (3 downto 0);
   signal cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: add4 PORT MAP (
          A => A,
          B => B,
          cin => cin,
          S => S,
          cout => cout
        );
		  
		  geneseA : process
			begin
			 wait for periode;
			 A <= A + 1;
			 end process;
			 
			geneseB : process
				begin 
				wait for 16*periode;
				B <= B + 1;
				end process;
				
		cin <= '0', '1' after 16*16*periode;
				
		  
 

   

END behavior;
