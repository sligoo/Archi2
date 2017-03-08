#VHDL
##TD3: La Fifo

###Interface
Ce composant Fifo dispose en entrée:

* d'un bus de données à stocker `data_in__
* une horloge  ```clk__
* d'un signal de remise à niveau asynchrone `reset`, actif à '0'
* de deux signaux de commande de lecture `read` et d'écriture `^$write__, actifs à '1'

Ce composant est implanté comme un tableau de registres fonctionnant de manière asynchrone sur le signal de remise à zéro et de manière synchrone sur le front montant d'horloge.. Ses sorties sont:

* d'un bus de données `data_out`
* deux signaux `empty` et `full`

L'interface Vhdl de la Fifo est:

```vhdl
entity fifo is
	port(clk, reset: in std_logic;
	write, read: in std_logic (3 downto 0);
	data_in: in std_logicc(0 downto 0)
	emply_full: out std_logic);
end fifo
```

```vhdl
architecture 3_process of fifo is
	constant taille: natural := 10;
	type t_memoire is array(taille -1 downto 0) of 
		std_logic_vector (3 downto 0);
	signal la_fifo : t_memoire := (others => (others => 'u'));
	type t_etat is (fifo_vide, fifo_entre_les_2, fifo_pleine);
	signal etat: t_etat;
	begin
		full <= '1' when (etat = fifo_pleine) else '0';
		empty <= '1' when (etat = fifo_vide) else '0';
		p_etat: process(clk, reset)
			variable nb_elt: natural range 0 to taile-1;
		begin
			if (reset='0') then
				nb_elt := 0;
				etat <= fifo_vide;
			elsif (rising_edge(clk)) then
				case etat is
					when fifo_vide =>
					if(write='1') then
						nb_elt:=1;
						etat<=fifo_entre_les_2;
					end if;
					when fifo_pleine =>
					if(write='0' and read='0') then
						nb_elt:=taille-1;
						etat<=fifo_entre_les_2;
					end if;
					when fifo_entre_les_2=>
					if((read='1')and(write='0')) then
						if(nb_elt=1) then
							etat<=fifo_vide;
						end if
						nb_elt:=nb_elt-1;
					elsif((wirte='1')and(read='0')) then
						if(nb_elt=taille-1)then
							etat<=fifo_pleine;
						end if;
						nb:=nb_elt+1;
					end if;
				end case;
			end if;
		end process;
		p_ecriture: process(clk, reset)
			variable i_ecr: natural range 0 to taille-1
		begin
			if (reset='0') then
				i_ecr:=0;
				la_fifo <=(others=>(others=>'u'));
			elsif(rising_edge(clk))then
				if((write='1')and(etat/=fifo_pleine or read='1')) then
					memoire(i_ecr)<=data_in;
					i_ecr:=(i_ecr+1) mod taille;
				end if;
			enf if;
		end process;	
```
