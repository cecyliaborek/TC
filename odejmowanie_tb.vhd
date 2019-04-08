library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity odejmowanie_tb is
end odejmowanie_tb;

architecture Behavioral of odejmowanie_tb is
    signal liczba1 : integer;
    signal liczba2 : integer;
    signal wynik : integer;
    
    signal liczba1p : std_logic_vector(3 downto 0);
    signal liczba2p : std_logic_vector(3 downto 0);
    signal wynikp : std_logic_vector(3 downto 0);
    signal wynik_correct : integer;
        
    signal error : std_logic;

begin
    liczba1p <= std_logic_vector(to_unsigned(liczba1, 4));
    liczba2p <= std_logic_vector(to_unsigned(liczba2, 4));
    --wynikp <= std_logic_vector(to_unsigned(wynik, 4));
    

    --UUT: entity work.odejmowanie port map (liczba1=> liczba1p, liczba2=> liczba2p, wynik=>wynikp);
    UUT: entity work.odejmowanie port map (liczba1p, liczba2p, wynikp);
    
    process
    begin
        for i in 0 to 15 loop
            liczba1 <= i;
            for j in 0 to i loop
                liczba2 <= j;
                wait for 7ps;
                wait for 7ps;
             end loop;
        end loop;
    end process;
                    wynik <= to_integer(unsigned(wynikp));

    
    wynik_correct <= liczba1 - liczba2;
    error<= '1' when wynik /= wynik_correct else '0';
    
    
end Behavioral;

