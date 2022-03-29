transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Winter\ 2022/EECS3216\ Z\ -\ Digital\ Systems\ Engineering/Project/EECS-3216-Project/db {D:/Winter 2022/EECS3216 Z - Digital Systems Engineering/Project/EECS-3216-Project/db/ip_altpll.v}
vlog -sv -work work +incdir+D:/Winter\ 2022/EECS3216\ Z\ -\ Digital\ Systems\ Engineering/Project/EECS-3216-Project {D:/Winter 2022/EECS3216 Z - Digital Systems Engineering/Project/EECS-3216-Project/ClockDivider.sv}
vlog -sv -work work +incdir+D:/Winter\ 2022/EECS3216\ Z\ -\ Digital\ Systems\ Engineering/Project/EECS-3216-Project {D:/Winter 2022/EECS3216 Z - Digital Systems Engineering/Project/EECS-3216-Project/ip.sv}
vlog -sv -work work +incdir+D:/Winter\ 2022/EECS3216\ Z\ -\ Digital\ Systems\ Engineering/Project/EECS-3216-Project {D:/Winter 2022/EECS3216 Z - Digital Systems Engineering/Project/EECS-3216-Project/verticalClock.sv}
vlog -sv -work work +incdir+D:/Winter\ 2022/EECS3216\ Z\ -\ Digital\ Systems\ Engineering/Project/EECS-3216-Project {D:/Winter 2022/EECS3216 Z - Digital Systems Engineering/Project/EECS-3216-Project/horizontalClock.sv}
vlog -sv -work work +incdir+D:/Winter\ 2022/EECS3216\ Z\ -\ Digital\ Systems\ Engineering/Project/EECS-3216-Project {D:/Winter 2022/EECS3216 Z - Digital Systems Engineering/Project/EECS-3216-Project/top.sv}
vlog -sv -work work +incdir+D:/Winter\ 2022/EECS3216\ Z\ -\ Digital\ Systems\ Engineering/Project/EECS-3216-Project {D:/Winter 2022/EECS3216 Z - Digital Systems Engineering/Project/EECS-3216-Project/drawLines.sv}

