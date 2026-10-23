set base [file dirname [file normalize [info script]]]
set dest {C:/Users/hihj3/lab6/01_servo_ctrl}
file mkdir $dest
if {[file exists [file join $dest 01_servo_ctrl.xpr]]} {
 error "Project already exists. Open its XPR instead of recreating it."
}
foreach f [glob [file join $base src *.v]] { file copy -force $f $dest }
file copy -force [file join $base sim tb_servo_ctrl.sv] $dest
file copy -force [file join $base constraints servo_ctrl.xdc] $dest
create_project 01_servo_ctrl $dest -part xc7s75fgga484-1
add_files [glob [file join $dest *.v]]
add_files -fileset sim_1 [file join $dest tb_servo_ctrl.sv]
add_files -fileset constrs_1 [file join $dest servo_ctrl.xdc]
set_property top servo_ctrl [get_filesets sources_1]
set_property top tb [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
