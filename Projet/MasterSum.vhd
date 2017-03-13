----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:00 03/12/2017 
-- Design Name: 
-- Module Name:    MasterSum - Behavioral 
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

entity MasterSum is
    Port(	
    	clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		sclk : out STD_LOGIC;
		miso :in STD_LOGIC;
		mosi : out STD_LOGIC;
		ss : out STD_LOGIC;
		en : in STD_LOGIC; --indique qu'un ordre de transmission est donné
		e1 : in STD_LOGIC_VECTOR(7 downto 0); --1er octet à sommer
		e2 : in STD_LOGIC_VECTOR(7 downto 0); --2eme octet à sommer
		s : out STD_LOGIC_VECTOR(7 downto 0); --octet somme à retourner
		carry :out STD_LOGIC; --retenue
		busy :out STD_LOGIC --indique que le composant est occupé
		);
end MasterSum;

architecture Behavioral of MasterSum is
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

	component slave_sum is
  	port ( 
         sclk : in STD_LOGIC ;
         mosi : in STD_LOGIC ;
         miso : out STD_LOGIC ;
         ss   : in  STD_LOGIC
       );
	end component;

	signal er_en : STD_LOGIC; --
	signal er_busy : STD_LOGIC;
	signal er_din : STD_LOGIC_VECTOR(7 downto 0);
	signal er_dout: STD_LOGIC_VECTOR(7 downto 0);
begin
	
	main : process( clk )
		type t_etat is (none, attente, envoi, final);
		variable etat: t_etat;
		variable cpt_attente: NATURAL; --compteur des clocks d'attente
	begin
		if(rst = '0') then --remise a zero
			busy <= '0';
			ss <= '1';
			carry <= '0';
			s <= "00000000";
		elsif(rising_edge(clk)) then
			case( etat ) is

				when none => if(en = '1') then
									etat := attente1;
									compteur_attente := 0;
									busy <= '1';
									ss <= '0';
								end if;
								
				when attente1 => if( compteur_attente < 4) then -- attente de 5 ticks
									compteur_attente := compteur_attente +1;
								else
									etat := octet1;
									er_en <= '1';
									compteur_attente := 0;
									er_din <= e1;
								end if;
								
				when octet1 =>	er_en <= '0';
								if(er_busy = '0' and er_en = '0') then--si la transmission est achevée
									s <= er_dout;
									etat := attente2;
								 end if;
								 
				when attente2 => 	if( compteur_attente < 1) then --attente de 2 ticks
										compteur_attente := compteur_attente +1;
									else
										etat := octet2;
										er_en <= '1'; --activation er_1octet
										er_din <= e2;
									end if;
									
				when octet2 => 	er_en <= '0';
								if(er_busy = '0' and er_en = '0') then
									 carry <=  er_dout(0);--seul le bit de poids faible nous intéresse.
									 etat := finalisation;
								end if;	
								 				 
				when finalisation => 	if(er_busy = '0' and er_en = '0') then
											s <= er_dout;
											etat := none;
											ss <= '1';
											busy <= '0';
										end if;	

			end case ;
		end if;
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

