----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:22 04/24/2016 
-- Design Name: 
-- Module Name:    procesadorSparckV8 - arqProcesador 
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

entity procesadorSparckV8 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida_alu : out  STD_LOGIC_VECTOR (31 downto 0));
end procesadorSparckV8;

architecture arqProcesador of procesadorSparckV8 is

component PC 

    Port ( PC_entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PC_salida : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component UC is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_op : out  STD_LOGIC_VECTOR (5 downto 0));
end component;


component ALU 
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_alu : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component MEMORIAINSTRUCCION 
    Port ( MIentrada : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           MIsalida : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MULTIPLEXOR is
    Port ( crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           inmediato : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           salida_mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RF is
    Port ( reset : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           salida_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SEU is
    Port ( entrada_seu : in  STD_LOGIC_VECTOR (12 downto 0);
           salida_seu : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SUMADOR is
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaSumador : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal ALU_RF : std_logic_vector(31 downto 0);
signal nPC_PC : std_logic_vector(31 downto 0);
signal PC_IM : std_logic_vector(31 downto 0);
signal RF_multiplexor : std_logic_vector(31 downto 0);
signal RF_ALU : std_logic_vector(31 downto 0);
signal nPC_sumador  : std_logic_vector(31 downto 0);
signal sumador_nPC : std_logic_vector(31 downto 0);
signal IMmultiple : std_logic_vector(31 downto 0);
signal UC_ALU : std_logic_vector(5 downto 0);
signal SEU_multiplexor : std_logic_vector(31 downto 0);
signal multiplexor_ALU : std_logic_vector(31 downto 0);

begin

comp_nPC : PC PORT MAP(
    PC_entrada => sumador_nPC,
	 clk => clk,
	 reset => reset,
	 PC_salida => nPC_PC
);

comp_PC: PC PORT MAP(
    PC_entrada => nPC_PC,
	 clk => clk,
	 reset => reset,
	 PC_salida => PC_IM
);

comp_sumador : SUMADOR PORT MAP(
     operando1 => X"00000001",
	  operando2 =>  nPC_PC,
	  salidaSumador => sumador_nPC
	  );
	  
comp_IM : MEMORIAINSTRUCCION port map(
     MIentrada => PC_IM,
     reset => reset,
     MIsalida => IMmultiple
	  );

comp_UC : UC PORT MAP(
     op =>	IMmultiple(31 downto 30),
     op3 => IMmultiple(24 downto 19),
     alu_op => UC_ALU 
  );	

comp_RF : RF PORT MAP(
     reset => reset,
	  rs1 => IMmultiple(18 downto 14),
	  rs2 => IMmultiple(4 downto 0),
	  rd => IMmultiple(29 downto 25),
	  crs1 => RF_ALU,
	  crs2 => RF_multiplexor,
	  salida_alu => ALU_RF
	  
	);	
comp_SEU : SEU PORT MAP(
     entrada_seu => IMmultiple(12 downto 0),
     salida_seu => SEU_multiplexor
  	);

comp_multiplexor : multiplexor PORT MAP(
     crs2 => RF_multiplexor,
	  inmediato => SEU_multiplexor,
	  i => IMmultiple(13),
	  salida_mux => multiplexor_ALU
	  
	);  
	  
  
end arqProcesador;

