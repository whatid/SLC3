onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /testbench/processor/fuck/d0/regfileunit/data
add wave -noupdate /testbench/processor/fuck/state_controller/State
add wave -noupdate /testbench/processor/fuck/muxforCPU_bus/f
add wave -noupdate /testbench/processor/fuck/d0/irunit/in
add wave -noupdate /testbench/processor/fuck/d0/mdr/out
add wave -noupdate /testbench/processor/fuck/d0/mar/out
add wave -noupdate /testbench/processor/fuck/d0/regfileunit/load
add wave -noupdate /testbench/processor/fuck/d0/regfileunit/in
add wave -noupdate /testbench/processor/fuck/d0/regfileunit/dest
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {184465 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 357
configure wave -valuecolwidth 224
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {143981 ps} {324141 ps}
