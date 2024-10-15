--
-- File: const.vhd
-- Created Date: 2024-10-15 04:30:14 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 04:38:40 pm
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

package C_CORE is
  constant NDATABIT : integer := 32;
	constant ALU_ADD  : std_logic_vector(2 downto 0) := "000";
	constant ALU_SLL  : std_logic_vector(2 downto 0) := "001";
  constant ALU_SLT  : std_logic_vector(2 downto 0) := "010";
  constant ALU_SLTU : std_logic_vector(2 downto 0) := "011";
  constant ALU_XOR  : std_logic_vector(2 downto 0) := "100";
  constant ALU_SR   : std_logic_vector(2 downto 0) := "101";
  constant ALU_OR   : std_logic_vector(2 downto 0) := "110";
  constant ALU_AND  : std_logic_vector(2 downto 0) := "111";
end package C_CORE;
