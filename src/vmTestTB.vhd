--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:08:02 03/28/2020
-- Design Name:   
-- Module Name:   D:/Khalid Saeed/School/College/2019-2020/Winter/ECE 475/Lab Reports/lab6/vmTestTB.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vMTest
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
 
ENTITY vmTestTB IS
END vmTestTB;
 
ARCHITECTURE behavior OF vmTestTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vMTest
    PORT(
         clk : IN  std_logic;
         Dollar : IN  std_logic;
         Quarter : IN  std_logic;
         Dime : IN  std_logic;
         C1 : IN  std_logic;
         C0 : IN  std_logic;
         Q1 : OUT  std_logic;
         Q1b : OUT  std_logic;
         Q0 : OUT  std_logic;
         Q0b : OUT  std_logic;
         item : OUT  std_logic;
         change : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Dollar : std_logic := '0';
   signal Quarter : std_logic := '0';
   signal Dime : std_logic := '0';
   signal C1 : std_logic := '0';
   signal C0 : std_logic := '0';

 	--Outputs
   signal Q1 : std_logic;
   signal Q1b : std_logic;
   signal Q0 : std_logic;
   signal Q0b : std_logic;
   signal item : std_logic;
   signal change : std_logic;

   -- Clock period definitions
   constant clk_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vMTest PORT MAP (
          clk => clk,
          Dollar => Dollar,
          Quarter => Quarter,
          Dime => Dime,
          C1 => C1,
          C0 => C0,
          Q1 => Q1,
          Q1b => Q1b,
          Q0 => Q0,
          Q0b => Q0b,
          item => item,
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
      -- hold reset state for 100 ns.
    --  C1 <= '1';
		C0 <= '0';
		
		wait for 30 ns;
		C1 <= '0';
		C0 <= '0';
		wait for 15 ns;
      Dollar <= '1';
		wait for 5 ns;
		Dollar <= '0';
		wait for 10 ns;
		Quarter <= '1';
		wait for 10 ns;
		Quarter <= '0';
		wait for 10 ns;
		C0 <= '1';
		wait for 20 ns;
		C0 <= '0';
		C1<='1';
		wait for 20 ns;
		C1 <= '0';
		wait for 50 ns;
		
		
      -- insert stimulus here 

     wait;
   end process;

END;
