function  Result = analysis_Reference(image_f,image_ir,image_vis)
[s1,s2] = size(image_ir);
imgSeq = zeros(s1, s2, 2);
imgSeq(:, :, 1) = image_ir;
imgSeq(:, :, 2) = image_vis;
image1 = im2double(image_ir);
image2 = im2double(image_vis);
image_fused = im2double(image_f);
Result=zeros(1,5);
%Qabf 
Result(1,1) = Qp_ABF(image1,image2,image_fused);
%FMI
Result(1,2) = analysis_fmi(image1,image2,image_fused);
%MS_SSIM
Result(1,3) = analysis_ms_ssim(imgSeq, image_f);
%SF
Result(1,4) = spatial_frequency(image_f);
%SD
Result(1,5) = std2(image_f);
end







