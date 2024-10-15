--
-- File: tb_alu.vhd
-- Created Date: 2024-10-15 01:58:44 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 04:57:55 pm
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

library vunit_lib;
context vunit_lib.vunit_context;

library emmk;
use emmk.C_CORE.all;

entity tb_Alu is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_Alu is
  component Alu port(
	  i_sel		  : in std_logic_vector(2 downto 0);		
	  i_signed	: in std_logic;									
    i_op1		  : in std_logic_vector(NDATABIT - 1 downto 0);
	  i_op2		  : in std_logic_vector(NDATABIT - 1 downto 0);	
	  o_res	    : out std_logic_vector(NDATABIT - 1 downto 0));	
  end component;

	signal s_sel: std_logic_vector(2 downto 0);		
	signal s_signed: std_logic;									
  signal s_op1: std_logic_vector(NDATABIT - 1 downto 0);
	signal s_op2: std_logic_vector(NDATABIT - 1 downto 0);	
	signal s_res: std_logic_vector(NDATABIT - 1 downto 0);	

  begin
    m_Alu: Alu port map (
      i_sel		  => s_sel,		 
      i_signed  => s_signed, 
      i_op1		  => s_op1,		 
      i_op2		  => s_op2,		 
      o_res	    => s_res	   
    );

    main: process
    begin
      -- TEST: START
      test_runner_setup(runner, runner_cfg);
      wait for 20 ns;

      -- TEST: BODY
      -- TEST: T1
      s_sel <= ALU_ADD;
      s_signed <= '0';
      s_op1 <= x"00000001";
      s_op2 <= x"00000002";
      wait for 20 ns;

      assert (s_res = x"00000003") report "Error T1: ALU ADD";
      wait for 20 ns;

      -- TEST: T2
      s_sel <= ALU_ADD;
      s_signed <= '0';
      s_op1 <= x"00000001";
      s_op2 <= x"00000003";
      wait for 20 ns;

      assert (s_res = x"00000004") report "Error T2: ALU ADD";
      wait for 20 ns;

      -- TEST: T3
      s_sel <= ALU_ADD;
      s_signed <= '1';
      s_op1 <= x"00000010";
      s_op2 <= x"00000009";
      wait for 20 ns;

      assert (s_res = x"00000007") report "Error T3: ALU SUB";
      wait for 20 ns;

      -- TEST: T4
      s_sel <= ALU_SLL;
      s_signed <= '0';
      s_op1 <= x"00000010";
      s_op2 <= x"00000002";
      wait for 20 ns;

      assert (s_res = x"00000040") report "Error T4: ALU SLL" severity warning;
      wait for 20 ns;

      -- TEST: END
      wait for 20 ns;
--      assert true report "End of the simulation.";
      test_runner_cleanup(runner); -- Simulation ends here
    end process;
end tb;