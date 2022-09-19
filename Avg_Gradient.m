function outval = Avg_Gradient(img) 
% -----------------------------------------------------------
% 平均梯度，也称为清晰度，反映了图像中的微小细节反差与纹理变化特征
% 同时也反映了图像的清晰度，越大越清晰
% 度量图像相似的一个指标，值越大，表示融合图像保留更多源图像的信息
% 作者：ImageVisioner@outlook.com
% 版本 ：1.0

% -----------------------------------------------------------

 
if nargin == 1 
    img = double(img); 
    % Get the size of img 
    [r,c,b] = size(img); 
     
    dx = 1; 
    dy = 1; 
    for k = 1 : b 
        band = img(:,:,k); 
        [dzdx,dzdy] = gradient(band,dx,dy); 
        s = sqrt((dzdx .^ 2 + dzdy .^2) ./ 2); 
        g(k) = sum(sum(s)) / ((r - 1) * (c - 1)); 
    end 
    outval = mean(g); 
else 
    error('Wrong number of input!'); 
end
