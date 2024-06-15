library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_mealy is
    port(
        clk   : in  std_logic;
        rst   : in  std_logic;
        seq   : in  std_logic;
        found : out std_logic
    );
end fsm_mealy;

architecture Behavioral of fsm_mealy is

    type fsm_type is (StateStart,State1,State2, StateFound);
    signal current_state, next_state : fsm_type;
begin

    -- fsm memory
    mem : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= StateStart;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    -- fsm transfer and output function are combinatorial logic
    transfer : process(current_state, seq)
    begin
        -- default state
        next_state <= current_state;
        case current_state is
            when StateStart =>
                -- assign outputs
                -- transfer function
                found      <= '0';
                if seq = '0' then
                    next_state <= State1;
                end if;
            when State1 =>
                found      <= '0';
                if seq = '1' then
                    next_state <= State2;
                else
                    next_state <= State1;                
                end if;            
            when State2 =>
                found <= '0';
                if seq = '1' then
                    next_state <= StateFound;
                else
                    next_state <= StateStart;
                end if;                
            when StateFound =>
                if seq = '1' then
                    next_state <= StateStart;
                    found      <= '1';
                else
                    next_state <= State1;
                    found <= '0';
                end if;
            when others =>
                -- graveyard | eden
                next_state <= StateStart;
        end case;
    end process;

end Behavioral;
