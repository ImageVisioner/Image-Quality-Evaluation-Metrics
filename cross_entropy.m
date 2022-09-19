function [MCE,RCE]=cross_entropy(img1,img2,imgF)
% -----------------------------------------------------------
% 反映两幅图像的差异,交叉嫡越小,
% 则融合图像和原图像的差别越小
% 平均交叉嫡MCE，均方根交叉嫡RCE
% 作者：ImageVisioner@outlook.com
% 版本 ：1.0
% 参数一（img1）：原图   
% 参数二 (img2)： 原图   
% 参数三（imgF）：融合后的图像
% -----------------------------------------------------------

% %{[name,path]=uigetfile({'*.*','请选择原图像A'},'请打开原图像A');
% file1=strcat(path,name);
% [name,path]=uigetfile({'*.*','请选择原图像B'},'请打开原图像B');
% file2=strcat(path,name);
% [name,path]=uigetfile({'*.*','请选择融合图像F'},'请打开融合图像F');
% file3=strcat(path,name);
% g1=imread(file1);
% g2=imread(file2);
% g3=imread(file3);%


if size(img1,3)==3
    img1=rgb2gray(img1);
end
if size(img2,3)==3
    img2=rgb2gray(img2);
end
if size(imgF,3)==3
    imgF=rgb2gray(imgF);
end

p1=imhist(img1);
p1(p1==0)=(1);
p1=p1/numel(img1);

p2=imhist(img2);
p2(p2==0)=(1);
p2=p2/numel(img2);

p3=imhist(imgF);
p3(p3==0)=(1);
p3=p3/numel(imgF);

CE1=abs(sum(p1.*log2(p1./p3)));
CE2=abs(sum(p2.*log2(p2./p3)));

% 平均交叉嫡MCE，均方根交叉嫡RCE
MCE=(CE1+CE2)/2;
RCE=sqrt((CE1^2+CE2^2)/2);
end
