#lnnovus  Command  Logging  File

 

set_global   _enable_mmmc_by_default_flow  $CTE: :mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name  Physical
win
 

#Floorplan and fillers
init_design
floorPlan -site CoreSite -noSnapToGrid -d  1950 1950 20 20 20 20
addIoFiller -cell pfeed10000 -prefix FILLER -side n	
addIoFiller -cell pfeed10000 -prefix FILLER -side e
addIoFiller -cell pfeed10000 -prefix FILLER -side w
addIoFiller -cell pfeed10000 -prefix FILLER -side s 
windowSelect 396.970 1125.573 315.936 1362.351
fit

#Core & I/O power supply
globalNetConnect VDD -type pgpin -pin VDD -override -verbose -netlistOverride
globalNetConnect VSS -type pgpin -pin VSS -override -verbose -netlistOverride
globalNetConnect VDDO -type pgpin -pin VDDO -override -verbose -netlistOverride 
globalNetConnect VSSO -type pgpin -pin VSSO -override -verbose -netlistOverride
 
#Power planning 
addRing -skip_via_on_wire_shape Noshape -exclude_selected 1 -skip_via_on_pin Standardcell -center 1 -stacked_via_top_layer TOP_M -type core_rings -jog_distance 0.56 -threshold 0.56 -nets {VDD VSS} -follow core -stacked_via_bottom_layer M1 -layer {bottom M3 top M3 right TOP_M left TOP_M} -width 6 -spacing 2 -offset 2
 
sroute -connect {blockPin corePin padPin padRing floatingStripe secondaryPowerPin} -layerChangeRange {M1 TOP_M} -blockPinTarget {nearestTarget} -padPinPortConnect {allPort oneGeom} -padPinTarget {nearestTarget} -corePinTarget {firstAfterRowEnd} -floatingStripeTarget {blockring ring stripe padring ringpin blockpin followpin} -allowjogging 1 -crossoverViaLayerRange {M1 TOP_M} -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -targetViaLayerRange {M1 TOP_M}


fit
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit TOP_M -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M3 -set_to_set_distance 40 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit TOP_M -spacing 0.46 -xleft_offset 10 -merge_stripes_value 0.56 -layer TOP_M -block_ring_bottom_layer_limit M3 -width 2 -nets {VDD VSS} -stacked_via_bottom_layer M1

#Placement
setPlaceMode -fp false
placeDesign -noPrePlaceOpt


### Setting for preCTS......
setDelayCalMode -siAware false
timeDesign -preCTS 
report_timing 
optDesign -preCTS 

### Clock Tree Synthesis.........
create_ccopt_clock_tree_spec
ccopt_design
#or 
#clockDesign -specFile omp.ctstch -outDir clk_report
#displayClockTree -clk mCLK -level 1  ----not checked properly

### Post CTS Optimization.....
timeDesign -postCTS
optDesign -postCTS
timeDesign -postCTS

#####nanoroute...........turnoff Fix antenna

setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithSiDriven 1
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true


#Routing
routeDesign -globalDetail
setAnalysisMode -analysisType onChipVariation
timeDesign -postRoute
setAnalysisMode -analysisType onChipVariation -cppr both
setOptMode -fixCap true -fixTran true -fixFanoutload false 
optDesign -postRoute
report_timing 
report_power
report_constraint -all_violators
report_ccopt_skew_groups

#add filler and DRC
addFiller -cell feedth9 -prefix FILLER -doDRC
addFiller -cell feedth3 -prefix FILLER -doDRC
addFiller -cell feedth -prefix FILLER -doDRC

fit

###Verify Geometry
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }

###Verify DRC
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_implant -quiet
get_verify_drc_mode -check_implant_across_rows -quiet
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report test.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}

###Verify Connectivity


saveNetlist omp_post_layout.v

streamOut Top.gds -mapFile /home/vlsi6/pdk/scl_pdk/stdlib/fs120/tech_data/lef/gds2_fe_4l.map -libName DesignLib -merge /home/vlsi6/pdk/scl_pdk/stdlib/fs120/gds/tsl18fs120.gds -uniquifyCellNames -units 1000 -mode ALL





