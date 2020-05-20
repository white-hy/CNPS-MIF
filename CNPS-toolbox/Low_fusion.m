function  LF=Low_fusion(matrixA,matrixB)
CNPS_fire_times1 = CNPS(abs(matrixA),110);
CNPS_fire_times2 = CNPS(abs(matrixB),110);
map=(CNPS_fire_times1>=CNPS_fire_times2);
map=majority_consist_new(map,9);
LF=map.*matrixA+~map.*matrixB;
end

