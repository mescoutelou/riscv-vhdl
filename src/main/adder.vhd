--
-- File: adder.vhd
-- Created Date: 2024-10-15 01:58:44 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 02:20:56 pm
-- Modified By: Mathieu Escouteloup
-- Email: mathieu.escouteloup@ims-bordeaux.com
-- -----
-- License: See LICENSE.md
-- Copyright (c) 2024 HerdWare
-- -----
-- Description: 
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Adder is port (
	i_s1	: in std_logic_vector(31 downto 0);
	i_s2	: in std_logic_vector(31 downto 0);
	o_res	: out std_logic_vector(31 downto 0));
end entity Adder;

architecture arch of Adder is
	begin
		o_res <= i_s1 + i_s2;
end arch;