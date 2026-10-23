set base [file dirname [file normalize [info script]]]
set dest {C:/Users/hihj3/lab6/03_dac}
file mkdir $dest
if {[file exists [file join $dest 03_dac.xpr]]} {
 error "Project already exists. Open its XPR instead of recreating it."
}
foreach f [glob [file join $base src *.v]] { file copy -force $f $dest }
file copy -force [file join $base sim tb_dac.sv] $dest
file copy -force [file join $base constraints dac.xdc] $dest
create_project 03_dac $dest -part xc7s75fgga484-1
add_files [glob [file join $dest *.v]]
add_files -fileset sim_1 [file join $dest tb_dac.sv]
add_files -fileset constrs_1 [file join $dest dac.xdc]
set_property top dac [get_filesets sources_1]
set_property top tb [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
