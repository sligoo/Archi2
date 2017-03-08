----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:19 02/27/2017 
-- Design Name: 
-- Module Name:    diviseur_horloge - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity diviseur_horloge is
	 generic(facteur : natural);
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           nclk : out  STD_LOGIC);
end diviseur_horloge;

architecture Behavioral of diviseur_horloge is

begin
process(clk, reset)
	variable cpt_aux : natural:=0;
	begin
		if (reset = '0') then 
			cpt_aux := 0;
		elsif (rising_edge(clk)) then
			if cpt_aux = facteur then
				cpt_aux := 0;
				nclk <= '1';
			else 
				cpt_aux := cpt_aux + 1;
				nclk <= '0';
			end if;
		end if;
	end process;

end Behavioral;

