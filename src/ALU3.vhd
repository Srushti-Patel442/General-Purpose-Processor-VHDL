library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity newALU3 is
    port (
        Clock      : in  std_logic;  
        A, B       : in  std_logic_vector(7 downto 0);
        student_id : in  std_logic_vector(3 downto 0);
        OP         : in  unsigned(15 downto 0);
        reset      : in  std_logic;
        result     : out std_logic_vector(3 downto 0)
    );
end newALU3;

architecture calc of newALU3 is

    signal result_code : std_logic_vector(3 downto 0);
    signal parity      : std_logic;

begin

    parity <= student_id(3) xor student_id(2) xor student_id(1) xor student_id(0);

    process(reset, OP, parity)
    begin

        if reset = '0' then
            result_code <= "0000";   -- display 'n'

        else
            case OP is

                when "0000000000000001" | 
                     "0000000000000010" | 
                     "0000000000000100" |  
                     "0000000000001000" |  
                     "0000000000010000" |  
                     "0000000000100000" | 
                     "0000000001000000" |  
                     "0000000010000000" |  
                     "0000000100000000" => 

                        -- same parity logic for all instructions
                        if parity = '1' then
                            result_code <= "1111";    -- y (odd parity)
                        else
                            result_code <= "0000";    -- n (even parity)
                        end if;

                when others =>
                    result_code <= "0000";

            end case;
        end if;
    end process;

    result <= result_code;

end calc;
