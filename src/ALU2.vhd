library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU2 is
port (Clock : in std_logic;
        A, B     : in std_logic_vector(7 downto 0);
        reset : in std_logic;
        OP         : in unsigned(15 downto 0);
        neg     : out std_logic;
        r1     : out std_logic_vector(3 downto 0);
        r2     : out std_logic_vector(3 downto 0));
end ALU2;

architecture calc of ALU2 is
signal reg1, reg2, result : std_logic_vector(7 downto 0) := (others => '0');
signal reg4 : unsigned (0 to 7);
begin
reg1 <= A;
reg2 <= B;
process (Clock, OP)
begin
    if (rising_edge(Clock)) then
        case OP is
            --1. swap the lower and upper 4 bits of A
                when "0000000000000001" => 
                Neg <= '0';
                    result <= reg1 (3 DOWNTO 0) & reg1 (7 DOWNTO 4);            
                --2. Produce the rsult of ORing A and B 
                when "0000000000000010" => 
                    Neg <= '0'; --neg '0' means that the result is not negative 
                        result <= reg1 OR reg2;            
                --3. Decrement B by 5
                when "0000000000000100" => 
                    Neg <= '0';
                        result <= std_logic_vector(unsigned(reg2) - 5);            
                --4.  Invert all bits of A  
                when "0000000000001000" => 
                    Neg <= '0';
                        result <= NOT reg1;            
                --5. Invert the bit-significance order of A 
                when "0000000000010000" => 
                    Neg <= '0';
                        result <= reg1(0) & reg1(1) & reg1(2) & reg1(3) & reg1(4) & reg1(5) & reg1(6) & reg1(7);            
                --6. Find the greater value of A an B and produce the results (Max (A,B)) 
                when "0000000000100000" => 
                    Neg <= '0';
                        if unsigned(reg1) >= unsigned(reg2) then 
                            result <= reg1;
                        else
                            result <= reg2;
                        end if;            
                --7. Produce the difference between A and B 
                when "0000000001000000" => 
                    if unsigned(reg1) >= unsigned(reg2) then
                        Neg <= '0';
                        result <= std_logic_vector(unsigned(reg1) - unsigned(reg2));
                    else    
                        Neg <= '1';
                        result <= std_logic_vector(unsigned(reg2) - unsigned(reg1));
                    end if;            
                --8. Produce the result of XNORing A and B 
                when "0000000010000000" =>
                    Neg <= '0';
                        result <= NOT (reg1 XOR reg2);          
                --9. Rotate B to the left by three bits (ROL)
                when "0000000100000000" =>
                    Neg <= '0';
                        result <= reg2(4 DOWNTO 0) & reg2(7 DOWNTO 5);
            when others => 
                        result <= "00000000";
        end case;
    end if;
end process;
r1 <= result(3 downto 0);
r2 <= result(7 downto 4);  
end calc;
