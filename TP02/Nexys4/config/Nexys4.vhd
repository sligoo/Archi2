library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Nexys4 is
  port (
    -- les 16 switchs
    swt : in std_logic_vector (15 downto 0);
    -- les anodes pour sélectionner l'afficheur 7 segments
    an : out std_logic_vector (7 downto 0);
    -- afficheur 7 segments (point décimal compris, segment 7)
    ssg : out std_logic_vector (7 downto 0);
    -- horloge
    mclk : in std_logic;
    -- les 5 boutons noirs
    btnC, btnU, btnL, btnR, btnD : in std_logic;
    -- les 16 leds
    led : out std_logic_vector (15 downto 0)
  );
end Nexys4;

architecture synthesis of Nexys4 is

  COMPONENT add4
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		cin : IN std_logic;          
		S : OUT std_logic_vector(3 downto 0);
		cout : OUT std_logic
		);
	END COMPONENT;

begin

  -- valeurs des sorties (à modifier)
  

  -- convention afficheur 7 segments 0 => allumé, 1 => éteint
  ssg <= (others => '0');
  -- aucun afficheur sélectionné
  an(7 downto 0) <= (others => '1');
  -- 16 leds éteintes
  led(15 downto 5) <= (others => '0');

  -- connexion du (des) composant(s) avec les ports de la carte
  -- À COMPLÉTER 
  Inst_add4: add4 PORT MAP(
		A => swt(3 downto 0),
		B => swt(7 downto 4),
		cin => swt(8),
		S => led(3 downto 0),
		cout => led(4)
	);
	
end synthesis;
