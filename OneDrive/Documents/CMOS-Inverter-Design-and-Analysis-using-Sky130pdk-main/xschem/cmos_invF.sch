v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 10 -60 10 20 {
lab=OUT}
N -70 50 -30 50 {
lab=IN}
N -70 -90 -70 50 {
lab=IN}
N -70 -90 -30 -90 {
lab=IN}
N 10 -20 130 -20 {
lab=OUT}
N 10 -160 10 -120 {
lab=VDD}
N 10 80 10 130 {
lab=VSS}
N -150 -20 -70 -20 {
lab=IN}
N -600 30 -600 50 {
lab=GND}
N -500 30 -500 50 {
lab=GND}
N -830 20 -830 40 {
lab=GND}
N 10 100 130 100 {
lab=VSS}
N 130 50 130 100 {
lab=VSS}
N 10 50 130 50 {
lab=VSS}
N 10 -90 130 -90 {
lab=VDD}
N 130 -140 130 -90 {
lab=VDD}
N 10 -140 130 -140 {
lab=VDD}
C {OpenLane/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -10 50 0 0 {name=X1
W=0.45
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -500 0 0 0 {name=VIN    value="pulse(0 1.8 1n 0.3n 0.3n 5n 10n)"   savecurrent=false}
C {vsource.sym} -600 0 0 0 {name=VSS1 value=0 savecurrent=false}
C {lab_pin.sym} -600 -30 0 0 {name=VSS sig_type=std_logic lab=VSS}
C {lab_pin.sym} -500 -30 0 0 {name=p2 sig_type=std_logic lab=IN}
C {gnd.sym} -500 50 0 0 {name=l3 lab=GND}
C {gnd.sym} -600 50 0 0 {name=l4 lab=GND}
C {vsource.sym} -830 -10 0 0 {name=VDD value=1.8 savecurrent=false}
C {lab_pin.sym} -830 -40 0 0 {name=VCC3 sig_type=std_logic lab=VDD}
C {gnd.sym} -830 40 0 0 {name=l2 lab=GND}
C {code_shown.sym} -700 -470 0 0 {name=s1 only_toplevel=false value="
.lib /home/yogesh/OpenLane/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all

.control
  * 1. Run time simulation
  tran 0.1n 30n

  * 2. Measure 50% delay points (Input to Output)
  meas tran tpHL trig v(IN) val=0.9 rise=2 targ v(OUT) val=0.9 fall=2
  meas tran tpLH trig v(IN) val=0.9 fall=2 targ v(OUT) val=0.9 rise=2

   let p_inst = v(vdd) * -i(vdd)

  * 3. Calculate and display average delay
  let tp_avg = (tpHL + tpLH) / 2
  print tpHL tpLH tp_avg
  plot v(IN) v(OUT) 
.endc"}
C {OpenLane/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -10 -90 0 0 {name=x0
W=1.58
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} 10 -160 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 130 -20 0 0 {name=p9 sig_type=std_logic lab=OUT}
C {lab_pin.sym} -150 -20 0 0 {name=p4 sig_type=std_logic lab=IN}
C {lab_pin.sym} 10 130 0 0 {name=p10 sig_type=std_logic lab=VSS}
