quit -sim

if {[file exists work]} {
    vdel -lib work -all
}

vlib work
vmap work work

vlog -sv +acc UART.sv
vlog -sv +acc Uart_tb.sv

vsim -voptargs=+acc work.Uart_tb

add wave -r sim:/Uart_tb/*
add wave -r sim:/Uart_tb/dut/*

run -all
