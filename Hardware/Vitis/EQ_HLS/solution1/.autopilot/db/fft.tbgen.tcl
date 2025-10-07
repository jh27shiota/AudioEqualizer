set moduleName fft
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {fft}
set C_modelType { void 0 }
set C_modelArgList {
	{ buf_re int 40 regular {array 1024 { 2 1 } 1 1 }  }
	{ buf_im int 40 regular {array 1024 { 2 1 } 1 1 }  }
	{ fft_size int 11 regular  }
	{ inverse_offset uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "buf_re", "interface" : "memory", "bitwidth" : 40, "direction" : "READWRITE"} , 
 	{ "Name" : "buf_im", "interface" : "memory", "bitwidth" : 40, "direction" : "READWRITE"} , 
 	{ "Name" : "fft_size", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "inverse_offset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ buf_re_address0 sc_out sc_lv 10 signal 0 } 
	{ buf_re_ce0 sc_out sc_logic 1 signal 0 } 
	{ buf_re_we0 sc_out sc_logic 1 signal 0 } 
	{ buf_re_d0 sc_out sc_lv 40 signal 0 } 
	{ buf_re_q0 sc_in sc_lv 40 signal 0 } 
	{ buf_re_address1 sc_out sc_lv 10 signal 0 } 
	{ buf_re_ce1 sc_out sc_logic 1 signal 0 } 
	{ buf_re_q1 sc_in sc_lv 40 signal 0 } 
	{ buf_im_address0 sc_out sc_lv 10 signal 1 } 
	{ buf_im_ce0 sc_out sc_logic 1 signal 1 } 
	{ buf_im_we0 sc_out sc_logic 1 signal 1 } 
	{ buf_im_d0 sc_out sc_lv 40 signal 1 } 
	{ buf_im_q0 sc_in sc_lv 40 signal 1 } 
	{ buf_im_address1 sc_out sc_lv 10 signal 1 } 
	{ buf_im_ce1 sc_out sc_logic 1 signal 1 } 
	{ buf_im_q1 sc_in sc_lv 40 signal 1 } 
	{ fft_size sc_in sc_lv 11 signal 2 } 
	{ inverse_offset sc_in sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "buf_re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_re", "role": "address0" }} , 
 	{ "name": "buf_re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_re", "role": "ce0" }} , 
 	{ "name": "buf_re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_re", "role": "we0" }} , 
 	{ "name": "buf_re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_re", "role": "d0" }} , 
 	{ "name": "buf_re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_re", "role": "q0" }} , 
 	{ "name": "buf_re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_re", "role": "address1" }} , 
 	{ "name": "buf_re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_re", "role": "ce1" }} , 
 	{ "name": "buf_re_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_re", "role": "q1" }} , 
 	{ "name": "buf_im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_im", "role": "address0" }} , 
 	{ "name": "buf_im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_im", "role": "ce0" }} , 
 	{ "name": "buf_im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_im", "role": "we0" }} , 
 	{ "name": "buf_im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_im", "role": "d0" }} , 
 	{ "name": "buf_im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_im", "role": "q0" }} , 
 	{ "name": "buf_im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "buf_im", "role": "address1" }} , 
 	{ "name": "buf_im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_im", "role": "ce1" }} , 
 	{ "name": "buf_im_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "buf_im", "role": "q1" }} , 
 	{ "name": "fft_size", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "fft_size", "role": "default" }} , 
 	{ "name": "inverse_offset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inverse_offset", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "45", "47", "49", "53", "54", "55", "56"],
		"CDFG" : "fft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buf_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "49", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_90_6_fu_287", "Port" : "buf_re", "Inst_start_state" : "9", "Inst_end_state" : "18"}]},
			{"Name" : "buf_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "49", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_90_6_fu_287", "Port" : "buf_im", "Inst_start_state" : "9", "Inst_end_state" : "18"}]},
			{"Name" : "fft_size", "Type" : "None", "Direction" : "I"},
			{"Name" : "inverse_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_init_twiddle_fu_248", "Port" : "ref_4oPi_table_256_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "fourth_order_double_sin_cos_K0_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_init_twiddle_fu_248", "Port" : "fourth_order_double_sin_cos_K0_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "fourth_order_double_sin_cos_K1_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_init_twiddle_fu_248", "Port" : "fourth_order_double_sin_cos_K1_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "fourth_order_double_sin_cos_K2_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_init_twiddle_fu_248", "Port" : "fourth_order_double_sin_cos_K2_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "fourth_order_double_sin_cos_K3_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_init_twiddle_fu_248", "Port" : "fourth_order_double_sin_cos_K3_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "fourth_order_double_sin_cos_K4_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_init_twiddle_fu_248", "Port" : "fourth_order_double_sin_cos_K4_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "twiddle_re_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_init_twiddle_fu_248", "Port" : "twiddle_re_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "twiddle_im_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_init_twiddle_fu_248", "Port" : "twiddle_im_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_53_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "18", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state9"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_68_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "18", "FirstState" : "ap_ST_fsm_state11", "LastState" : ["ap_ST_fsm_state17"], "QuitState" : ["ap_ST_fsm_state11"], "PreState" : ["ap_ST_fsm_state10"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_66_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "18", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state9"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_63_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "18", "FirstState" : "ap_ST_fsm_state9", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state9"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state18"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.twiddle_re_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.twiddle_im_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248", "Parent" : "0", "Child" : ["4", "23", "42", "43", "44"],
		"CDFG" : "init_twiddle",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "626",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "fft_size", "Type" : "None", "Direction" : "I"},
			{"Name" : "inverse", "Type" : "None", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_sin_or_cos_double_s_fu_153", "Port" : "ref_4oPi_table_256_V", "Inst_start_state" : "79", "Inst_end_state" : "111"},
					{"ID" : "4", "SubInstance" : "grp_sin_or_cos_double_s_fu_134", "Port" : "ref_4oPi_table_256_V", "Inst_start_state" : "79", "Inst_end_state" : "111"}]},
			{"Name" : "fourth_order_double_sin_cos_K0_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_sin_or_cos_double_s_fu_153", "Port" : "fourth_order_double_sin_cos_K0_V", "Inst_start_state" : "79", "Inst_end_state" : "111"},
					{"ID" : "4", "SubInstance" : "grp_sin_or_cos_double_s_fu_134", "Port" : "fourth_order_double_sin_cos_K0_V", "Inst_start_state" : "79", "Inst_end_state" : "111"}]},
			{"Name" : "fourth_order_double_sin_cos_K1_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_sin_or_cos_double_s_fu_153", "Port" : "fourth_order_double_sin_cos_K1_V", "Inst_start_state" : "79", "Inst_end_state" : "111"},
					{"ID" : "4", "SubInstance" : "grp_sin_or_cos_double_s_fu_134", "Port" : "fourth_order_double_sin_cos_K1_V", "Inst_start_state" : "79", "Inst_end_state" : "111"}]},
			{"Name" : "fourth_order_double_sin_cos_K2_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_sin_or_cos_double_s_fu_153", "Port" : "fourth_order_double_sin_cos_K2_V", "Inst_start_state" : "79", "Inst_end_state" : "111"},
					{"ID" : "4", "SubInstance" : "grp_sin_or_cos_double_s_fu_134", "Port" : "fourth_order_double_sin_cos_K2_V", "Inst_start_state" : "79", "Inst_end_state" : "111"}]},
			{"Name" : "fourth_order_double_sin_cos_K3_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_sin_or_cos_double_s_fu_153", "Port" : "fourth_order_double_sin_cos_K3_V", "Inst_start_state" : "79", "Inst_end_state" : "111"},
					{"ID" : "4", "SubInstance" : "grp_sin_or_cos_double_s_fu_134", "Port" : "fourth_order_double_sin_cos_K3_V", "Inst_start_state" : "79", "Inst_end_state" : "111"}]},
			{"Name" : "fourth_order_double_sin_cos_K4_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_sin_or_cos_double_s_fu_153", "Port" : "fourth_order_double_sin_cos_K4_V", "Inst_start_state" : "79", "Inst_end_state" : "111"},
					{"ID" : "4", "SubInstance" : "grp_sin_or_cos_double_s_fu_134", "Port" : "fourth_order_double_sin_cos_K4_V", "Inst_start_state" : "79", "Inst_end_state" : "111"}]},
			{"Name" : "twiddle_re_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "twiddle_im_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_27_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter108", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state6"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter108", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state116"]}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134", "Parent" : "3", "Child" : ["5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"],
		"CDFG" : "sin_or_cos_double_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "32", "EstimateLatencyMin" : "32", "EstimateLatencyMax" : "32",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "t_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "do_cos", "Type" : "None", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K0_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K1_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K2_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K3_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K4_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.ref_4oPi_table_256_V_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.fourth_order_double_sin_cos_K0_V_U", "Parent" : "4"},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.fourth_order_double_sin_cos_K1_V_U", "Parent" : "4"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.fourth_order_double_sin_cos_K2_V_U", "Parent" : "4"},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.fourth_order_double_sin_cos_K3_V_U", "Parent" : "4"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.fourth_order_double_sin_cos_K4_V_U", "Parent" : "4"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_170s_53ns_170_5_1_U11", "Parent" : "4"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mux_83_1_1_1_U12", "Parent" : "4"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mux_164_1_1_1_U13", "Parent" : "4"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mux_164_1_1_1_U14", "Parent" : "4"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_49ns_49ns_98_5_1_U15", "Parent" : "4"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_49ns_49ns_98_5_1_U16", "Parent" : "4"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_49ns_49ns_98_5_1_U17", "Parent" : "4"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_56ns_52s_108_5_1_U18", "Parent" : "4"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_49ns_44s_93_5_1_U19", "Parent" : "4"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_42ns_33ns_75_2_1_U20", "Parent" : "4"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_35ns_25ns_60_2_1_U21", "Parent" : "4"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_134.mul_64s_63ns_126_5_1_U22", "Parent" : "4"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153", "Parent" : "3", "Child" : ["24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41"],
		"CDFG" : "sin_or_cos_double_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "32", "EstimateLatencyMin" : "32", "EstimateLatencyMax" : "32",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "t_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "do_cos", "Type" : "None", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K0_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K1_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K2_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K3_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K4_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.ref_4oPi_table_256_V_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.fourth_order_double_sin_cos_K0_V_U", "Parent" : "23"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.fourth_order_double_sin_cos_K1_V_U", "Parent" : "23"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.fourth_order_double_sin_cos_K2_V_U", "Parent" : "23"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.fourth_order_double_sin_cos_K3_V_U", "Parent" : "23"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.fourth_order_double_sin_cos_K4_V_U", "Parent" : "23"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_170s_53ns_170_5_1_U11", "Parent" : "23"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mux_83_1_1_1_U12", "Parent" : "23"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mux_164_1_1_1_U13", "Parent" : "23"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mux_164_1_1_1_U14", "Parent" : "23"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_49ns_49ns_98_5_1_U15", "Parent" : "23"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_49ns_49ns_98_5_1_U16", "Parent" : "23"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_49ns_49ns_98_5_1_U17", "Parent" : "23"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_56ns_52s_108_5_1_U18", "Parent" : "23"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_49ns_44s_93_5_1_U19", "Parent" : "23"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_42ns_33ns_75_2_1_U20", "Parent" : "23"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_35ns_25ns_60_2_1_U21", "Parent" : "23"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.grp_sin_or_cos_double_s_fu_153.mul_64s_63ns_126_5_1_U22", "Parent" : "23"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.dmul_64ns_64ns_64_7_max_dsp_1_U41", "Parent" : "3"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.ddiv_64ns_64ns_64_59_no_dsp_1_U42", "Parent" : "3"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_init_twiddle_fu_248.sitodp_32ns_64_6_no_dsp_1_U43", "Parent" : "3"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_50_1_fu_272", "Parent" : "0", "Child" : ["46"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_50_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "fft_size", "Type" : "None", "Direction" : "I"},
			{"Name" : "logN_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "logN_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_50_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_50_1_fu_272.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_38_1_fu_280", "Parent" : "0", "Child" : ["48"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_38_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "logN_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "i_4_cast_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "n_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_38_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_38_1_fu_280.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_90_6_fu_287", "Parent" : "0", "Child" : ["50", "51", "52"],
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
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_90_6_fu_287.sdiv_40ns_12ns_40_44_1_U57", "Parent" : "49"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_90_6_fu_287.sdiv_40ns_12ns_40_44_1_U58", "Parent" : "49"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_90_6_fu_287.flow_control_loop_pipe_sequential_init_U", "Parent" : "49"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_40s_24s_62_2_1_U64", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_40s_24s_62_2_1_U65", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_40s_24s_62_2_1_U66", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_40s_24s_62_2_1_U67", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft {
		buf_re {Type IO LastRead 9 FirstWrite 6}
		buf_im {Type IO LastRead 9 FirstWrite 6}
		fft_size {Type I LastRead 0 FirstWrite -1}
		inverse_offset {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4_V {Type I LastRead -1 FirstWrite -1}
		twiddle_re_V {Type IO LastRead -1 FirstWrite -1}
		twiddle_im_V {Type IO LastRead -1 FirstWrite -1}}
	init_twiddle {
		fft_size {Type I LastRead 0 FirstWrite -1}
		inverse {Type I LastRead 5 FirstWrite -1}
		ref_4oPi_table_256_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4_V {Type I LastRead -1 FirstWrite -1}
		twiddle_re_V {Type O LastRead -1 FirstWrite 114}
		twiddle_im_V {Type O LastRead -1 FirstWrite 114}}
	sin_or_cos_double_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		do_cos {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4_V {Type I LastRead -1 FirstWrite -1}}
	sin_or_cos_double_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		do_cos {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3_V {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4_V {Type I LastRead -1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_50_1 {
		fft_size {Type I LastRead 0 FirstWrite -1}
		logN_out {Type O LastRead -1 FirstWrite 1}
		logN_1_out {Type O LastRead -1 FirstWrite 1}}
	fft_Pipeline_VITIS_LOOP_38_1 {
		logN_reload {Type I LastRead 0 FirstWrite -1}
		i_4_cast_cast {Type I LastRead 0 FirstWrite -1}
		n_out {Type O LastRead -1 FirstWrite 1}}
	fft_Pipeline_VITIS_LOOP_90_6 {
		fft_size {Type I LastRead 0 FirstWrite -1}
		buf_re {Type IO LastRead 0 FirstWrite 46}
		conv_i_i_i28 {Type I LastRead 0 FirstWrite -1}
		buf_im {Type IO LastRead 0 FirstWrite 46}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	buf_re { ap_memory {  { buf_re_address0 mem_address 1 10 }  { buf_re_ce0 mem_ce 1 1 }  { buf_re_we0 mem_we 1 1 }  { buf_re_d0 mem_din 1 40 }  { buf_re_q0 in_data 0 40 }  { buf_re_address1 MemPortADDR2 1 10 }  { buf_re_ce1 MemPortCE2 1 1 }  { buf_re_q1 MemPortDOUT2 0 40 } } }
	buf_im { ap_memory {  { buf_im_address0 mem_address 1 10 }  { buf_im_ce0 mem_ce 1 1 }  { buf_im_we0 mem_we 1 1 }  { buf_im_d0 mem_din 1 40 }  { buf_im_q0 in_data 0 40 }  { buf_im_address1 MemPortADDR2 1 10 }  { buf_im_ce1 MemPortCE2 1 1 }  { buf_im_q1 MemPortDOUT2 0 40 } } }
	fft_size { ap_none {  { fft_size in_data 0 11 } } }
	inverse_offset { ap_none {  { inverse_offset in_data 0 1 } } }
}
