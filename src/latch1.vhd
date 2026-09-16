library ieee;
use ieee.std_logic_1164.all;

entity latch1 is
    port ( 
        A      : in  std_logic_vector(7 downto 0);
        resetn : in  std_logic;
        clock  : in  std_logic;
        Q      : out std_logic_vector(7 downto 0)
    );
end latch1;

architecture behavior of latch1 is
begin
    process(resetn, clock)
    begin
        if resetn = '0' then
            Q <= "00000000"; 
        elsif rising_edge(clock) then
            Q <= A;
        end if;
    end process;
end behavior;
