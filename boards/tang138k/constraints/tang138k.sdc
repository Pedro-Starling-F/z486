create_clock -name sys_clk -period 20 -waveform {0 10} [get_ports {sys_clk}]
create_generated_clock -name cpu_clk -source [get_ports {sys_clk}] -master_clock sys_clk -multiply_by 2 -divide_by 5 [get_pins {cpu_clock/PLL_inst/CLKOUT0}]
