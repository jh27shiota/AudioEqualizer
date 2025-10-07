create_project prj -part xc7z020-clg400-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "C:/Users/liuwe/EQ/Vitis/EQ_HLS/solution1/syn/verilog/EQ_ddiv_64ns_64ns_64_59_no_dsp_1_ip.tcl"
source "C:/Users/liuwe/EQ/Vitis/EQ_HLS/solution1/syn/verilog/EQ_dmul_64ns_64ns_64_7_max_dsp_1_ip.tcl"
source "C:/Users/liuwe/EQ/Vitis/EQ_HLS/solution1/syn/verilog/EQ_sitodp_32ns_64_6_no_dsp_1_ip.tcl"
