--
-- File: tb_adder.vhd
-- Created Date: 2024-10-15 01:58:44 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 04:31:51 pm
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

entity tb_Adder is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_Adder is
  component Adder port(
	  i_s1	: in std_logic_vector(31 downto 0);
	  i_s2	: in std_logic_vector(31 downto 0);
	  o_res	: out std_logic_vector(31 downto 0));
  end component;

	signal s_s1: std_logic_vector(31 downto 0);
	signal s_s2: std_logic_vector(31 downto 0);
	signal s_res: std_logic_vector(31 downto 0);

  begin
    m_adder: adder port map (
      i_s1  => s_s1,
      i_s2  => s_s2,
      o_res => s_res
    );

    main: process
    begin
      test_runner_setup(runner, runner_cfg);
      wait for 20 ns;

      s_s1 <= x"00000001";
      s_s2 <= x"00000002";
      wait for 20 ns;

      assert (s_res = x"00000003") report "Error in the addition.";
      wait for 20 ns;

      s_s1 <= x"00000001";
      s_s2 <= x"00000004";
      wait for 20 ns;

      assert (s_res = x"00000005") report "Error in the addition.";
      wait for 20 ns;

      s_s1 <= x"00000001";
      s_s2 <= x"00000005";
      wait for 20 ns;

      assert (s_res = x"00000006") report "Error in the addition.";
      wait for 20 ns;

      s_s1 <= x"00000000";
      s_s2 <= x"00000000";
      wait for 20 ns;

      assert (s_res = x"00000000") report "Error in the addition zero.";
      wait for 20 ns;
      
      s_s1 <= x"00000001";
      s_s2 <= x"00000001";
      wait for 40 ns;
      assert (s_res = x"00000002") report "Error in the addition 2.";

-- End of the test      
      wait for 20 ns;
--      assert true report "End of the simulation.";
      test_runner_cleanup(runner); -- Simulation ends here
    end process;
end tb;