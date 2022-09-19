function [ssim_value] = ssim_liu(img1,img2)
% -----------------------------------------------------------
% 计算两张图像的相似性
% 度量图像相似的一个指标，值越大，表示融合图像保留更多源图像的信息
% 作者：ImageVisioner@outlook.com
% 版本 ：1.0
% 参数一（img1）：原图 1  
% 参数二（imgF）：融合后的图像
% -----------------------------------------------------------
 
img1= im2double(img1);
    img2=im2double(img2);
    ssim_value=ssim(img1,img2);
end