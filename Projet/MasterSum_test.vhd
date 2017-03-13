--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:37:40 03/13/2017
-- Design Name:   
-- Module Name:   /home/sliguori/Archi2/Projet/MasterSum_test.vhd
-- Project Name:  Projet_liguori
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MasterSum
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
 
ENTITY MasterSum_test IS
END MasterSum_test;
 
ARCHITECTURE behavior OF MasterSum_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MasterSum
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         sclk : OUT  std_logic;
         miso : IN  std_logic;
         mosi : OUT  std_logic;
         ss : OUT  std_logic;
         en : IN  std_logic;
         e1 : IN  std_logic_vector(7 downto 0);
         e2 : IN  std_logic_vector(7 downto 0);
         s : OUT  std_logic_vector(7 downto 0);
         carry : OUT  std_logic;
         busy : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal miso : std_logic := '0';
   signal en : std_logic := '0';
   signal e1 : std_logic_vector(7 downto 0) := (others => '0');
   signal e2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal sclk : std_logic;
   signal mosi : std_logic;
   signal ss : std_logic;
   signal s : std_logic_vector(7 downto 0);
   signal carry : std_logic;
   signal busy : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant sclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MasterSum PORT MAP (
          clk => clk,
          rst => rst,
          sclk => sclk,
          miso => miso,
          mosi => mosi,
          ss => ss,
          en => en,
          e1 => e1,
          e2 => e2,
          s => s,
          carry => carry,
          busy => busy
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   sclk_process :process
   begin
		sclk <= '0';
		wait for sclk_period/2;
		sclk <= '1';
		wait for sclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
