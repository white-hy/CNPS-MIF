clear all;
close all;
clc;
addpath(genpath(cd));
A = imread ('c1_1.tif');
B = imread ('c1_2.tif');
F = imread('1.tif');
disp("Start");
disp('---------------------------Analysis---------------------------');
% Qabf FMI MS_SSIM SF SD
Evaluation_results = analysis_Reference(uint8(F),uint8(A),uint8(B));
disp('Done');