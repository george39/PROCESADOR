--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:05:46 04/09/2016
-- Design Name:   
-- Module Name:   C:/Users/GEORGE/Google Drive/utp/octavo semestre/arquitectura de computadores/procesador/memoriaInstrucciones/tbmemoriaInstrucciones.vhd
-- Project Name:  memoriaInstrucciones
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memoriaInstrucciones
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbmemoriaInstrucciones IS
END tbmemoriaInstrucciones;
 
ARCHITECTURE behavior OF tbmemoriaInstrucciones IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memoriaInstrucciones
    PORT(
         clk : IN  std_logic;
         address : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal address : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memoriaInstrucciones PORT MAP (
          clk => clk,
          address => address,
          reset => reset,
          outInstruction => outInstruction
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
      -- hold reset state for 100 ns.
              reset<='1';
              address <= "0000";
          wait for 100 ns;
                    reset<='0';
						  address <= "1110";
			 

      wait;
   end process;

END;
