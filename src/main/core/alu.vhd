--
-- File: alu.vhd
-- Created Date: 2024-10-15 04:35:50 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 04:55:18 pm
-- Modified By: Mathieu Escouteloup
-- Email: mathieu.escouteloup@enseirb-matmeca.fr
-- -----
-- License: See LICENSE.md
-- Copyright (c) 2024 ENSEIRB-MATMECA
-- -----
-- Description: 
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library emmk;
use emmk.C_CORE.all;

entity Alu is port (
	i_sel		  : in std_logic_vector(2 downto 0);		
	i_signed	: in std_logic;									
  i_op1		  : in std_logic_vector(NDATABIT - 1 downto 0);
	i_op2		  : in std_logic_vector(NDATABIT - 1 downto 0);	
	o_res	    : out std_logic_vector(NDATABIT - 1 downto 0));	
end entity Alu;

architecture alu_arch of alu is
	signal s_res : std_logic_vector(NDATABIT - 1 downto 0); 
	signal s_amount : std_logic_vector(4 downto 0);


	begin
    -- Direct affectation
    s_amount <= i_op2(4 downto 0); 

		-- Combinatorial Logic
		comb1 : process (i_sel, i_signed, i_op1, i_op2, i_signed)
			begin
			  case i_sel is
			  	when ALU_ADD =>		-- Addition / Substraction
			  		if (i_signed = '0') then
			  			s_res <= i_op1 + i_op2;
			  		else
			  			s_res <= i_op1 - i_op2;
			  		end if;	
  				when ALU_SLL =>		-- Left Shift (Logical)
  					for I in 31 downto 0 loop
  						if I < to_integer(unsigned(s_amount)) then
  							s_res(I) <= '0';
  						else	
  							s_res(I) <= i_op1(I - to_integer(unsigned(s_amount)));
  						end if;
  					end loop;
				  when others =>
				  	s_res <= (others => '0');
			end case;
		end process comb1;

		o_res <= s_res;

--				when c_ALU_SLL =>		-- Left Shift (Logical)
--					for I in 31 downto 0 loop
--						if I < to_integer(unsigned(i_amount)) then
--							s_res(I) <= '0';
--						else	
--							s_res(I) <= i_op1(I - to_integer(unsigned(i_amount)));
--						end if;
--					end loop;
--				when c_ALU_SLT =>		-- Set on Less Than (Signed)
--					s_res(NDATABIT - 1 downto 1) <= (others => '0');
--					if (signed(i_op1) < signed(i_op2)) then
--						s_res(0) <= '1';
--					else   
--						s_res(0) <= '0';
--					end if;
--				when c_ALU_SLTU =>		-- Set on Less Than (Unsigned)
--					s_res(NDATABIT - 1 downto 1) <= (others => '0');
--					if (unsigned(i_op1) < unsigned(i_op2)) then
--						s_res(0) <= '1';
--					else   
--						s_res(0) <= '0';
--					end if;
--				when c_ALU_XOR =>		-- Logical XOR
--					s_res <= i_op1 XOR i_op2;
--				when c_ALU_SR =>		-- Right Shift (Logical or Arithmetic)
--					for I in 0 to 31 loop
--						if I < (31 - to_integer(unsigned(i_amount)) + 1) then
--							s_res(I) <= i_op1(I + to_integer(unsigned(i_amount)));
--						else
--							if i_signed = '1' then
--								s_res(I) <= i_op1(31);
--							else
--								s_res(I) <= '0';
--							end if;
--						end if;
--					end loop;
--				when c_ALU_OR =>		-- Logical OR
--					s_res <= i_op1 OR i_op2;
--				when c_ALU_AND =>		-- Logical AND
--					s_res <= i_op1 AND i_op2;
end alu_arch;