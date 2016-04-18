library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionMemory is
    Port ( clk : in  STD_LOGIC;
           MIentrada : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           MIsalida : out  STD_LOGIC_VECTOR (31 downto 0));
end instructionMemory;

architecture arqProcesador of instructionMemory is

type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
	signal instructions : rom_type := InitRomFromFile("pruebaFinal.data");
	
begin
--reset,address, instructions)
	process(reset,MIentrada, instructions)--clk)
	begin
		--if(rising_edge(clk))then
			if(reset = '1')then
				MIsalida <= (others=>'0');
			else
				MIsalida <= instructions(conv_integer(MIentrada(5 downto 0)));
			end if;
		--end if;
	end process;


end arqProcesador;
