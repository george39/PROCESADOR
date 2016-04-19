--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:47:11 04/17/2016
-- Design Name:   
-- Module Name:   C:/Users/GEORGE/Google Drive/utp/octavo semestre/arquitectura de computadores/procesador/proyectoProcesador/tbregisterFile.vhd
-- Project Name:  proyectoProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerFile
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
 
ENTITY tbregisterFile IS
END tbregisterFile;
 
ARCHITECTURE behavior OF tbregisterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rs1 : IN  std_logic_vector(5 downto 0);
         rs2 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(5 downto 0);
         writeEnable : IN  std_logic;
         dataToWrite : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0);
         crd : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal writeEnable : std_logic := '0';
   signal dataToWrite : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   signal crd : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          clk => clk,
          reset => reset,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          writeEnable => writeEnable,
          dataToWrite => dataToWrite,
          crs1 => crs1,
          crs2 => crs2,
          crd => crd
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
   rs1<="000001" ;
   rs2 <="000010";
   rd <="000001";
   reset<='1';
   writeEnable <='1';
   dataToWrite <=(others => '1');

      wait for 100 ns;	


	rs1<="000001" ;
   rs2 <="000010";
   rd <= "000001";
   reset<='0';
   writeEnable <='0';
   dataToWrite <=(others => '1');

      wait for 100 ns;	
     
	 rs1<="000001" ;
   rs2 <="000010";
   rd <= "000011";
   reset<='0';
   writeEnable <='1';
   dataToWrite <=(others => '1');

      wait for 100 ns;	
 rs1<="000011" ;
   rs2 <="000110";
   rd <= "000010";
   reset<='0';
   writeEnable <='1';
   dataToWrite <=(others => '1');

      wait for 100 ns;	
 

      wait;
   end process;

END;
