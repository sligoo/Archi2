----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:16 02/08/2017 
-- Design Name: 
-- Module Name:    add4 - structurel 
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

entity add4 is
    Port ( A, B : in  STD_LOGIC_VECTOR (3 downto 0) ;
			  cin: in STD_LOGIC;
			  S : out STD_LOGIC_VECTOR (3 downto 0) ;
			  cout: out STD_LOGIC);
end add4;

architecture structurel of add4 is

	COMPONENT additionneur
	PORT(
		X : IN std_logic;
		Y : IN std_logic;
		Cin : IN std_logic;          
		S : OUT std_logic;
		Cout : OUT std_logic
		);
	END COMPONENT;
	
	signal i1,i2,i3 : std_logic;

begin

	add0 : additionneur port map (A(0), B(0), cin, S(0), i1);
	add1 : additionneur port map (A(1), B(1), i1, S(1), i2);
	add2 : additionneur port map (A(2), B(2), i2, S(2), i3);
	add3 : additionneur port map (A(3), B(3), i3, S(3), cout);

end structurel;

