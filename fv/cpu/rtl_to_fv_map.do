tclmode

# Generated by Genus(TM) Synthesis Solution 17.22-s017_1, revision 1.272a
# Generated on: Mon Jan 02 14:54:23 IST 2023 (Mon Jan 02 09:24:23 GMT 2023)

set lec_version [regsub {(-).} $env(LEC_VERSION) ""]

tcl_set_command_name_echo on

set_log_file fv/cpu/rtl_to_fv_map.log -replace

usage -auto -elapse

set_verification_information rtl_fv_map_db

read_implementation_information fv/cpu -revised fv_map

set_parallel_option -threads 4 -license "xl lp gxl lpgxl eco ecogxl" -norelease_license

set env(RC_VERSION)     "17.22-s017_1"
set env(CDN_SYNTH_ROOT) "/cad/install/GENUS172/tools.lnx86"
set CDN_SYNTH_ROOT      "/cad/install/GENUS172/tools.lnx86"
set env(CW_DIR) "/cad/install/GENUS172/tools.lnx86/lib/chipware"
set CW_DIR      "/cad/install/GENUS172/tools.lnx86/lib/chipware"

# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both

add_search_path /home/vlsi6/pdk/scl_pdk/stdlib/fs120/liberty/lib_flow_ss -library -both
read_library -liberty -both   /home/vlsi6/pdk/scl_pdk/stdlib/fs120/liberty/lib_flow_ss/tsl18fs120_scl_ss.lib

set_undriven_signal Z -golden
set_naming_style rc -golden
set_naming_rule "%s\[%d\]" -instance_array -golden
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable -golden

# Align LEC's treatment of mismatched port widths with constant
# connections with Genus's. Genus message CDFG-467 and LEC message
# HRC3.6 may indicate the presence of this issue. This option is
# only available with LEC 17.20-d301 or later.
set lec_version_required "17.20301"
if {$lec_version >= $lec_version_required} {
    set_hdl_options -const_port_extend
}
set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"

delete_search_path -all -design -golden
add_search_path /home/vlsi6/cpu -design -golden
read_design   -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -verilog2k /home/vlsi6/cpu/cpu.v /home/vlsi6/cpu/ALU.v
elaborate_design -golden -root {cpu} -rootonly 

read_design -verilog95   -revised -lastmod -noelab fv/cpu/fv_map.v.gz
elaborate_design -revised -root {cpu}

uniquify -all -nolib -golden

report_design_data
report_black_box

set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
set_flatten_model -hier_seq_merge

#add_name_alias fv/cpu/fv_map.singlebit.original_name.alias.json.gz -revised
#set_mapping_method -alias -revised
#add_renaming_rule r1alias _reg((\\\[%w\\\])*(/U\\\$%d)*)$ @1 -type dff -both

set_analyze_option -auto

set_system_mode lec
analyze_datapath -module -verbose 
analyze_datapath -share  -verbose
report_unmapped_points -summary
report_unmapped_points -extra -unreachable -notmapped
add_compared_points -all
compare

report_compare_data -class nonequivalent -class abort -class notcompared
report_verification -verbose
report_statistics

write_verification_information
report_verification_information

exit

