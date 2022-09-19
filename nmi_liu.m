function nmi_value =nmi_liu(img1,imgF)
% -----------------------------------------------------------
% NMI： Normalized mutual information
% 度量图像相似的一个指标，NMI的值越大，表示融合图像保留更多源图像的信息
% 作者：ImageVisioner@outlook.com
% 版本 ：1.0
% 参数一（img1）：原图 1  
% 参数二（imgF）：融合后的图像
% -----------------------------------------------------------

img1=rgb2gray(img1);
imgF=rgb2gray(imgF);

if size(img1,3)==3
    img1=rgb2gray(img1);
end
if size(imgF,3)==3
    imgF=rgb2gray(imgF);
end

img1= double(img1);
imgF = double(imgF);

%需要把nmi函数放在一个文件夹下面
nmi_value=nmi(img1,imgF);

end





