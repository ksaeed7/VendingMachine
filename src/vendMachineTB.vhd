--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:59:03 03/28/2020
-- Design Name:   
-- Module Name:   D:/Khalid Saeed/School/College/2019-2020/Winter/ECE 475/Lab Reports/lab6/vendMachineTB.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vendMachine
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
 
ENTITY vendMachineTB IS
END vendMachineTB;
 
ARCHITECTURE behavior OF vendMachineTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vendMachine
    PORT(
         clk : IN  std_logic;
         dollar : IN  std_logic;
         quarter : IN  std_logic;
         dime : IN  std_logic;
         itemSelect0 : IN  std_logic;
         itemSelect1 : IN  std_logic;
         itemSelect2 : IN  std_logic;
         itemSelect3 : IN  std_logic;
         enter : IN  std_logic;
         money : INOUT  std_logic_vector(7 downto 0);
         item0 : OUT  std_logic;
         item1 : OUT  std_logic;
         item2 : OUT  std_logic;
         item3 : OUT  std_logic;
         change : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal dollar : std_logic := '0';
   signal quarter : std_logic := '0';
   signal dime : std_logic := '0';
   signal itemSelect0 : std_logic := '0';
   signal itemSelect1 : std_logic := '0';
   signal itemSelect2 : std_logic := '0';
   signal itemSelect3 : std_logic := '0';
   signal enter : std_logic := '0';

	--BiDirs
   signal money : std_logic_vector(7 downto 0);
   signal change : std_logic;

 	--Outputs
   signal item0 : std_logic;
   signal item1 : std_logic;
   signal item2 : std_logic;
   signal item3 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vendMachine PORT MAP (
          clk => clk,
          dollar => dollar,
          quarter => quarter,
          dime => dime,
          itemSelect0 => itemSelect0,
          itemSelect1 => itemSelect1,
          itemSelect2 => itemSelect2,
          itemSelect3 => itemSelect3,
          enter => enter,
          money => money,
          item0 => item0,
          item1 => item1,
          item2 => item2,
          item3 => item3,
          change => change
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5 ns;
      -- hold reset state for 100 ns.
      quarter <= '1';
		wait for 10 ns;
		quarter <= '0';
		Dollar <= '1';
		wait for 10 ns;
		dollar<= '0';
		dime <= '1';
		wait for 10 ns;
		dime<= '0';
		itemSelect0 <= '1';
		enter <= '1';
		wait for 20 ns;
		enter <= '0';
		itemSelect0<='0';

		wait for 150 ns;
		quarter <= '1';
		wait for 10 ns;
		quarter <= '0';
		dime <= '1';
		wait for 10 ns;
		dime<= '0';
		quarter <= '1';
		wait for 10 ns;
		quarter<= '0';
		itemSelect1 <= '1';
		enter <= '1';
		wait for 20 ns;
		enter <= '0';
		itemSelect1<='0';
		wait for 100 ns;
		quarter <= '1';
		wait for 10 ns;
		quarter <= '0';
		Dollar <= '1';
		wait for 10 ns;
		dollar<= '0';
		quarter <= '1';
		wait for 10 ns;
		quarter<= '0';
		itemSelect2 <= '1';
		enter <= '1';
		wait for 20 ns;
		enter <= '0';
		itemSelect2<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
