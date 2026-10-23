set base [file dirname [file normalize [info script]]]
set dest {C:/Users/hihj3/lab6/04_uart_echo}
file mkdir $dest
if {[file exists [file join $dest 04_uart_echo.xpr]]} {
 error "Project already exists. Open its XPR instead of recreating it."
}
foreach f [glob [file join $base src *.v]] { file copy -force $f $dest }
file copy -force [file join $base sim tb_uart_echo.sv] $dest
file copy -force [file join $base constraints uart_echo.xdc] $dest
create_project 04_uart_echo $dest -part xc7s75fgga484-1
add_files [glob [file join $dest *.v]]
add_files -fileset sim_1 [file join $dest tb_uart_echo.sv]
add_files -fileset constrs_1 [file join $dest uart_echo.xdc]
set_property top lab6_uart [get_filesets sources_1]
set_property top tb_uart_echo [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
