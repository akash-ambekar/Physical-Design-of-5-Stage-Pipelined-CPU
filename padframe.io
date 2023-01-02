# Edited manually.....// Corner Cells proper placed ....

# Notes
#1. No need to edit CORNER Cells. offset etc are calculated to align in the corners.
#2. IO Cells will be placed in the order given in the corresponding row (USR_iocore_d_N_0 = NORTH ROW)
#3. Use with the command loadIoFile <fileName> immediately after floorplan -b <..> command.
#4. The power pads are POWER_VCC_IO_*, POWER_VCC_CORE_*, GROUND_IO_*, GROUND_CORE_*
#   These are placed immediately after the signal IOcells now. Can place anywhere or manually edit them in the laynum_inst. 
#5. The CHANGEME_* are placeholders for the remaining 12 IO cells (48 total, ONLY 20 signal IOs considered now)
#6. The calculations used are based on the IO pitch (0.62). Please consider the IO-pitch also while the changing the numbers.
#   Else there will be severe mis-alignment.


(globals
    version = 3
    io_order = clockwise
    space = 80 				
    total_edge = 3

)

(iopad
	(topleft
                (inst  name="CornerCell1"       cell=pfrelr  offset=0 orientation=R180 place_status=fixed )
	 )

        (left	
		( inst 	name="address10"		cell=pc3d01     place_status=fixed)	
		( inst 	name="address11"		cell=pc3d01     place_status=fixed)
		( inst 	name="address12"		cell=pc3d01     place_status=fixed)
		( inst 	name="address13"		cell=pc3d01     place_status=fixed)
		( inst 	name="address14"		cell=pc3d01     place_status=fixed)
		( inst 	name="address15"		cell=pc3d01     place_status=fixed)
		( inst 	name="address16"		cell=pc3d01     place_status=fixed)
		( inst 	name="address17"		cell=pc3d01     place_status=fixed)
		( inst 	name="address18"		cell=pc3d01     place_status=fixed)	
		( inst 	name="address19"		cell=pc3d01     place_status=fixed)
		( inst 	name="address110"		cell=pc3d01     place_status=fixed)
		( inst 	name="address111"		cell=pc3d01     place_status=fixed)
		( inst 	name="address112"		cell=pc3d01     place_status=fixed)
		( inst 	name="address113"		cell=pc3d01     place_status=fixed)
		( inst 	name="address114"		cell=pc3d01     place_status=fixed)
		( inst 	name="address115"		cell=pc3d01     place_status=fixed)
		( inst 	name="address20"		cell=pc3d01     place_status=fixed)	
		( inst 	name="address21"		cell=pc3d01     place_status=fixed)
		( inst 	name="address22"		cell=pc3d01     place_status=fixed)
		( inst 	name="address23"		cell=pc3d01     place_status=fixed)
		( inst 	name="address24"		cell=pc3d01     place_status=fixed)
		( inst 	name="address25"		cell=pc3d01     place_status=fixed)
		( inst 	name="address26"		cell=pc3d01     place_status=fixed)
		( inst 	name="address27"		cell=pc3d01     place_status=fixed)
		( inst 	name="address28"		cell=pc3d01     place_status=fixed)	
		( inst 	name="address29"		cell=pc3d01     place_status=fixed)
		( inst 	name="address210"		cell=pc3d01     place_status=fixed)
		( inst 	name="address211"		cell=pc3d01     place_status=fixed)

	)


       (topright
		(inst  name="CornerCell2"	cell=pfrelr  offset=0 orientation=R90 place_status=fixed )
	)
	
       ( top
		( inst 	name="POWER_VDD"	cell=pvdi    	place_status=fixed)
		( inst 	name="POWER_VSS"	cell=pv0i       place_status=fixed)
		( inst 	name="POWER_VDD1"	cell=pvdi    	place_status=fixed)
		( inst 	name="POWER_VSS1"	cell=pv0i       place_status=fixed)
		( inst 	name="POWER_VDD2"	cell=pvdi    	place_status=fixed)
		( inst 	name="Iclk"		cell=pc3c01     place_status=fixed)	
		( inst  name="Ireset_n"		cell=pc3d01     place_status=fixed)
		( inst 	name="IreadM1"		cell=pc3o01     place_status=fixed)	
		( inst  name="IreadM2"		cell=pc3o01     place_status=fixed)
		( inst 	name="IwriteM2"		cell=pc3o01     place_status=fixed)
		( inst 	name="Iis_halted"	cell=pc3o01     place_status=fixed)
		( inst 	name="address212"	cell=pc3d01     place_status=fixed)
		( inst 	name="address213"	cell=pc3d01     place_status=fixed)
		( inst 	name="address214"	cell=pc3d01     place_status=fixed)
		( inst 	name="address215"	cell=pc3d01     place_status=fixed)
		( inst  name="output_port12"	cell=pc3o01      place_status=fixed)	
		( inst  name="output_port13"	cell=pc3o01    	 place_status=fixed)
		( inst 	name="output_port14"	cell=pc3o01      place_status=fixed)
		( inst  name="output_port15"	cell=pc3o01      place_status=fixed)
		( inst 	name="data212"		cell=pc3d01     place_status=fixed)
		( inst 	name="data213"		cell=pc3d01     place_status=fixed)
		( inst 	name="data214"		cell=pc3d01     place_status=fixed)
		( inst 	name="data215"		cell=pc3d01     place_status=fixed)
		( inst 	name="POWER_VDDO"	cell=pvda      	place_status=fixed)
		( inst  name="POWER_VSSO"	cell=pv0a      	place_status=fixed)
		( inst 	name="POWER_VDDO1"	cell=pvda      	place_status=fixed)
		( inst  name="POWER_VSSO1"	cell=pv0a      	place_status=fixed)	
		( inst 	name="POWER_VDDO2"	cell=pvda      	place_status=fixed)				
	)



	(bottomright
		(inst  name="CornerCell3"	cell=pfrelr  offset=0 orientation=R0 place_status=fixed )
	) 


        ( right 
		( inst 	name="num_inst0"	cell=pc3o01      place_status=fixed)
		( inst  name="num_inst1"	cell=pc3o01      place_status=fixed)	
		( inst  name="num_inst2"	cell=pc3o01    	 place_status=fixed)
		( inst 	name="num_inst3"	cell=pc3o01      place_status=fixed)
		( inst  name="num_inst4"	cell=pc3o01      place_status=fixed)	
		( inst  name="num_inst5"	cell=pc3o01    	 place_status=fixed)
		( inst 	name="num_inst6"	cell=pc3o01      place_status=fixed)
		( inst  name="num_inst7"	cell=pc3o01      place_status=fixed)
		( inst 	name="num_inst8"	cell=pc3o01      place_status=fixed)
		( inst  name="num_inst9"	cell=pc3o01      place_status=fixed)	
		( inst  name="num_inst10"	cell=pc3o01    	 place_status=fixed)
		( inst 	name="num_inst11"	cell=pc3o01      place_status=fixed)
		( inst  name="num_inst12"	cell=pc3o01      place_status=fixed)	
		( inst  name="num_inst13"	cell=pc3o01    	 place_status=fixed)
		( inst 	name="num_inst14"	cell=pc3o01      place_status=fixed)
		( inst  name="num_inst15"	cell=pc3o01      place_status=fixed)	
		( inst 	name="output_port0"	cell=pc3o01      place_status=fixed)
		( inst  name="output_port1"	cell=pc3o01      place_status=fixed)	
		( inst  name="output_port2"	cell=pc3o01    	 place_status=fixed)
		( inst 	name="output_port3"	cell=pc3o01      place_status=fixed)
		( inst  name="output_port4"	cell=pc3o01      place_status=fixed)	
		( inst  name="output_port5"	cell=pc3o01    	 place_status=fixed)
		( inst 	name="output_port6"	cell=pc3o01      place_status=fixed)
		( inst  name="output_port7"	cell=pc3o01      place_status=fixed)
		( inst 	name="output_port8"	cell=pc3o01      place_status=fixed)
		( inst  name="output_port9"	cell=pc3o01      place_status=fixed)	
		( inst  name="output_port10"	cell=pc3o01    	 place_status=fixed)
		( inst 	name="output_port11"	cell=pc3o01      place_status=fixed)
				
	
	)


	(bottomleft
		(inst  name="CornerCell4"	 cell=pfrelr  offset=0 orientation=R270 place_status=fixed )
	)


	(bottom 
		( inst 	name="data10"		cell=pc3d01     place_status=fixed)	
		( inst 	name="data11"		cell=pc3d01     place_status=fixed)
		( inst 	name="data12"		cell=pc3d01     place_status=fixed)
		( inst 	name="data13"		cell=pc3d01     place_status=fixed)
		( inst 	name="data14"		cell=pc3d01     place_status=fixed)
		( inst 	name="data15"		cell=pc3d01     place_status=fixed)
		( inst 	name="data16"		cell=pc3d01     place_status=fixed)
		( inst 	name="data17"		cell=pc3d01     place_status=fixed)
		( inst 	name="data18"		cell=pc3d01     place_status=fixed)	
		( inst 	name="data19"		cell=pc3d01     place_status=fixed)
		( inst 	name="data110"		cell=pc3d01     place_status=fixed)
		( inst 	name="data111"		cell=pc3d01     place_status=fixed)
		( inst 	name="data112"		cell=pc3d01     place_status=fixed)
		( inst 	name="data113"		cell=pc3d01     place_status=fixed)
		( inst 	name="data114"		cell=pc3d01     place_status=fixed)
		( inst 	name="data115"		cell=pc3d01     place_status=fixed)
		( inst 	name="data20"		cell=pc3d01     place_status=fixed)	
		( inst 	name="data21"		cell=pc3d01     place_status=fixed)
		( inst 	name="data22"		cell=pc3d01     place_status=fixed)
		( inst 	name="data23"		cell=pc3d01     place_status=fixed)
		( inst 	name="data24"		cell=pc3d01     place_status=fixed)
		( inst 	name="data25"		cell=pc3d01     place_status=fixed)
		( inst 	name="data26"		cell=pc3d01     place_status=fixed)
		( inst 	name="data27"		cell=pc3d01     place_status=fixed)
		( inst 	name="data28"		cell=pc3d01     place_status=fixed)	
		( inst 	name="data29"		cell=pc3d01     place_status=fixed)
		( inst 	name="data210"		cell=pc3d01     place_status=fixed)
		( inst 	name="data211"		cell=pc3d01     place_status=fixed)
	)
)
