library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PROCESADOR is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida_procesador : out  STD_LOGIC_VECTOR (31 downto 0));
end PROCESADOR;

architecture ArqProcesador of PROCESADOR is

component PC
    Port ( PC_entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PC_salida : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component MEMORIAINSTRUCCION
    Port ( MIentrada : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           MIsalida : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MULTIPLEXOR
    Port ( crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           inmediato : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           salida_mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SUMADOR
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaSumador : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component UC
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_op : out  STD_LOGIC_VECTOR (5 downto 0));
end component;

component RF
    Port ( reset : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           salida_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SEU
    Port ( entrada_seu : in  STD_LOGIC_VECTOR (12 downto 0);
           salida_seu : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALU is
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_alu : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal nPC_PC : std_logic_vector (31 downto 0):= (others => '0');
signal nPC_SUMADOR : std_logic_vector (31 downto 0):= (others => '0');
signal SUMADOR_nPC : std_logic_vector (31 downto 0):= (others => '0');

signal PC_MEMORIAINSTRUCCION : std_logic_vector (31 downto 0):= (others => '0');
signal MEMORIAINSTRUCCION_MULTIPLE : std_logic_vector (31 downto 0):= (others => '0');

signal UC_ALU : std_logic_vector (5 downto 0):= (others => '0');

signal RF_ALU : std_logic_vector (31 downto 0):= (others => '0');
signal RF_MULTIPLEXOR : std_logic_vector (31 downto 0):= (others => '0');
signal ALU_RF : std_logic_vector (31 downto 0):= (others => '0');

signal SEU_MULTIPLEXOR : std_logic_vector (31 downto 0):= (others => '0');
signal MULTIPLEXOR_ALU : std_logic_vector (31 downto 0):= (others => '0');

begin

comp_nPC: PC PORT MAP(
		PC_entrada => SUMADOR_nPC,
		reset =>reset,
		clk => clk,
		PC_salida => nPC_PC
	);
	
comp_PC: PC PORT MAP(
		PC_entrada => nPC_PC,
		reset => reset,
		clk => clk,
		PC_salida => PC_MEMORIAINSTRUCCION
	);
	
comp_SUMADOR: SUMADOR PORT MAP(
		operando1 => X"00000001",
		operando2 => nPC_SUMADOR,
		salidaSumador => SUMADOR_nPC
	);
	
comp_MEMORIAINSTRUCCION : MEMORIAINSTRUCCION PORT MAP (
      MIentrada => PC_MEMORIAINSTRUCCION,
		reset => reset,
		MIsalida => MEMORIAINSTRUCCION_MULTIPLE (31 downto 0)
   );
	
	
comp_UC : UC PORT MAP (
      op => MEMORIAINSTRUCCION_MULTIPLE (31 downto 30),
		op3 => MEMORIAINSTRUCCION_MULTIPLE (24 downto 19),
		alu_op => UC_ALU
   );
	
comp_RF : RF PORT MAP (
      reset => reset,
      rs1 => MEMORIAINSTRUCCION_MULTIPLE (18 downto 14),
      rs2 => MEMORIAINSTRUCCION_MULTIPLE (4 downto 0),
      rd => MEMORIAINSTRUCCION_MULTIPLE (29 downto 25),
      salida_alu => ALU_RF,
      crs1 => RF_ALU,
      crs2 => RF_MULTIPLEXOR
	);

comp_MULTIPLEXOR : MULTIPLEXOR PORT MAP (
      crs2 => RF_MULTIPLEXOR,
      inmediato => SEU_MULTIPLEXOR,
      i => MEMORIAINSTRUCCION_MULTIPLE (13),
      salida_mux => MULTIPLEXOR_ALU
	);
	
comp_SEU : SEU PORT MAP (
      entrada_seu => MEMORIAINSTRUCCION_MULTIPLE (12 downto 0),
      salida_seu => SEU_MULTIPLEXOR
	);

comp_ALU : ALU PORT MAP (
      operando1 => RF_ALU,
      operando2 => MULTIPLEXOR_ALU,
      alu_op => UC_ALU,
      salida_alu => ALU_RF
	);


salida_procesador <= ALU_RF;

end ArqProcesador;

