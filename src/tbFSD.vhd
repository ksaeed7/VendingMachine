--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:49:36 03/28/2020
-- Design Name:   
-- Module Name:   D:/Khalid Saeed/School/College/2019-2020/Winter/ECE 475/Lab Reports/lab6/tbFSD.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbFSD IS
END tbFSD;
 
ARCHITECTURE behavior OF tbFSD IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         Qin : IN  std_logic_vector(1 downto 0);
         QinBar : IN  std_logic_vector(1 downto 0);
         Dollar : IN  std_logic;
         Quarter : IN  std_logic;
         Dime : IN  std_logic;
         Comp1 : IN  std_logic;
         Comp0 : IN  std_logic;
         QO : OUT  std_logic_vector(1 downto 0);
         QObar : OUT  std_logic_vector(1 downto 0);
         Item : OUT  std_logic;
         Change : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Qin : std_logic_vector(1 downto 0) := (others => '0');
   signal QinBar : std_logic_vector(1 downto 0) := (others => '0');
   signal Dollar : std_logic := '0';
   signal Quarter : std_logic := '0';
   signal Dime : std_logic := '0';
   signal Comp1 : std_logic := '0';
   signal Comp0 : std_logic := '0';

 	--Outputs
   signal QO : std_logic_vector(1 downto 0);
   signal QObar : std_logic_vector(1 downto 0);
   signal Item : std_logic;
   signal Change : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          Qin => Qin,
          QinBar => QinBar,
          Dollar => Dollar,
          Quarter => Quarter,
          Dime => Dime,
          Comp1 => Comp1,
          Comp0 => Comp0,
          QO => QO,
          QObar => QObar,
          Item => Item,
          Change => Change
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
