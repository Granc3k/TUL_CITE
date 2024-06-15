library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab03 is
    port (
        a,b,c,d : in std_logic;
        q_inv,q_log0,q_log1,q_and,q_or,q_xor,q_xnor,q_nand,q_nor,q_aoi,q_vote : out std_logic
    );
end lab03;

architecture Behavioral of lab03 is

    signal invertor : std_logic;
    
    signal s_and : std_logic;
    signal s_or : std_logic;
    
begin

    invertor <= not a;
    q_inv <= invertor;
    s_and <= a and b and c;
    s_or <= a or b or c;
    
    q_and <= s_and;
    q_nand <= not s_and;
    
    
    q_or <= s_or;
    q_xor <= a xor b xor c;
    q_xnor <= a xnor b xnor c;
    q_nor <= not s_or;
        
    q_log0 <= '0';
    q_log1 <= '1';
    
    q_vote <= (a and c) or (a and d) or (c and d and b) or (a and b and (not d));
     
end Behavioral;
