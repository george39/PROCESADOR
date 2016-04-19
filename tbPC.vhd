LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbPC IS
END tbPC;
 
ARCHITECTURE behavior OF tbPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         PCentrada : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         PCsalida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PCentrada : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal PCsalida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          PCentrada => PCentrada,
          reset => reset,
          clk => clk,
          PCsalida => PCsalida
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
     reset <= '1';
      wait for 100 ns;	
		PCentrada <= x"00000000"; 
      reset <= '0'; 
		wait for 20 ns;
		PCentrada <= x"00000001";
		wait for 20 ns;
		PCentrada<= x"00000002";
		wait for 20 ns;
		PCentrada<= x"00000003";

      wait;
   end process;

END;
