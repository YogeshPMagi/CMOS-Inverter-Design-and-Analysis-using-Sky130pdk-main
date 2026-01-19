v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -250 60 -250 80 {
lab=GND}
N -150 60 -150 80 {
lab=GND}
N -60 0 -10 -0 {
lab=VIN}
N 30 -60 30 -30 {
lab=VCC}
N 30 0 110 -0 {
lab=VCC}
N 190 80 190 100 {
lab=GND}
N 120 20 190 20 {
lab=VOUT}
N 120 20 120 50 {
lab=VOUT}
N 30 50 120 50 {
lab=VOUT}
N 30 30 30 50 {
lab=VOUT}
N 30 50 30 60 {
lab=VOUT}
N 110 -40 110 0 {
lab=VCC}
N 30 -40 110 -40 {
lab=VCC}
N 30 120 30 140 {}
C {vsource.sym} -150 30 0 0 {name=VIN    value="pulse(0 1.8 0 .3n .3n 6.6n 13.2n)"   savecurrent=false}
C {vsource.sym} -250 30 0 0 {name=VCC value=1.8 savecurrent=false}
C {lab_pin.sym} -250 0 0 0 {name=VCC1 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 30 -60 0 0 {name=p3 sig_type=std_logic lab=VCC
}
C {lab_pin.sym} -60 0 0 0 {name=p4 sig_type=std_logic lab=VIN}
C {res.sym} 30 90 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} 190 50 0 0 {name=C1
m=1
value=50F
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 190 100 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -150 0 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {gnd.sym} 30 140 0 0 {name=l2 lab=GND}
C {gnd.sym} -150 80 0 0 {name=l3 lab=GND}
C {gnd.sym} -250 80 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 190 20 0 0 {name=p1 sig_type=std_logic lab=VOUT}
C {code_shown.sym} -160 -350 0 0 {name=s1 only_toplevel=false value=".lib /home/yogesh/OpenLane/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all
.control
  tran 0.1n 30n
  plot v(Vin) v(Vout)
.endc"}
C {OpenLane/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} 10 0 0 0 {name=M1
W=1
L=0.15
nf=1
mult=3.5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
