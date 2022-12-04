###############################################################################
# Created by write_sdc
# Sun Dec  4 21:10:10 2022
###############################################################################
current_design cntr_example
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name wb_clk_i -period 65.0000 [get_ports {wb_clk_i}]
set_clock_transition 0.1500 [get_clocks {wb_clk_i}]
set_clock_uncertainty 0.2500 wb_clk_i
set_propagated_clock [get_clocks {wb_clk_i}]
set_input_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {wb_rst_i}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[0]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[10]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[11]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[12]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[13]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[14]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[15]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[16]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[17]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[18]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[19]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[1]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[20]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[21]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[22]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[23]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[24]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[25]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[26]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[27]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[28]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[29]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[2]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[30]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[31]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[32]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[33]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[34]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[35]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[36]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[37]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[3]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[4]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[5]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[6]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[7]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[8]}]
set_output_delay 13.0000 -clock [get_clocks {wb_clk_i}] -add_delay [get_ports {io_out[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {io_out[37]}]
set_load -pin_load 0.0729 [get_ports {io_out[36]}]
set_load -pin_load 0.0729 [get_ports {io_out[35]}]
set_load -pin_load 0.0729 [get_ports {io_out[34]}]
set_load -pin_load 0.0729 [get_ports {io_out[33]}]
set_load -pin_load 0.0729 [get_ports {io_out[32]}]
set_load -pin_load 0.0729 [get_ports {io_out[31]}]
set_load -pin_load 0.0729 [get_ports {io_out[30]}]
set_load -pin_load 0.0729 [get_ports {io_out[29]}]
set_load -pin_load 0.0729 [get_ports {io_out[28]}]
set_load -pin_load 0.0729 [get_ports {io_out[27]}]
set_load -pin_load 0.0729 [get_ports {io_out[26]}]
set_load -pin_load 0.0729 [get_ports {io_out[25]}]
set_load -pin_load 0.0729 [get_ports {io_out[24]}]
set_load -pin_load 0.0729 [get_ports {io_out[23]}]
set_load -pin_load 0.0729 [get_ports {io_out[22]}]
set_load -pin_load 0.0729 [get_ports {io_out[21]}]
set_load -pin_load 0.0729 [get_ports {io_out[20]}]
set_load -pin_load 0.0729 [get_ports {io_out[19]}]
set_load -pin_load 0.0729 [get_ports {io_out[18]}]
set_load -pin_load 0.0729 [get_ports {io_out[17]}]
set_load -pin_load 0.0729 [get_ports {io_out[16]}]
set_load -pin_load 0.0729 [get_ports {io_out[15]}]
set_load -pin_load 0.0729 [get_ports {io_out[14]}]
set_load -pin_load 0.0729 [get_ports {io_out[13]}]
set_load -pin_load 0.0729 [get_ports {io_out[12]}]
set_load -pin_load 0.0729 [get_ports {io_out[11]}]
set_load -pin_load 0.0729 [get_ports {io_out[10]}]
set_load -pin_load 0.0729 [get_ports {io_out[9]}]
set_load -pin_load 0.0729 [get_ports {io_out[8]}]
set_load -pin_load 0.0729 [get_ports {io_out[7]}]
set_load -pin_load 0.0729 [get_ports {io_out[6]}]
set_load -pin_load 0.0729 [get_ports {io_out[5]}]
set_load -pin_load 0.0729 [get_ports {io_out[4]}]
set_load -pin_load 0.0729 [get_ports {io_out[3]}]
set_load -pin_load 0.0729 [get_ports {io_out[2]}]
set_load -pin_load 0.0729 [get_ports {io_out[1]}]
set_load -pin_load 0.0729 [get_ports {io_out[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {wb_clk_i}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {wb_rst_i}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 4.0000 [current_design]
