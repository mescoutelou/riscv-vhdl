--
-- File: tb_example_many.vhd
-- Created Date: 2024-10-15 01:58:44 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 04:28:47 pm
-- Modified By: Mathieu Escouteloup
-- Email: mathieu.escouteloup@enseirb-matmeca.fr
-- -----
-- License: See LICENSE.md
-- Copyright (c) 2024 ENSEIRB-MATMECA
-- -----
-- Description: 
--


library vunit_lib;
context vunit_lib.vunit_context;

entity tb_example_many is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_example_many is
begin
  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    while test_suite loop

      if run("test_pass") then
        report "This will pass";

      elsif run("test_fail") then
        assert false report "It fails";

      end if;
    end loop;

    test_runner_cleanup(runner);
  end process;
end architecture;