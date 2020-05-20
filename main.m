clear all;
close all;
clc;
%% NSST tool box
addpath(genpath(cd));
%%
for ind=1:20
    index = ind;
    path1 = ['datasets_medical/c',num2str(index),'_1','.tif'];
    path2 = ['datasets_medical/c',num2str(index),'_2','.tif'];
    path_temp = './fused/';
    if exist(path_temp,'dir')==0
        mkdir(path_temp);
    end
    fuse_path = [path_temp, num2str(index), '.tif'];
   
    if exist(fuse_path,'file')~=0
        continue;
    end
    img1 = imread(path1);
    img2 = imread(path2);
    img1 = double(img1)/255;
    img2 = double(img2)/255;
    imgf=fuse_NSST_CNPS(img1,img2); 
    str=['image ', num2str(index), ' fusion completed!'];
    imwrite(imgf,fuse_path,'tif')
    disp(str) 
end
disp('All completed......')

