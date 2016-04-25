library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_alu : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture ArqProcesador of ALU is

begin

  process(operando1,operando2,alu_op)
  begin
	   case (alu_op) is
		   when "000000" => -- ADD
				salida_alu <= operando1 + operando2;
			when "000001" => -- AND
				salida_alu <= operando1 and operando2;
			when "000010" => -- OR
				salida_alu <= operando1 or operando2;
			when "000011" => -- XOR
				salida_alu <= operando1 xor operando2;
			when "000100" => -- SUB
				salida_alu <= operando1 - operando2;
			when "000101" => -- ANDN
				salida_alu <= operando1 nand operando2;
			when "000110" => -- ORN
				salida_alu <= operando1 nor operando2;
			when "000111" => -- XORN
				salida_alu <= operando1 xnor operando2;
			when others => 
				salida_alu <= (others=>'0');
		end case;
  end process;

end ArqProcesador;



