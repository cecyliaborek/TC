library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity odejmowanie is
	Port ( liczba1 : in STD_LOGIC_VECTOR (3 downto 0);
       	liczba2 : in STD_LOGIC_VECTOR (3 downto 0);
       	wynik : out STD_LOGIC_VECTOR (3 downto 0));
end odejmowanie;

architecture Behavioral of odejmowanie is

	signal pozyczka:std_logic_vector(3 downto 0);

begin

-- funkcjonalnosc ukladu na bramkach
	pozyczka(0) <= '0';

	wynik(0) <= liczba1(0) xor liczba2(0) xor pozyczka(0);
	pozyczka(1) <= ((not liczba1(0)) and pozyczka(0)) or ( (not liczba1(0) and liczba2(0)) or (liczba2(0) and pozyczka(0)));

	wynik(1) <= liczba1(1) xor liczba2(1) xor pozyczka(1);
	pozyczka(2) <= (not liczba1(1) and pozyczka(1)) or ((not liczba1(1) and liczba2(1)) or (liczba2(1) and pozyczka(1)));

	wynik(2) <= liczba1(2) xor liczba2(2) xor pozyczka(2);
	pozyczka(3) <= (not liczba1(2) and pozyczka(2)) or ((not liczba1(2) and liczba2(2)) or (liczba2(2) and pozyczka(2)));

	wynik(3) <= liczba1(3) xor liczba2(3) xor pozyczka(3);

--pozyczka(1) <= not liczba1(0) and liczba2(0) or (not liczba1(0) xor liczba2(0)) and pozyczka(0);
end Behavioral;
