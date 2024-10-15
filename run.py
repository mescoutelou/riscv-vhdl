###
 # File: run.py                                                                #
 # Created Date: 2024-10-15 01:41:51 pm                                        #
 # Author: Mathieu Escouteloup                                                 #
 # -----                                                                       #
 # Last Modified: 2024-10-15 04:50:10 pm                                       #
 # Modified By: Mathieu Escouteloup                                            #
 # Email: mathieu.escouteloup@ims-bordeaux.com                                 #
 # -----                                                                       #
 # License: See LICENSE.md                                                     #
 # Copyright (c) 2024 ENSEIRB-MATMECA                                          #
 # -----                                                                       #
 # Description:                                                                #
###


from vunit import VUnit

# Create VUnit instance by parsing command line arguments
vu = VUnit.from_argv(compile_builtins=False)

# Optionally add VUnit's builtin HDL utilities for checking, logging, communication...
# See http://vunit.github.io/hdl_libraries.html.
vu.add_vhdl_builtins()
# or
# vu.add_verilog_builtins()


# Create library 'emmk'
lib = vu.add_library("emmk")

vu.set_compile_option("ghdl.a_flags", ["-fsynopsys"])

# Add all files ending in .vhd in current working directory to library
lib.add_source_files("src/main/*.vhd")
lib.add_source_files("src/main/core/*.vhd")
lib.add_source_files("src/test/*.vhd")
lib.add_source_files("src/test/core/*.vhd")

#vu.set_compile_option("ghdl.a_flags", ["--ieee=standard"])
vu.set_compile_option("ghdl.a_flags", ["-fsynopsys"])
vu.set_sim_option("ghdl.elab_flags", ["-fsynopsys"])
#vu.set_sim_option("ghdl.sim_flags", [""])

# Run vunit function
vu.main()


