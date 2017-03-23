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
    led : out std_logic_vector (15 downto 0);

    mosi: out std_logic;
    miso: in std_logic;
    ss: out std_logic;
    sclk: out std_logic

  );
end Nexys4;

architecture synthesis of Nexys4 is

  component MasterJoystick
    Port ( 
      clk : in STD_LOGIC;
      en : in std_logic;
		busy: out std_logic;
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
    end component;

    component diviseurClk
	 generic (facteur : natural);
    Port ( 
      clk, reset : in  std_logic;
      nclk       : out std_logic
      );
    end component;

    component All7Segments 
    Port ( clk : in  std_logic;
           reset : in std_logic;
           e0 : in std_logic_vector (3 downto 0);
           e1 : in std_logic_vector (3 downto 0);
           e2 : in std_logic_vector (3 downto 0);
           e3 : in std_logic_vector (3 downto 0);
           e4 : in std_logic_vector (3 downto 0);
           e5 : in std_logic_vector (3 downto 0);
           e6 : in std_logic_vector (3 downto 0);
           e7 : in std_logic_vector (3 downto 0);
           an : out std_logic_vector (7 downto 0);
           ssg : out std_logic_vector (7 downto 0));
    end component;

    constant facteur: integer := 50;
    signal div_clk: std_logic;
    signal X: std_logic_vector(9 downto 0);
    signal Y: std_logic_vector(9 downto 0);
	 signal an_tmp: std_logic_vector(7 downto 0);
	 
begin

led(14 downto 3) <= (others => '0');
an(7) <= '1';
an(3) <= '1';
an(6 downto 4) <= an_tmp(6 downto 4);
an(2 downto 0) <= an_tmp(2 downto 0);

nexys_afficheur: All7Segments port map(
  clk => mclk,
  reset => not btnC,
  e0 => X(3 downto 0),
  e1 => X(7 downto 4),
  e2 =>  "00" & X(9 downto 8),
  e3 => "0000",
  e4 => Y(3 downto 0),
  e5 => Y(7 downto 4),
  e6 => "00" & Y(9 downto 8),
  e7 => "0000",
  an => an_tmp,
  ssg => ssg
  );

nexys_joy: MasterJoystick port map(
  clk => div_clk ,
  en => '1',
  busy => led(15),
  rst => not btnC,
  sclk => sclk,
  miso => miso,
  mosi => mosi,
  ss => ss,
  led1 => swt(0),
  led2 => swt(1),
  btn1 => led(0),  
  btn2 => led(1),
  btnj => led(2),
  x => X,
  y => Y 
  );

nexys_div: diviseurClk 
Generic map(facteur)
port map(
  clk => mclk,
  reset => not btnC,
  nclk => div_clk
  );
  
end synthesis;
