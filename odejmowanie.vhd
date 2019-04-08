library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity odejmowanie is
    Port ( liczba1 : in STD_LOGIC_VECTOR (3 downto 0);
           liczba2 : in STD_LOGIC_VECTOR (3 downto 0);
           wynik : out STD_LOGIC_VECTOR (3 downto 0));
end odejmowanie;

architecture Behavioral of odejmowanie is

	signal pozyczka:std_logic_vector(4 downto 0);
	signal wynik_t:std_logic_vector(3 downto 0);

begin
--    process (liczba1, liczba2) is
--    begin
--        pozyczka <= "00000";
--            for i in 3 downto 0 loop
--                wynik_t(i) <= (liczba1(i) xor liczba2(i)) xor pozyczka(i);
--                pozyczka(i+1) <= ((not liczba1(i)) and liczba2(i)) or
--                    ((not (liczba1(i) xor  liczba2(i))) and pozyczka(i));
--            end loop;
--        wynik<=wynik_t;
--        --wait for 3ps;
--    end process;
--    --wynik <= "0000";

-- funkcjonalnosc ukladu na bramkach

    pozyczka(0) <= '0';
	wynik(0) <= liczba1(0) xor liczba2(0) xor '0';
	pozyczka(1) <= ((not liczba1(0)) and '0') or ( (not liczba1(0) and liczba2(0)) or (liczba2(0) and '0'));

	wynik(1) <= liczba1(1) xor liczba2(1) xor pozyczka(1);
	pozyczka(2) <= (not liczba1(1) and pozyczka(1)) or ((not liczba1(1) and liczba2(1)) or (liczba2(1) and pozyczka(1)));

	wynik(2) <= liczba1(2) xor liczba2(2) xor pozyczka(2);
	pozyczka(3) <= (not liczba1(2) and pozyczka(2)) or ((not liczba1(2) and liczba2(2)) or (liczba2(2) and pozyczka(2)));

	wynik(3) <= liczba1(3) xor liczba2(3) xor pozyczka(3);

end Behavioral;
