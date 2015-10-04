transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/tristate.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/SLC3_2.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/sext.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/register.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/regfile.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/plus1.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/mux3.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/mux2.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/Mem2IO.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/ISDU.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/ir.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/HexDriver.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/gencc.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/datapath.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/comparator.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/alu.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/adder.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/mux4.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/test_memory.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/slc3.sv}
vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/slc3_tb.sv}

vlog -sv -work work +incdir+/home/wirjo2/slc3/SLC3 {/home/wirjo2/slc3/SLC3/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
