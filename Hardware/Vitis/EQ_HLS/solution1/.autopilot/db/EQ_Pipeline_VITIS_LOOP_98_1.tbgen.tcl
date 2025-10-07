set moduleName EQ_Pipeline_VITIS_LOOP_98_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {EQ_Pipeline_VITIS_LOOP_98_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_lshr_f6_cast int 10 regular  }
	{ buf_re_V int 40 regular {array 1024 { 2 3 } 1 1 }  }
	{ buf_im_V int 40 regular {array 1024 { 2 3 } 1 1 }  }
	{ trunc_ln10 int 10 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p_lshr_f6_cast", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "buf_re_V", "interface" : "memory", "bitwidth" : 40, "direction" : "READWRITE"} , 
 	{ "Name" : "buf_im_V", "interface" : "memory", "bitwidth" : 40, "direction" : "READWRITE"} , 
 	{ "Name" : "trunc_ln10", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_lshr_f6_cast sc_in sc_lv 10 signal 0 } 
	{ buf_re_V_address0 sc_out sc_lv 10 signal 1 } 
	{ buf_re_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ buf_re_V_we0 sc_out sc_logic 1 signal 1 } 
	{ buf_re_V_d0 sc_out sc_lv 40 signal 1 } 
	{ buf_re_V_q0 sc_in sc_lv 40 signal 1 } 
	{ buf_im_V_address0 sc_out sc_lv 10 signal 2 } 
	{ buf_im_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ buf_im_V_we0 sc_out sc_logic 1 signal 2 } 
	{ buf_im_V_d0 sc_out sc_lv 40 signal 2 } 
	{ buf_im_V_q0 sc_in sc_lv 40 signal 2 } 
	{ trunc_ln10 sc_in sc_lv 10 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_lshr_f6_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_lshr_f6_cast", "role": "default" }} , 
 	{ "name": "buf_re_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_re_V", "role": "address0" }} , 
 	{ "name": "buf_re_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_re_V", "role": "ce0" }} , 
 	{ "name": "buf_re_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_re_V", "role": "we0" }} , 
 	{ "name": "buf_re_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_re_V", "role": "d0" }} , 
 	{ "name": "buf_re_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_re_V", "role": "q0" }} , 
 	{ "name": "buf_im_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_im_V", "role": "address0" }} , 
 	{ "name": "buf_im_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_im_V", "role": "ce0" }} , 
 	{ "name": "buf_im_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_im_V", "role": "we0" }} , 
 	{ "name": "buf_im_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_im_V", "role": "d0" }} , 
 	{ "name": "buf_im_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_im_V", "role": "q0" }} , 
 	{ "name": "trunc_ln10", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "trunc_ln10", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "EQ_Pipeline_VITIS_LOOP_98_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2046",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_lshr_f6_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "buf_re_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "buf_im_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "trunc_ln10", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_98_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	EQ_Pipeline_VITIS_LOOP_98_1 {
		p_lshr_f6_cast {Type I LastRead 0 FirstWrite -1}
		buf_re_V {Type IO LastRead 3 FirstWrite 1}
		buf_im_V {Type IO LastRead 3 FirstWrite 1}
		trunc_ln10 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2046"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2046"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_lshr_f6_cast { ap_none {  { p_lshr_f6_cast in_data 0 10 } } }
	buf_re_V { ap_memory {  { buf_re_V_address0 mem_address 1 10 }  { buf_re_V_ce0 mem_ce 1 1 }  { buf_re_V_we0 mem_we 1 1 }  { buf_re_V_d0 mem_din 1 40 }  { buf_re_V_q0 in_data 0 40 } } }
	buf_im_V { ap_memory {  { buf_im_V_address0 mem_address 1 10 }  { buf_im_V_ce0 mem_ce 1 1 }  { buf_im_V_we0 mem_we 1 1 }  { buf_im_V_d0 mem_din 1 40 }  { buf_im_V_q0 in_data 0 40 } } }
	trunc_ln10 { ap_none {  { trunc_ln10 in_data 0 10 } } }
}
