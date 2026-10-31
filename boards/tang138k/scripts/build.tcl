# Run with: gw_sh scripts/build.tcl  (from boards/tang138k)
set board_dir [file normalize [file join [file dirname [info script]] ..]]
set cpu_dir [file normalize [file join $board_dir ../..]]
set build_dir [file join $board_dir build]

file mkdir $build_dir
foreach image [list \
        [file join $cpu_dir ucode.hex] \
        [file join $cpu_dir pla_entry_rom.hex] \
        [file join $cpu_dir pla_group_entry.hex] \
        [file join $cpu_dir x87 x87_ucode.mem] \
        [file join $cpu_dir boards firmware blink.hex]] {
    file copy -force $image [file join $build_dir [file tail $image]]
}

# Relative $readmemh images resolve from the build directory.
cd $build_dir
set_device GW5AST-LV138FPG676AES -device_version B
set_option -output_base_name z486_tang138k

add_file -type verilog [file join $board_dir rtl tang138k_defines.sv]
set manifest_file [open [file join $cpu_dir boards common rtl_sources.f] r]
while {[gets $manifest_file line] >= 0} {
    set line [string trim $line]
    if {$line eq "" || [string match "#*" $line]} {
        continue
    }
    add_file -type verilog [file join $cpu_dir $line]
}
close $manifest_file

add_file -type verilog [file join $board_dir rtl tang138k_pll.v]
add_file -type verilog [file join $board_dir rtl tang138k_top.sv]
add_file -type cst [file join $board_dir constraints tang138k.cst]
add_file -type sdc [file join $board_dir constraints tang138k.sdc]

set_option -top_module tang138k_top
set_option -verilog_std sysv2017
set_option -include_path [list $cpu_dir [file join $cpu_dir x87] $build_dir]
set_option -multi_file_compilation_unit 1
set_option -use_sspi_as_gpio 1
set_option -use_mspi_as_gpio 1
set_option -use_cpu_as_gpio 1
set_option -rw_check_on_ram 0
set_option -print_all_synthesis_warning 0

run all
