function entropy_value=entropy_liu(img)
% -----------------------------------------------------------
% 表示图像所包含的平均信息量的多少
% 嫡值越大则所含信息量越多
% 作者：ImageVisioner@outlook.com
% 版本 ：1.0
% -----------------------------------------------------------

% [name,path]=uigetfile({'*.*','请选择融合图像F'},'请打开融合图像F');
% 
% file=strcat(path,name);
% F=imread(file);

% 查看是否为灰度图
if size(img,3)==3
    img=rgb2gray(img);
end
p=imhist(img);
p(p==0)=[];
p=p/numel(img);
entropy_value=-sum(p.*log2(p));
end