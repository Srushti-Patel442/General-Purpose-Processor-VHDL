library ieee;
use ieee.std_logic_1164.all;

entity newseg is
    port(
        bcd_code  : in  std_logic_vector(3 downto 0);
        segments  : out std_logic_vector(6 downto 0)  
        
    );
end newseg;

architecture behavior of newseg is 
    constant pattern_n : std_logic_vector(6 downto 0) :=
        "1101010";   -- n  
    constant pattern_y : std_logic_vector(6 downto 0) :=
        "1000100";   -- y  
    constant blank_pattern : std_logic_vector(6 downto 0) :=
        "1111111";   -- blank 

begin
    process(bcd_code)
    begin
                if (bcd_code = "0000") then
            -- Display n
            segments <= pattern_n;
        elsif (bcd_code = "1111") then
            -- Display y
            segments <= pattern_y;
        else
            -- Unknown → blank
            segments <= blank_pattern;
        end if;
    end process;
end behavior;
