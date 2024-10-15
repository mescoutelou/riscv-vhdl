--
-- File: tb_example_many.vhd
-- Created Date: 2024-10-15 01:57:43 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 01:57:49 pm
-- Modified By: Mathieu Escouteloup
-- Email: mathieu.escouteloup@ims-bordeaux.com
-- -----
-- License: See LICENSE.md
-- Copyright (c) 2024 HerdWare
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