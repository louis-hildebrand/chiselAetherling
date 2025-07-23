## Integer Multiplier
if { [file isdirectory "$IP"] } {
    # if the IP files exist, we already generated the IP, so we can just
    # read the ip definition (.xci)
    read_ip [glob "$IP/*/*.xci"]
} else {
    file mkdir $IP
    create_project -in_memory 

    # Spatial IPs

    ## Integer Divider
    create_ip -name div_gen -vendor xilinx.com -library ip -version 5.1 -module_name div_32_32_16_Unsigned_Remainder -dir $IP
    set_property -dict [list CONFIG.latency_configuration {Manual} CONFIG.latency {16} CONFIG.aclken {true}] [get_ips div_32_32_16_Unsigned_Remainder]
    set_property -dict [list CONFIG.dividend_and_quotient_width {32} CONFIG.divisor_width {32} CONFIG.remainder_type {Remainder} CONFIG.clocks_per_division {1} CONFIG.fractional_width {32} CONFIG.operand_sign {Unsigned}] [get_ips div_32_32_16_Unsigned_Remainder]
#    set_property -dict [list CONFIG.ACLK_INTF.FREQ_HZ $CLOCK_FREQ_HZ] [get_ips div_32_32_16_Unsigned_Remainder]
#    set_property generate_synth_checkpoint false [get_files div_32_32_16_Unsigned_Remainder.xci]
#    generate_target {all} [get_ips div_32_32_16_Unsigned_Remainder]
    
    
    
    ## Integer Divider
    create_ip -name div_gen -vendor xilinx.com -library ip -version 5.1 -module_name div_32_32_20_Signed_Fractional -dir $IP
    set_property -dict [list CONFIG.latency_configuration {Manual} CONFIG.latency {20} CONFIG.aclken {true}] [get_ips div_32_32_20_Signed_Fractional]
    set_property -dict [list CONFIG.dividend_and_quotient_width {32} CONFIG.divisor_width {32} CONFIG.remainder_type {Fractional} CONFIG.clocks_per_division {1} CONFIG.fractional_width {2} CONFIG.operand_sign {Signed}] [get_ips div_32_32_20_Signed_Fractional]
#    set_property -dict [list CONFIG.ACLK_INTF.FREQ_HZ $CLOCK_FREQ_HZ] [get_ips div_32_32_20_Signed_Fractional]
#    set_property generate_synth_checkpoint false [get_files div_32_32_20_Signed_Fractional.xci]
#    generate_target {all} [get_ips div_32_32_20_Signed_Fractional]
    
    
    
    ## Integer Multiplier
    create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name mul_32_32_32_6_Unsigned_Use_Mults -dir $IP
    set_property -dict [list CONFIG.MultType {Parallel_Multiplier} CONFIG.PortAType {Unsigned}  CONFIG.PortAWidth {32} CONFIG.PortBType {Unsigned} CONFIG.PortBWidth {32} CONFIG.Multiplier_Construction {Use_Mults} CONFIG.OptGoal {Speed} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {32} CONFIG.PipeStages {6} CONFIG.ClockEnable {true}] [get_ips mul_32_32_32_6_Unsigned_Use_Mults]

    create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name mul_39_39_39_6_Unsigned_Use_Mults -dir $IP
    set_property -dict [list CONFIG.MultType {Parallel_Multiplier} CONFIG.PortAType {Unsigned}  CONFIG.PortAWidth {39} CONFIG.PortBType {Unsigned} CONFIG.PortBWidth {39} CONFIG.Multiplier_Construction {Use_Mults} CONFIG.OptGoal {Speed} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {39} CONFIG.PipeStages {6} CONFIG.ClockEnable {true}] [get_ips mul_39_39_39_6_Unsigned_Use_Mults]
#    set_property -dict [list CONFIG.clk_intf.FREQ_HZ $CLOCK_FREQ_HZ] [get_ips mul_39_39_39_6_Unsigned_Use_Mults]
#    set_property generate_synth_checkpoint false [get_files mul_39_39_39_6_Unsigned_Use_Mults.xci]
#    generate_target {all} [get_ips mul_39_39_39_6_Unsigned_Use_Mults]


    set moduleName mul_uint8
    set bitWidth 8
    set outHighBit 15
    set pipeStages 3
    create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name $moduleName -dir $IP
    set_property -dict [list CONFIG.PortAType {Unsigned} CONFIG.PortAWidth "$bitWidth" CONFIG.PortBType {Unsigned} CONFIG.PortBWidth "$bitWidth" CONFIG.Multiplier_Construction {Use_Mults}  CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh "$outHighBit" CONFIG.PipeStages "$pipeStages" CONFIG.ClockEnable {false}] [get_ips $moduleName] 
    
    set moduleName mul_int8
    create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name $moduleName -dir $IP
    set_property -dict [list CONFIG.PortAWidth "$bitWidth" CONFIG.PortBWidth "$bitWidth" CONFIG.Multiplier_Construction {Use_Mults}  CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh "$outHighBit" CONFIG.PipeStages "$pipeStages" CONFIG.ClockEnable {false}] [get_ips $moduleName] 



    set moduleName mul_uint16
    set bitWidth 16
    set pipeStages 3
    set outHighBit 31
    create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name $moduleName -dir $IP
    set_property -dict [list CONFIG.PortAType {Unsigned} CONFIG.PortAWidth "$bitWidth" CONFIG.PortBType {Unsigned} CONFIG.PortBWidth "$bitWidth" CONFIG.Multiplier_Construction {Use_Mults}  CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh "$outHighBit" CONFIG.PipeStages "$pipeStages" CONFIG.ClockEnable {false}] [get_ips $moduleName] 

    set moduleName mul_int16
    create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name $moduleName -dir $IP
    set_property -dict [list CONFIG.PortAWidth "$bitWidth" CONFIG.PortBWidth "$bitWidth" CONFIG.Multiplier_Construction {Use_Mults}  CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh "$outHighBit" CONFIG.PipeStages "$pipeStages" CONFIG.ClockEnable {false}] [get_ips $moduleName] 



    set moduleName mul_uint32
    set bitWidth 32
    set pipeStages 6
    set outHighBit 63
    create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name $moduleName -dir $IP
    set_property -dict [list CONFIG.PortAType {Unsigned} CONFIG.PortAWidth "$bitWidth" CONFIG.PortBType {Unsigned} CONFIG.PortBWidth "$bitWidth" CONFIG.Multiplier_Construction {Use_Mults}  CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh "$outHighBit" CONFIG.PipeStages "$pipeStages" CONFIG.ClockEnable {false}] [get_ips $moduleName] 

    set moduleName mul_int32
    create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name $moduleName -dir $IP
    set_property -dict [list CONFIG.PortAWidth "$bitWidth" CONFIG.PortBWidth "$bitWidth" CONFIG.Multiplier_Construction {Use_Mults}  CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh "$outHighBit" CONFIG.PipeStages "$pipeStages" CONFIG.ClockEnable {false}] [get_ips $moduleName] 

    generate_target {all} [get_ips]

    synth_ip [get_ips]
}
