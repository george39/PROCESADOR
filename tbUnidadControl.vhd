LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbunidadControl IS
END tbunidadControl;
 
ARCHITECTURE behavior OF tbunidadControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT unidadControl
    PORT(
         clk : IN  std_logic;
         op : IN  std_logic_vector(1 downto 0);
         op2 : IN  std_logic_vector(2 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op2 : std_logic_vector(2 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: unidadControl PORT MAP (
          clk => clk,
          op => op,
          op2 => op2,
          op3 => op3,
          cond => cond,
          icc => icc,
          ALUOP => ALUOP
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     
op <= "10";
		op2 <= "000";
		op3 <= "000000" ;
		cond <= "0000";
		icc <= "0000";		
      wait for 100 ns;
		op <= "10";
		op2 <= "000";
		op3 <= "010000" ;
		cond <= "0000";
		icc <= "0000";		
      wait for 100 ns;
		op <= "00";
		op2 <= "010";
		op3 <= "000000" ;
		cond <= "1000";
		icc <= "0000";		
      wait;	  

      wait;
   end process;

END;
