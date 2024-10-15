--
-- File: tb.vhd
-- Created Date: 2024-10-15 01:42:54 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2024-10-15 01:42:57 pm
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

entity tb_example is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_example is
begin
  main : process
  begin
    test_runner_setup(runner, runner_cfg);
    report "Hello world!";
    test_runner_cleanup(runner); -- Simulation ends here
  end process;
end architecture;
