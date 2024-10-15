--
-- File: adder.vhd
-- Created Date: 2024-10-15 01:58:44 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 04:31:46 pm
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

entity Adder is port (
	i_s1	: in std_logic_vector(31 downto 0);
	i_s2	: in std_logic_vector(31 downto 0);
	o_res	: out std_logic_vector(31 downto 0));
end entity Adder;

architecture arch of Adder is
	begin
		o_res <= i_s1 + i_s2;
end arch;