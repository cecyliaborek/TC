library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sygnalizacja_tb is
--  Port ( );
end sygnalizacja_tb;

architecture Behavioral of sygnalizacja_tb is
    signal przycisk: std_logic;
    signal clk: std_logic;
    signal swiatlaPieszego: std_logic_vector(1 downto 0);
    signal swiatlaSamochodu: std_logic_vector(2 downto 0);
    
    constant clk_period : time := 50 ns;
begin

    UUT: entity work.sygnalizacja port map (przycisk, CLK, swiatlaPieszego, swiatlaSamochodu);
    
    clk_process :process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
    end process;
    
    sim_proc: process
        begin
            przycisk <= '1';
            wait for 100 ns;
    end process;

end Behavioral;
