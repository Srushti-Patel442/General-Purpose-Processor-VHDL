library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU1 is
    port (
        Clock      : in  std_logic;
          reset      : in  std_logic;
        A, B       : in  std_logic_vector(7 downto 0);
       -- student_id : in  unsigned(3 downto 0);
        OP         : in  unsigned(15 downto 0);
        neg        : out std_logic;
        r1         : out std_logic_vector(3 downto 0);
        r2         : out std_logic_vector(3 downto 0)
    );
end ALU1;

architecture calc of ALU1 is
    signal reg1, reg2, result : std_logic_vector(7 downto 0) := (others => '0');
begin
    reg1 <= A;
    reg2 <= B;

    process (Clock, OP)
    begin
        if (rising_edge(Clock)) then  -- falling-edge (active-LOW)
            case OP is
                -- 1. ADDITION (active-LOW OP)
                when "0000000000000001" => 
                    neg <= '0';               -- neg '1' = positive result
                    result <= reg1 + reg2;
                -- 2. SUBTRACTION
                when "0000000000000010" => 
                    if reg1 >= reg2 then
                        neg <= '0';
                        result <= reg1 - reg2;
                    else
                        neg <= '1';
                        result <= reg2 - reg1;
                    end if;
                -- 3. NOT A
                when "0000000000000100" => 
                    neg <= '0';
                    result <= not reg1;
                -- 4. A NAND B
                when "0000000000001000" => 
                    neg <= '0';
                    result <= not (reg1 and reg2);
                -- 5. A NOR B
                when "0000000000010000" => 
                    neg <= '0';
                    result <= not (reg1 or reg2);
                -- 6. A AND B
                when "0000000000100000" => 
                    neg <= '0';
                    result <= reg1 and reg2;
                -- 7. A XOR B
                when "0000000001000000" => 
                    neg <= '0';
                    result <= reg1 xor reg2;
                -- 8. A OR B
                when "0000000010000000" =>
                    neg <= '0';
                    result <= reg1 or reg2;
                -- 9. NOT (A XOR B)
                when "0000000100000000" =>
                    neg <= '0';
                    result <= not (reg1 xor reg2);

                when others =>
                    result <= (others => '0');
            end case;
        end if;
    end process;

    r1 <= result(3 downto 0);
    r2 <= result(7 downto 4);
end calc;
