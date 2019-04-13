library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sipo_tb is
--  Port ( );
end sipo_tb;

architecture Behavioral of sipo_tb is
    signal DataIn: STD_LOGIC:= '0';
    signal CLK: STD_LOGIC:= '0';
    
    signal DataOut: STD_LOGIC_VECTOR ( 3 downto 0);
    
    constant clk_period : time := 50 ns;
begin

    UUT: entity work.sipo port map (DataIn, CLK, DataOut);
    
    clk_process :process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process;
        
    stim_proc: process
        begin                       
            DataIn<='0';
                  wait for 50 ns;      
            DataIn<='0';
                  wait for 50 ns;      
            DataIn<='1';
                  wait for 50 ns;      
            DataIn<='1';
                  wait for 50 ns;      
            DataIn<='0';
                  wait for 50 ns;      
            DataIn<='1';
                  wait for 50 ns;      
            DataIn<='0';
                  wait for 50 ns;      
            DataIn<='1';
                  wait for 50 ns;      
            DataIn<='0';
                  wait for 50 ns;      
            DataIn<='1';
                  wait for 50 ns;
            DataIn<='1';
                  wait for 50 ns;      
            DataIn<='0';
                  wait for 50 ns;                              
            DataIn<='0';
                  wait for 50 ns;      
            wait;
                  wait;
     end process;


end Behavioral;
