set moduleName fft_Pipeline_VITIS_LOOP_90_6
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
set C_modelName {fft_Pipeline_VITIS_LOOP_90_6}
set C_modelType { void 0 }
set C_modelArgList {
	{ fft_size int 11 regular  }
	{ buf_re int 40 regular {array 1024 { 0 1 } 1 1 }  }
	{ conv_i_i_i28 int 11 regular  }
	{ buf_im int 40 regular {array 1024 { 0 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "fft_size", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "buf_re", "interface" : "memory", "bitwidth" : 40, "direction" : "READWRITE"} , 
 	{ "Name" : "conv_i_i_i28", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "buf_im", "interface" : "memory", "bitwidth" : 40, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fft_size sc_in sc_lv 11 signal 0 } 
	{ buf_re_address0 sc_out sc_lv 10 signal 1 } 
	{ buf_re_ce0 sc_out sc_logic 1 signal 1 } 
	{ buf_re_we0 sc_out sc_logic 1 signal 1 } 
	{ buf_re_d0 sc_out sc_lv 40 signal 1 } 
	{ buf_re_address1 sc_out sc_lv 10 signal 1 } 
	{ buf_re_ce1 sc_out sc_logic 1 signal 1 } 
	{ buf_re_q1 sc_in sc_lv 40 signal 1 } 
	{ conv_i_i_i28 sc_in sc_lv 11 signal 2 } 
	{ buf_im_address0 sc_out sc_lv 10 signal 3 } 
	{ buf_im_ce0 sc_out sc_logic 1 signal 3 } 
	{ buf_im_we0 sc_out sc_logic 1 signal 3 } 
	{ buf_im_d0 sc_out sc_lv 40 signal 3 } 
	{ buf_im_address1 sc_out sc_lv 10 signal 3 } 
	{ buf_im_ce1 sc_out sc_logic 1 signal 3 } 
	{ buf_im_q1 sc_in sc_lv 40 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "fft_size", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "fft_size", "role": "default" }} , 
 	{ "name": "buf_re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_re", "role": "address0" }} , 
 	{ "name": "buf_re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_re", "role": "ce0" }} , 
 	{ "name": "buf_re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_re", "role": "we0" }} , 
 	{ "name": "buf_re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_re", "role": "d0" }} , 
 	{ "name": "buf_re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_re", "role": "address1" }} , 
 	{ "name": "buf_re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_re", "role": "ce1" }} , 
 	{ "name": "buf_re_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_re", "role": "q1" }} , 
 	{ "name": "conv_i_i_i28", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "conv_i_i_i28", "role": "default" }} , 
 	{ "name": "buf_im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_im", "role": "address0" }} , 
 	{ "name": "buf_im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_im", "role": "ce0" }} , 
 	{ "name": "buf_im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_im", "role": "we0" }} , 
 	{ "name": "buf_im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_im", "role": "d0" }} , 
 	{ "name": "buf_im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_im", "role": "address1" }} , 
 	{ "name": "buf_im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_im", "role": "ce1" }} , 
 	{ "name": "buf_im_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_im", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_90_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1071",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "fft_size", "Type" : "None", "Direction" : "I"},
			{"Name" : "buf_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "conv_i_i_i28", "Type" : "None", "Direction" : "I"},
			{"Name" : "buf_im", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_90_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter46", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter46", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_40ns_12ns_40_44_1_U57", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_40ns_12ns_40_44_1_U58", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_Pipeline_VITIS_LOOP_90_6 {
		fft_size {Type I LastRead 0 FirstWrite -1}
		buf_re {Type IO LastRead 0 FirstWrite 46}
		conv_i_i_i28 {Type I LastRead 0 FirstWrite -1}
		buf_im {Type IO LastRead 0 FirstWrite 46}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "1071"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "1071"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	fft_size { ap_none {  { fft_size in_data 0 11 } } }
	buf_re { ap_memory {  { buf_re_address0 mem_address 1 10 }  { buf_re_ce0 mem_ce 1 1 }  { buf_re_we0 mem_we 1 1 }  { buf_re_d0 mem_din 1 40 }  { buf_re_address1 MemPortADDR2 1 10 }  { buf_re_ce1 MemPortCE2 1 1 }  { buf_re_q1 MemPortDOUT2 0 40 } } }
	conv_i_i_i28 { ap_none {  { conv_i_i_i28 in_data 0 11 } } }
	buf_im { ap_memory {  { buf_im_address0 mem_address 1 10 }  { buf_im_ce0 mem_ce 1 1 }  { buf_im_we0 mem_we 1 1 }  { buf_im_d0 mem_din 1 40 }  { buf_im_address1 MemPortADDR2 1 10 }  { buf_im_ce1 MemPortCE2 1 1 }  { buf_im_q1 MemPortDOUT2 0 40 } } }
}
