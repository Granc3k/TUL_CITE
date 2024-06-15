library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simple_reg is
    port(
        clock      : in  std_logic;     -- synchronous clock signal connected to push button
        reset      : in  std_logic;     -- reset signal
        data       : in  std_logic;     -- data signal
        enable     : in  std_logic;     -- enable signal
        q_ff_re    : out std_logic;     -- a flip flop 
        q_latch    : out std_logic;     -- latch output
        q_ff_re_sr : out std_logic;     -- a flip flop with synchronous reset output, rising edge
        q_ff_fe_ar : out std_logic      -- a flip flop with asynchronous reset output, falling edge
    );
end simple_reg;

architecture Behavioral of simple_reg is

    signal ff_re : std_logic := '1';
    signal latch : std_logic := '1';
    signal ff_re_sr : std_logic := '1';
    signal ff_fe_ar : std_logic := '1';

begin

    process(clock)
    begin
        if rising_edge(clock) then
            ff_re <= data;
        end if;
    end process;
    q_ff_re <= ff_re;
    
    process(clock,reset, data)
    begin
        if reset = '1' then
            latch <= '0';
        elsif clock = '1' then
            latch <= data;
        end if;
        
    end process;
    q_latch <= latch;
    
    process(clock)
    begin
        if rising_edge(clock) then
            if reset='1' then
                ff_re_sr <= '0';
            elsif enable  = '1' then
                ff_re_sr <= data;
            end if;
        end if;
    end process;
    q_ff_re_sr <= ff_re_sr;
    
    process(clock,reset)
    begin
        if reset = '1' then
            ff_fe_ar <= '0';
        elsif falling_edge(clock) then
            if enable = '1' then
                ff_fe_ar <= data;
            end if;
        end if;
     end process;
    q_ff_fe_ar <= ff_fe_ar;
    
end Behavioral;
