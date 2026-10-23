# Combo II-DLD S75 / xc7s75fgga484-1 / 50 MHz
# Pin source: supplied equipment example XDC and S7 pin map.
set_property PACKAGE_PIN B6 [get_ports {clk_50mhz}]
set_property PACKAGE_PIN K4 [get_ports {left_pulse}]
set_property PACKAGE_PIN N4 [get_ports {right_pulse}]
set_property PACKAGE_PIN N8 [get_ports {rst_p}]
set_property PACKAGE_PIN AA22 [get_ports {servo}]
set_property IOSTANDARD LVCMOS33 [get_ports *]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]
