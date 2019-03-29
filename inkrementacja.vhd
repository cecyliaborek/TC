library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Inkrementator is
  port(
    x: in STD_LOGIC_VECOTR(0 to 4);
    y: out STD_LOGIC_VECOTR(0 to 4)
  );
end Inkrementator;

architecture Behavioral of Inkrementator is
  begin
