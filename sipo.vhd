library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
entity sipo is
    Port ( DataIn : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DataOut : out STD_LOGIC_VECTOR(3 downto 0));
           
           
end sipo;

architecture Behavioral of sipo is
    signal temporary: STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal counter: integer := 0;
begin

    process(clk)
    begin
        if rising_edge(clk) then
            temporary <= (temporary(2 downto 0) & DataIn);
            counter <= counter + 1;
            
            
        end if;
        if counter = 4 then
                DataOut <= temporary;
                counter <= 0;
        end if; 
    end process;
end Behavioral;
