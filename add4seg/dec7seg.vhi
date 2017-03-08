
-- VHDL Instantiation Created from source file dec7seg.vhd -- 09:27:37 02/16/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT dec7seg
	PORT(
		value : IN std_logic_vector(3 downto 0);          
		seg : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_dec7seg: dec7seg PORT MAP(
		value => ,
		seg => 
	);


