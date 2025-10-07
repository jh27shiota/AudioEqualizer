set SynModuleInfo {
  {SRCNAME EQ_Pipeline_VITIS_LOOP_165_1 MODELNAME EQ_Pipeline_VITIS_LOOP_165_1 RTLNAME EQ_EQ_Pipeline_VITIS_LOOP_165_1
    SUBMODULES {
      {MODELNAME EQ_flow_control_loop_pipe_sequential_init RTLNAME EQ_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME EQ_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME sin_or_cos<double> MODELNAME sin_or_cos_double_s RTLNAME EQ_sin_or_cos_double_s
    SUBMODULES {
      {MODELNAME EQ_mul_170s_53ns_170_5_1 RTLNAME EQ_mul_170s_53ns_170_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME EQ_mux_83_1_1_1 RTLNAME EQ_mux_83_1_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME EQ_mux_164_1_1_1 RTLNAME EQ_mux_164_1_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME EQ_mul_49ns_49ns_98_5_1 RTLNAME EQ_mul_49ns_49ns_98_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME EQ_mul_56ns_52s_108_5_1 RTLNAME EQ_mul_56ns_52s_108_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME EQ_mul_49ns_44s_93_5_1 RTLNAME EQ_mul_49ns_44s_93_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME EQ_mul_42ns_33ns_75_2_1 RTLNAME EQ_mul_42ns_33ns_75_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME EQ_mul_35ns_25ns_60_2_1 RTLNAME EQ_mul_35ns_25ns_60_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME EQ_mul_64s_63ns_126_5_1 RTLNAME EQ_mul_64s_63ns_126_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME EQ_sin_or_cos_double_s_ref_4oPi_table_256_V_ROM_AUTO_1R RTLNAME EQ_sin_or_cos_double_s_ref_4oPi_table_256_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K0_V_ROM_1P_LUTRAM_1R RTLNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K0_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K1_V_ROM_1P_LUTRAM_1R RTLNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K1_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K2_V_ROM_1P_LUTRAM_1R RTLNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K2_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K3_V_ROM_1P_LUTRAM_1R RTLNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K3_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R RTLNAME EQ_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME init_twiddle MODELNAME init_twiddle RTLNAME EQ_init_twiddle
    SUBMODULES {
      {MODELNAME EQ_dmul_64ns_64ns_64_7_max_dsp_1 RTLNAME EQ_dmul_64ns_64ns_64_7_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME EQ_ddiv_64ns_64ns_64_59_no_dsp_1 RTLNAME EQ_ddiv_64ns_64ns_64_59_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 58 ALLOW_PRAGMA 1}
      {MODELNAME EQ_sitodp_32ns_64_6_no_dsp_1 RTLNAME EQ_sitodp_32ns_64_6_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_Pipeline_VITIS_LOOP_50_1 MODELNAME fft_Pipeline_VITIS_LOOP_50_1 RTLNAME EQ_fft_Pipeline_VITIS_LOOP_50_1}
  {SRCNAME fft_Pipeline_VITIS_LOOP_38_1 MODELNAME fft_Pipeline_VITIS_LOOP_38_1 RTLNAME EQ_fft_Pipeline_VITIS_LOOP_38_1}
  {SRCNAME fft_Pipeline_VITIS_LOOP_90_6 MODELNAME fft_Pipeline_VITIS_LOOP_90_6 RTLNAME EQ_fft_Pipeline_VITIS_LOOP_90_6
    SUBMODULES {
      {MODELNAME EQ_sdiv_40ns_12ns_40_44_1 RTLNAME EQ_sdiv_40ns_12ns_40_44_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 43 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft MODELNAME fft RTLNAME EQ_fft
    SUBMODULES {
      {MODELNAME EQ_mul_40s_24s_62_2_1 RTLNAME EQ_mul_40s_24s_62_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME EQ_fft_twiddle_re_V_RAM_AUTO_1R1W RTLNAME EQ_fft_twiddle_re_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME EQ_Pipeline_VITIS_LOOP_98_1 MODELNAME EQ_Pipeline_VITIS_LOOP_98_1 RTLNAME EQ_EQ_Pipeline_VITIS_LOOP_98_1}
  {SRCNAME EQ_Pipeline_VITIS_LOOP_187_2 MODELNAME EQ_Pipeline_VITIS_LOOP_187_2 RTLNAME EQ_EQ_Pipeline_VITIS_LOOP_187_2}
  {SRCNAME EQ MODELNAME EQ RTLNAME EQ IS_TOP 1
    SUBMODULES {
      {MODELNAME EQ_buf_re_V_RAM_AUTO_1R1W RTLNAME EQ_buf_re_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME EQ_CTRL_s_axi RTLNAME EQ_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME EQ_regslice_both RTLNAME EQ_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME EQ_regslice_both_U}
    }
  }
}
