
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set sample_rate__return_group [add_wave_group sample_rate__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_EQ_top/AESL_inst_EQ/interrupt -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_BRESP -into $sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_BREADY -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_BVALID -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_RRESP -into $sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_RDATA -into $sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_RREADY -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_RVALID -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_ARREADY -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_ARVALID -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_ARADDR -into $sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_WSTRB -into $sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_WDATA -into $sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_WREADY -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_WVALID -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_AWREADY -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_AWVALID -into $sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/s_axi_CTRL_AWADDR -into $sample_rate__return_group -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $coutputgroup]
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TDEST -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TID -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TLAST -into $return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TUSER -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TSTRB -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TKEEP -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/out_stream_TDATA -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $cinputgroup]
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TDEST -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TID -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TLAST -into $return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TUSER -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TSTRB -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TKEEP -into $return_group -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/AESL_inst_EQ/in_stream_TDATA -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake(internal)" -into $designtopgroup]
add_wave /apatb_EQ_top/AESL_inst_EQ/ap_done -into $blocksiggroup
add_wave /apatb_EQ_top/AESL_inst_EQ/ap_idle -into $blocksiggroup
add_wave /apatb_EQ_top/AESL_inst_EQ/ap_ready -into $blocksiggroup
add_wave /apatb_EQ_top/AESL_inst_EQ/ap_start -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_EQ_top/AESL_inst_EQ/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_EQ_top/AESL_inst_EQ/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_EQ_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_EQ_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_EQ_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_EQ_top/LENGTH_in_stream_V_data_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_in_stream_V_keep_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_in_stream_V_strb_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_in_stream_V_user_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_in_stream_V_last_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_in_stream_V_id_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_in_stream_V_dest_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_out_stream_V_data_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_out_stream_V_keep_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_out_stream_V_strb_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_out_stream_V_user_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_out_stream_V_last_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_out_stream_V_id_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_out_stream_V_dest_V -into $tb_portdepth_group -radix hex
add_wave /apatb_EQ_top/LENGTH_sample_rate -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_sample_rate__return_group [add_wave_group sample_rate__return(axi_slave) -into $tbcinoutgroup]
add_wave /apatb_EQ_top/CTRL_INTERRUPT -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_BRESP -into $tb_sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/CTRL_BREADY -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_BVALID -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_RRESP -into $tb_sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/CTRL_RDATA -into $tb_sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/CTRL_RREADY -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_RVALID -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_ARREADY -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_ARVALID -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_ARADDR -into $tb_sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/CTRL_WSTRB -into $tb_sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/CTRL_WDATA -into $tb_sample_rate__return_group -radix hex
add_wave /apatb_EQ_top/CTRL_WREADY -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_WVALID -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_AWREADY -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_AWVALID -into $tb_sample_rate__return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/CTRL_AWADDR -into $tb_sample_rate__return_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcoutputgroup]
add_wave /apatb_EQ_top/out_stream_TDEST -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/out_stream_TID -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/out_stream_TLAST -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/out_stream_TUSER -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/out_stream_TSTRB -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/out_stream_TKEEP -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/out_stream_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/out_stream_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/out_stream_TDATA -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcinputgroup]
add_wave /apatb_EQ_top/in_stream_TDEST -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/in_stream_TID -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/in_stream_TLAST -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/in_stream_TUSER -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/in_stream_TSTRB -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/in_stream_TKEEP -into $tb_return_group -radix hex
add_wave /apatb_EQ_top/in_stream_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/in_stream_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_EQ_top/in_stream_TDATA -into $tb_return_group -radix hex
save_wave_config EQ.wcfg
run all
quit

