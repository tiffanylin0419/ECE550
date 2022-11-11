transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/reference {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/reference/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/reference {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/reference/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/cpuone-base {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/cpuone-base/skeleton.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/cpuone-base {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/cpuone-base/processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/cpuone-base {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/cpuone-base/imem.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/cpuone-base {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/PC4_SimpleProcessor_basecode/cpuone-base/dmem.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/control_circuit.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/dffe_ref.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/bit12_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/clock2.v}
vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/math.v}

vlog -vlog01compat -work work +incdir+C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out {C:/Users/tl330/Documents/550/Cp4_SimpleProcessor_no_out/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all
