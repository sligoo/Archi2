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
	variable registre: STD_LOGIC_VECTOR (7 downto 0);
  type t_etat is (attente, emission, reception); --etats possibles du composant
  variable etat: t_etat;
begin
  if(reset = '0') then
    cpt := 7;
    etat := attente;
    registre := (others => '0'); -- lecture et ecriture des données a envoyer/recues.
    dout <= (others => '0'); -- l'octet de sortie
    sclk <= '0'; -- l'horloge rythmant les échanges
    busy <= '0'; -- est-ce que le composant est occupé
    mosi <= '0'; -- la sortie du composant.

  elsif(rising_edge(clk)) then
    case etat is
      when attente => 
        if (en = '1') then -- si composant s'active
          registre := din; --copie de l'octet d'entrée dans la mémoire interne
          cpt := 7;
          busy <= '1';
          mosi <= registre(cpt); 
          etat := reception; 
        end if
      when reception =>
        sclk <= '1';
        registre(cpt) := miso;
        etat := emission;
      when emission => 
        sclk <= '0';
        if (cpt = 0) then 
          busy <= '0';
          dout <= registre;
          etat := attente;
        else
          cpt := cpt -1;
          mosi <= registre(cpt); --on lit dans le registre la valeur sortante.
          etat := reception;
        end if;
      end case;
  end if;
end process;

end Behavioral;

