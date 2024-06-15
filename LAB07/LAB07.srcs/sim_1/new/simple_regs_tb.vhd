library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simple_regs_tb is
end simple_regs_tb;

architecture Behavioral of simple_regs_tb is
    
    -- inputs
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal data : std_logic  := '0';
    signal enable : std_logic := '1';
    
    -- outputs - do not assign
    signal q_ff_re : std_logic;
    signal q_latch : std_logic;
    signal q_ff_re_sr : std_logic;
    signal q_ff_fe_ar : std_logic;

begin
    
    DUT : entity work.simple_reg
        port map(
            clock      => clock,
            reset      => reset,
            data       => data,
            enable     => enable,
            q_ff_re    => q_ff_re,
            q_latch    => q_latch,
            q_ff_re_sr => q_ff_re_sr,
            q_ff_fe_ar => q_ff_fe_ar
        );
    

    clk: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        ---  => .
    
    end process;
    
    dt: process
    begin 
        data <= '1';
        wait for 25 ns;
        data <= '0';
        wait for 20 ns;
        data <= '1';
        wait for 7 ns;
        data <= '0';
        wait for 3 ns;
        data <= '1';
        wait for 10 ns;
        data <= '0';
        wait for 20 ns;
        data <= '1';
        wait for 50 ns;
     end process;
     
     enb: process 
     begin 
        enable <= '1';
        wait for 65 ns;
        enable <= '0';
        wait for 20 ns;
        enable <= '1';
        wait for 50 ns;
     end process;
     
     res: process
     begin
        reset <= '0';
        wait for 100ns;
        reset <= '1';
        wait for 5ns;
        reset <= '0';
        wait for 20ns;
        reset <= '1';
        wait for 10ns;
     end process; 
    end Behavioral;
