----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:04 03/28/2020 
-- Design Name: 
-- Module Name:    lab6Mod - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
	port(
		Qin, QinBar : in std_logic_vector(1 downto 0);
		Dollar, Quarter, Dime : in std_logic := '0';
		Comp1,Comp0 : in std_logic := '0';
		QO, QObar : out std_logic_vector(1 downto 0);
		Item, Change : out std_logic := '0'
		);
end FSM;

architecture Behavioral of FSM is

signal Q1, Q0 : std_logic := '0';
signal t1, t2, t3,t4, t5,t6,t7 : std_logic := '0';
signal Cnot1, Cnot0 : std_logic :='0';

begin
	Cnot1 <= not comp1;
	Cnot0 <= not comp0;
	
	t1 <= (Qinbar(1) and Qinbar(0)) and (dollar or quarter or dime);
	t2 <= (Qinbar(1) and Qin(0)) and (Cnot1 and Cnot0);
	
	t3 <= (Qinbar(1) and Qin(0)) and (Comp1 and Cnot0);
	t4 <= (Qinbar(1) and Qin(0)) and (Cnot1 and Comp0);
	t5 <= (Qin(1) and Qinbar(0)) and (Cnot1 and Comp0);
	
	Q0 <= t1 or t2;
	Q1 <= t3 or t4 or t5;
	
	QO(0) <= Q0;
	QObar(0) <= not Q0;
	
	QO(1) <= Q1;
	QObar(1) <= not Q1;
	
	Item <= Qin(1) and Qinbar(0) and comp1 and Cnot0;
	Change <= Qin(1) and Qinbar(0) and Cnot1 and comp0;





end Behavioral;



----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity JK_FF is 
	port( 
		J,K,enable, clk : in std_logic;
		Q,Qbar : out std_logic
	);
end JK_FF;

architecture ffBeh of JK_FF is 

signal TMP: std_logic := '0';

begin

				PROCESS(clk)
				
				begin
						if(CLK='1' and CLK'EVENT) then
							if(enable = '1') then
							if(J='1' and K='0')then
								TMP<='1';
							elsif(J='1' and K='1')then
								TMP<= not TMP;
							elsif(J='0' and K='1')then
								TMP<='0';
							else
							TMP<=TMP;
						end if;
						end if;
						end if;
				Q<=TMP;
				Qbar <=not TMP;
				end PROCESS;
				
end ffBeh;

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity D_FF is 
	port( 
		D,enable, clk : in std_logic;
		Q: out std_logic
	);
end D_FF;

architecture DffBeh of D_FF is 


begin

				PROCESS(clk,D,enable)
				begin
						if(CLK='1' and CLK'EVENT) then
							if(enable = '1') then
							Q <=D;
						end if;
						end if;
				end PROCESS;
				
end DffBeh;




----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity moneyValue is 
	port(
		Dollar,Quarter,Dime : in std_logic;
		money : out std_logic_vector(7 downto 0)
		);
end moneyValue;

architecture moneyBeh of moneyValue is

begin
	process(Dollar,Quarter,Dime)
	begin
	if(Dollar = '1' and Quarter = '0' and Dime = '0') then
		money<="01100100";
	elsif(Dollar = '0' and Quarter = '1' and Dime = '0') then
		money<="00011001";
	elsif(Dollar = '0' and Quarter = '0' and Dime = '1') then
		money<="00001010";		
	else
		money<="00000000";
	end if;
	end process;
end moneyBeh;

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity getPrice is 
	port(
		I0,I1,I2,I3 : in std_logic;
		price : out std_logic_vector(7 downto 0)
		);
end getPrice;

architecture priceBeh of getPrice is

begin
	process(I0,I1,I2,I3)
	begin
	if(I0 = '1' and I1 = '0' and I2 = '0' and I3 = '0') then
		price<="00101101"; -- 45 cents 
	elsif(I0 = '0' and I1 = '1' and I2 = '0' and I3 = '0') then
		price<="01001011"; --75 
	elsif(I0 = '0' and I1 = '0' and I2 = '1' and I3 = '0') then
		price<="01010000"; --80 
	elsif(I0 = '0' and I1 = '0' and I2 = '0' and I3 = '1') then
		price<="01100100"; --100
	else
		price <= "11111111";
	end if;
	end process;
end priceBeh;

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux8bit is
	port(
		A,B : in std_logic_vector(7 downto 0) := "00000000";
		sel : in std_logic;
		C : out std_logic_vector(7 downto 0) := "00000000");
end mux8bit;

architecture behMux of mux8bit is

begin

process(A,B,sel)

begin

if(sel = '0') then
	C <= A;
elsif(sel = '1')then
	C<=B;
end if;

end process;

end behMux;

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity adder is
	port(
		A,B : in std_logic_vector(7 downto 0) := "00000000";
		clk,enable,clear : std_logic := '0';
		C : inout std_logic_vector(7 downto 0) := "00000000");
end adder;

architecture behAdder of adder is 

signal add : std_logic_vector(7 downto 0) := "00000000";

begin

	process(clk,enable,A,B)
	
	begin
	
	if(clk'event and clk = '1') then
		if(enable = '1') then
			add <= A + B;
			if(add >= "11001000") then
			C<="11000011";
			else
			C <= add;
			end if;
		end if;
	end if;
	if(clear = '1') then
		C <= "00000000";
	end if;
	end process;
end behAdder;

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity comparator is 
	port(
		A,B : in std_logic_vector(7 downto 0) := "00000000";
		clk : in std_logic;
		O : out std_logic_vector( 1 downto 0) := "00");
end comparator;

architecture compBeh of comparator is


begin

	process(A,B,clk)
	
	begin
		if(clk'event and clk = '1') then
			if(A > B) then
			O <= "01";
			elsif(A = B) then
			O <= "10";
			else
				O<="00";
			end if;
		end if;
	end process;



end compBeh;


----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vendMachine is 
	port(
		clk,dollar,quarter,dime : in std_logic :='0';
		itemSelect0 : in std_logic;
		itemSelect1 : in std_logic;
		itemSelect2 : in std_logic;
		itemSelect3 : in std_logic;
		enter : in std_logic;
		money : inout std_logic_vector (7 downto 0) :="00000000"; 
		item0,item1,item2,item3 : out std_logic := '0';
		change : inout std_logic := '0'
		);
end vendMachine;


architecture structural of vendMachine is 

component JK_FF is 
	port( 
		J,K,enable, clk : in std_logic;
		Q,Qbar : out std_logic
	);
end component;

component FSM is
	port(
		Qin, QinBar : in std_logic_vector(1 downto 0);
		Dollar, Quarter, Dime : in std_logic := '0';
		Comp1,Comp0 : in std_logic := '0';
		QO, QObar : out std_logic_vector(1 downto 0);
		Item, Change : out std_logic := '0'
		);
end component;
component moneyValue is 
	port(
		Dollar,Quarter,Dime : in std_logic;
		money : out std_logic_vector(7 downto 0)
		);
end component;
component getPrice is 
	port(
		I0,I1,I2,I3 : in std_logic;
		price : out std_logic_vector(7 downto 0)
		);
end component;
component mux8bit is
	port(
		A,B : in std_logic_vector(7 downto 0) := "00000000";
		sel : in std_logic;
		C : out std_logic_vector(7 downto 0) := "00000000");
end component;

component adder is
	port(
		A,B : in std_logic_vector(7 downto 0) := "00000000";
		clk,enable,clear : std_logic := '0';
		C : inout std_logic_vector(7 downto 0) := "00000000");
end component;

component comparator is 
	port(
		A,B : in std_logic_vector(7 downto 0) := "00000000";
		clk : in std_logic;
		O : out std_logic_vector( 1 downto 0) := "00");
end component;
component D_FF is 
	port( 
		D,enable, clk : in std_logic;
		Q: out std_logic
	);
end component;


signal itemActivate : std_logic := '0';
signal Q1 : std_logic_vector(1 downto 0) := "00";
signal Q1bar : std_logic_vector(1 downto 0) := "11";
signal Q2 : std_logic_vector(1 downto 0) := "00";
signal Q2bar : std_logic_vector(1 downto 0) := "11";
signal inputValue : std_logic_vector(7 downto 0):= "00000000";
signal itemPrice : std_logic_vector(7 downto 0):="00000000";
signal subFIVE : std_logic_vector(7 downto 0):="11111011";
signal compValue : std_logic_vector(1 downto 0) := "00";
signal I : std_logic_vector(3 downto 0);
signal Addant : std_logic_vector(7 downto 0):="00000000";
signal addEnable : std_logic := '0';
begin
	addEnable <= Dollar or quarter or Dime or change;
	
	comp : comparator port map(money,itemPrice,clk,compValue);
	
	J0 : JK_FF port map(Q2(0),Q2bar(0),'1',clk,Q1(0),Q1bar(0));
	J1 : JK_FF port map(Q2(1),Q2bar(1),'1',clk,Q1(1),Q1bar(1));
	
	F1 : FSM port map(Q1,Q1bar,Dollar,Quarter,Dime,compValue(1),compValue(0),Q2,Q2Bar,itemActivate,change);
	
	D0 : D_FF port map(itemSelect0,enter,clk,I(0));
	D1 : D_FF port map(itemSelect1,enter,clk,I(1));
	D2 : D_FF port map(itemSelect2,enter,clk,I(2));
	D3 : D_FF port map(itemSelect3,enter,clk,I(3));
	
	GP : getPrice port map(I(0),I(1),I(2),I(3),itemPrice);
	
	MV : moneyValue port map(Dollar,Quarter,Dime,inputValue);

	mux : mux8bit port map(inputValue,subFIVE,change,addant);
	
	add : adder port map(Addant,money,clk,addEnable,itemActivate,money);
	item0 <= I(0) and itemActivate;
	item1 <= I(1) and itemActivate;
	item2 <= I(2) and itemActivate;
	item3 <= I(3) and itemActivate;
	
	
end structural;