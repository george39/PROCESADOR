--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:16:02 04/09/2016
-- Design Name:   
-- Module Name:   C:/Users/GEORGE/Google Drive/utp/octavo semestre/arquitectura de computadores/procesador/PC/tbPC.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY tbPC IS
END tbPC;
 
ARCHITECTURE behavior OF tbPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         PC_IN : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         PC_OUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_IN : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal PC_OUT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          PC_IN => PC_IN,
          rst => rst,
          clk => clk,
          PC_OUT => PC_OUT
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
      
      rst <='1';
		PC_IN <= x"00000000";
		rst <='0';
      wait for 20 ns;
      PC_IN	<= x"00000001";
      wait for 20 ns;
      PC_IN <= x"00000002";
      wait for 20 ns;
      PC_IN <= x"00000003";			
     

      wait;
   end process;

END;
