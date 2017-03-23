----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sacha Liguori
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

entity MasterJoystick is
    Port ( 

      clk : in STD_LOGIC;
	  en : in std_logic;
      rst : in STD_LOGIC;
      sclk : out STD_LOGIC;
      miso :in STD_LOGIC;
      mosi : out STD_LOGIC;
      ss : out STD_LOGIC;
      led1: in STD_LOGIC;
      led2: in STD_LOGIC;
      btn1 : out std_logic;  
      btn2 : out std_logic;
      btnj : out std_logic; --boutton du joystick
      x : out std_logic_vector (9 downto 0);
      y : out std_logic_vector (9 downto 0)
      );
end MasterJoystick;

architecture Behavioral of MasterJoystick is
  component er_1octet is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           en : in  STD_LOGIC;
           busy : out  STD_LOGIC;
           sclk : out  STD_LOGIC;
           mosi : out  STD_LOGIC;
           miso : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (7 downto 0)
        );

  end component;
  signal er_en : STD_LOGIC; --
  signal er_busy : STD_LOGIC;
  signal er_din : STD_LOGIC_VECTOR(7 downto 0);
  signal er_dout: STD_LOGIC_VECTOR(7 downto 0);

begin
  main: process(clk)
  type t_etat is (standby, wait1, send1, wait2, send2, wait3, send3, 
                wait4, send4, wait5, final);
  variable etat : t_etat;  
  variable compteur: NATURAL;
  begin
    if (reset = '0') then
      etat := standby;
      compteur := 0;
      busy <= '0';
      ss <= '1';
    elsif (rising_edge(clk)) then
      case( etat ) is
      
        when standby => if (en = '1') then
							compteur := 0;
							busy <= '1';
							ss <= '0';
							etat := wait1;
							er_din <= (0 => led1, 1 => led2,  7 => '1',  others => '0');
						end if;

		---------------------------------------------
		-- Init 
		---------------------------------------------
		when wait1 => 	if (compteur < 15) then --attente de 15us
							compteur := compteur + 1;
						else
							  er_en <= '1';
							  --Les deux LEDs sont éteintes ou allumees en fonction des 
							  --des premiers bits du 5eme octet du PmodJSTK
							  etat := send1;
						end if;

		---------------------------------------------
		-- Joystick X
		---------------------------------------------

		-- envoie 8 premiers bits
        when send1 => if (er_busy = '0' and er_en = '0') then --si l'er_1octet a fini d'émettre.
								x(7 downto 0) <= dout;
								compteur := 0; --init compteur
								etat := wait2;
							else
								er_en <= '0';
							end if;


        when wait2 => if (compteur < 10) then 
							compteur := compteur + 1;
						else
							  er_din <= "00000000";
							  er_en <= '1';
							  etat := send2;
						end if;

		-- envoi 2 derniers bits
        when send2 => if (er_busy = '0' and er_en = '0') then
							  x(9 downto 8) <= er_dout(1 downto 0);
							  compteur := 0;
							  etat := wait3;
					  else
					          er_en <= '0';
					  end if;	

        when wait3 =>if (compteur < 10) then 
							compteur := compteur + 1;
						else
							  er_en <= '1';
							  etat := send2;
						end if;
		-- fin transfert X

		---------------------------------------------
		-- Joystick Y
		---------------------------------------------
        when send3 => if (er_busy = '0' and er_en = '0') then --si l'er_1octet a fini d'émettre.
								y(7 downto 0) <= dout;
								compteur := 0; --init compteur
								etat := wait4;
							else
								er_en <= '0';
							end if;

        when wait4 =>if (compteur < 10) then 
							compteur := compteur + 1;
						else
							  --din <= "00000000";
							  er_en <= '1';
							  er_en <= "1";
							  etat := send4;
						end if;

        when send4 =>if (er_busy = '0' and er_en = '0') then
							  y(9 downto 8) <= er_dout(1 downto 0);
							  compteur := 0;
							  etat := wait5;
					  else
					          er_en <= '0';
					  end if;
        when wait5 => if (compteur < 10) then 
							compteur := compteur + 1;
						else
							  er_en <= '1';
							  etat := final;
						end if;
		-- fin transfert X

		---------------------------------------------
		-- Boutons et retour standby
		---------------------------------------------
        when final => if (er_busy = '0' and er_en = '0') then
								  busy <= '0';
								  ss <= '1';
								  btn2 <= er_dout(2);
								  btn1 <= er_dout(1);
								  btnj <= er_dout(0);
								  etat := standby;
								else
								  er_en <= '0';
								end if;
      end case ;
    end if ;
  end process ; -- main
  --communication entre le master et er_1octet
master_er : er_1octet port map (
			--port sous syteme => port composant courant
				clk => clk,
				reset => rst,
				en => er_en,
				busy => er_busy,
				din => er_din,
				dout => er_dout,
				sclk => sclk,
				mosi => mosi,
				miso => miso
			);
end Behavioral;
