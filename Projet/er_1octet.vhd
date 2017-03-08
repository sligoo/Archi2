----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:30 03/08/2017 
-- Design Name: 
-- Module Name:    er_1octet - Behavioral 
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

entity er_1octet is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           en : in  STD_LOGIC;
           busy : out  STD_LOGIC;
           sclk : out  STD_LOGIC;
           mosi : out  STD_LOGIC;
           miso : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (7 downto 0));
end er_1octet;

architecture Behavioral of er_1octet is

begin

gene_sclk: process(clk)
	variable cpt: NATURAL; --compteur de lecture/ecriture
	variable registry: STD_LOGIC_VECTOR (7 downto 0);
	
end Behavioral;

