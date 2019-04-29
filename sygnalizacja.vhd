library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sygnalizacja is
    Port ( przycisk : in STD_LOGIC;
           clk : in STD_LOGIC;
           swiatlaPieszego : out STD_LOGIC_VECTOR(1 downto 0):= "10";
           swiatlaSamochodu : out STD_LOGIC_VECTOR(2 downto 0):= "001"
           );
end sygnalizacja;
    
architecture Behavioral of sygnalizacja is
   type state_type is (st1_Z_C, st2_P_C, st3_C_C, st4_C_Z, st5_C_C, st6_P_C);
   signal previous_state, state, next_state : state_type;
   --Declare internal signals for all outputs of the state-machine
   signal samochod : std_logic_vector(2 downto 0);  -- example output signal
   signal pieszy : std_logic_vector(1 downto 0);
   signal licznik : integer := 0;
   

--Insert the following in the architecture after the begin keyword
begin
   SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
            previous_state <= state;
            state <= next_state;
            swiatlaSamochodu <= samochod;
            swiatlaPieszego <= pieszy;
            if previous_state /= state then
                licznik <= 0;
            else
                licznik <= licznik + 1;
            end if;
         -- assign other outputs to internal signals
      end if;
   end process;

   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      --insert statements to decode internal output signals
      --below is simple example
      if state = st1_Z_C then
         samochod <= "001";
         pieszy <= "10";
      elsif state = st2_P_C then
         samochod <= "010";
         pieszy <= "10";
      elsif state = st3_C_C then
         samochod <= "100";
         pieszy <= "10";
      elsif state = st4_C_Z then
         samochod <= "100";
         pieszy <= "01";
      elsif state = st5_C_C then
         samochod <= "100";
         pieszy <= "10";
      elsif state = st6_P_C then
         samochod <= "110";
         pieszy <= "10";
      end if;
   end process;

   NEXT_STATE_DECODE: process (state, przycisk, licznik)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when st1_Z_C =>
            if przycisk = '1' then
                if licznik >= 10 then
                    next_state <= st2_P_C;
                end if;
            end if;
         when st2_P_C =>
            if licznik >= 3 then
               next_state <= st3_C_C;
            end if;
         when st3_C_C =>
            if licznik >= 3 then
                next_state <= st4_C_Z;
            end if;
         when st4_C_Z =>
            if licznik >= 10 then
                next_state <= st5_C_C;
            end if;
         when st5_C_C =>
            if licznik >= 3 then
                next_state <= st6_P_C;
            end if;
         when st6_P_C =>
            if licznik >= 2 then
                next_state <= st1_Z_C;
            end if;
      end case;
   end process;


end Behavioral;
