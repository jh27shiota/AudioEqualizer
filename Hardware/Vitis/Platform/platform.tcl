# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\40rui\EQ\Vitis\Platform\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\40rui\EQ\Vitis\Platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Platform}\
-hw {C:\Users\40rui\EQ\Vivado\system_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Users/40rui/EQ/Vitis}

platform write
platform generate -domains 
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
domain active {standalone_domain}
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform active {Platform}
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform config -updatehw {C:/Users/40rui/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform generate
platform active {Platform}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform clean
platform generate
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
platform active {Platform}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
platform generate
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
platform generate
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform config -updatehw {C:/Users/liuwe/EQ/Vivado/system_wrapper.xsa}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {Platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate
