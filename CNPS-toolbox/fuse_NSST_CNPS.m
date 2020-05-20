function F = fuse_NSST_CNPS(A,B)
%% NSST decomposition
pfilt = 'maxflat';
shear_parameters.dcomp =[2,2,3,3];
shear_parameters.dsize =[4,4,8,8];
[y1,shear_f1]=nsst_dec2(A,shear_parameters,pfilt);
[y2,shear_f2]=nsst_dec2(B,shear_parameters,pfilt);
%% fusion
y=y1;
y{1} =Low_fusion(y1{1},y2{1});

for m=2:length(shear_parameters.dcomp)+1
    temp=size((y1{m}));temp=temp(3);
    for n=1:temp
        Ahigh=y1{m}(:,:,n);
        Bhigh=y2{m}(:,:,n);
        y{m}(:,:,n)=High_fusion(Ahigh,Bhigh);

    end
end
%%  NSST reconstruction
F=nsst_rec2(y,shear_f1,pfilt);
end