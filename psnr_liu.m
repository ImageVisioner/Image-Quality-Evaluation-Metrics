function [psnr_Value,Mse_Value] = psnr_liu(img1,img2)
% -----------------------------------------------------------
% Peak Signal to Noise Ratio ，峰值信噪比
% 用来衡量处理后图像与原始图像的变化程度。
% 作者：ImageVisioner@outlook.com
% 版本 ：1.0
% ---------------------------------------------------------
% 【注1】：归一化
% 计算之前要把两个图像调整为同一个阈值，一个[0,1]和一个[0,255]是不能放一起用的
% 【注2】：图像大小尺寸一致，否则无法计算
% 计算psnr值的时候需要计算MSE均方误差
% -----------------------------------------------------------
% ----------评价指标方式-------------------------------------
% PSNR接近 50dB ，图像仅有些许非常小的误差。
% PSNR > 30dB ，人眼很难查觉和原始影像的差异。
% PSNR:  20dB ~ 30dB 之间，人眼就可以察觉出图像的差异。
% PSNR:  10dB ~ 20dB 之间，人眼还是可以用肉眼看出这个图像原始的结构，
% 且直观上会判断两张图像不存在很大的差异。
% PSNR < 10dB，人类很难用肉眼去判断两个图像是否为相同
% -----------------------------------------------------------

%转换到double数据类型 便于计算
% img1=im2double(img1);
% img2=im2double(img2);



img1= double(img1);
img2=double(img2);
[m1,n1,c1]=size(img1);
[m2,n2,c2]=size(img2);


img1 = img1(1:m1, 1:n1, 1:c1);
img2 = img2(1:m2, 1:n2, 1:c2);


if  size(img2) == size(img2)
    psnr_Value = 0;%给初值
%      MSE=0;
    % 对每个通道进行循环求职 最后平均
    for i = 1:c1
%         MSE=MSE+mse(img1(:, :, i) - img2(:, :, i));
%         Mse_Value=MSE+ immse(img1(:, :, i),img2(:, :, i));
        psnr_Value = psnr_Value + 10*log10(255^2/mse(img1(:, :, i) - img2(:, :, i)));
    end
    psnr_Value= psnr_Value/3;
    Mse_Value= immse(img1,img2);
%     Rmse_Value = immse(img1,img2);
   
else
    error("请注意图像的尺寸")
end
end

