set_attribute init_lib_search_path /home/vlsi6/pdk/scl_pdk/stdlib/fs120/liberty/lib_flow_ss
set_attribute library tsl18fs120_scl_ss.lib

set_attribute init_hdl_search_path /home/vlsi6/cpu
read_hdl cpu.v

set_attribute information_level 6 

set myFiles [list cpu.v ALU.v Memory.v. opcodes.v]   		;# All your HDL files
set basename cpu   			;# name of top level module
set myClk clk                  		;# clock name
set myPeriod_ps 20000            	;# Clock period in ps
set myInDelay_ns 1           		;# delay from clock to inputs valid
set myOutDelay_ns 1          		;# delay from clock to output valid
set runname synth_report             	;# name appended to output files

# Analyze and Elaborate the HDL files
read_hdl ${myFiles}
elaborate ${basename}

# Apply Constraints and generate clocks
set clock [define_clock -period ${myPeriod_ps} -name ${myClk} [clock_ports]]	
external_delay -input $myInDelay_ns -clock ${myClk} [find / -port ports_in/*]
external_delay -output $myOutDelay_ns -clock ${myClk} [find / -port ports_out/*]

# Sets transition to default values for Synopsys SDC format, 
# fall/rise 400ps
dc::set_clock_transition .4 $myClk

# check that the design is OK so far
check_design -unresolved
report timing -lint

# Synthesize the design to the target library
set_attribute syn_generic_effort medium
syn_generic
set_attribute syn_map_effort medium
syn_map
set_attribute syn_opt_effort medium
syn_opt


# Write out the reports
report timing > cpu_timing.rep
report gates  > cpu_cell.rep
report power  > cpu_power.rep


# Write out the structural Verilog and sdc files
write_hdl -mapped >  cpu_netlist.v
write_sdc >  cpu.sdc

