library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor is
    Port(
        d: in std_logic_vector(7 downto 0);
        s: in std_logic_vector(15 downto 13);
        q: out std_logic
    );
end multiplexor;

architecture Behavioral of multiplexor is

begin 
q <= d(0) when s = '111'
else q <= d(1) when s = '110'
else q <= d(2) when s = '101'
else q <= d(3) when s = '100'
else q <= d(4) when s = '011'
else q <= d(5) when s = '010'
else q <= d(6) when s = '001'
else q <= d(7) when s = '000';

end Behavioral;
