set base [file dirname [file normalize [info script]]]
set dest {C:/Users/hihj3/lab6/02_sram}
file mkdir $dest
if {[file exists [file join $dest 02_sram.xpr]]} {
 error "Project already exists. Open its XPR instead of recreating it."
}
foreach f [glob [file join $base src *.v]] { file copy -force $f $dest }
file copy -force [file join $base sim tb_sram.sv] $dest
file copy -force [file join $base constraints sram.xdc] $dest
create_project 02_sram $dest -part xc7s75fgga484-1
add_files [glob [file join $dest *.v]]
add_files -fileset sim_1 [file join $dest tb_sram.sv]
add_files -fileset constrs_1 [file join $dest sram.xdc]
set_property top sram [get_filesets sources_1]
set_property top tb [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
