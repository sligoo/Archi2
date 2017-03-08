# Td n°2: Compteurs Synchrones

## Compteur non trivial



``` vhdl
entity compteur_btn is
	port(
	clock, reset: in std_logic;
	btn: in std_logic;
	mode: in std_logic;
	data_in: in std_logic_vector(3 downto 0);
	data_out: out std_logic_vector(3 downto 0);
end compteur_btn;	

architecture arch of compteur_btn is
	signal nb_appui: std_lofic_vector(1 downto 0);
	begin
		compteur: process(clk, reset)
			type t_etat is (attente,.., decrement);
			variable etat: t_etat;
			variable aux: std_logic_vector(3 downto 0);
		
			begin
				if (reset = '0') then
					etat := attente;
					aux := (others => '0');
					data_out <= aux;
				elsif (rising_edge(clk)) then
					case etat is
						when attente => 
							if (nb_appui = 1) then
								if (mode = 'o') then
									etat := increment;
									aux := aux + 1;
								else
									etat := chargement;
								end if;
							end if;
						when increment => 
							if (nb_appui = 2) then
								etat := stop;
							else
								aux := aux - 1;
							end if;
						when stop =>
							if (nb_appui = 3) then
								etat := attente;
								aux := (others => 'o');
							end if;
						end case;
						data_out <= aux;
				end if;						
		end process;

architecture arch of compteur_btn is
	signal nb_appui: std_logic_vector ( 1 downto 0)
						:= (others => '0');
	begin
	traitement_bouton: process(btn)
		if (btn = '1') then 
			if (nb_appui = '10') then
				nb_appui <= '00';
			else 
				nb_appui <= nb_appui  + 1;
			end if;
		end if;
end process;	
```

