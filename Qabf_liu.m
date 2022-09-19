function Qabf_value=Qabf_liu(img1,img2,imgF)
% -----------------------------------------------------------
% 评价边缘或梯度质量，越大边缘越明显
% 
% 作者：ImageVisioner@outlook.com
% 版本 ：1.0
% 参数一（img1）：原图 1  
% 参数一（img2）：原图 2 
% 参数二（imgF）：融合后的图像
% -----------------------------------------------------------


% model parameters 模型的初始化参数
    L=1; 
    Tg=0.9994;
    kg=-15;
    Dg=0.5;
    Ta=0.9879;
    ka=-22;
    Da=0.8;       
% Sobel Operator
h1=[1 2 1;0 0 0;-1 -2 -1]; 
h2=[0 1 2;-1 0 1;-2 -1 0]; 
h3=[-1 0 1;-2 0 2;-1 0 1];
% if y is the response to h1 and x is the response to h3;
% then the intensity is sqrt(x^2+y^2) and orientation is arctan(y/x);

% [name,path]=uigetfile({'*.*','请选择原图像A'},'请打开原图像A');
% file1=strcat(path,name);
% [name,path]=uigetfile({'*.*','请选择原图像B'},'请打开原图像B');
% file2=strcat(path,name);
% [name,path]=uigetfile({'*.*','请选择融合图像F'},'请打开融合图像F');
% file3=strcat(path,name);
pA=img1;
pB=img2;
pF=imgF;
if size(pA,3)==3
    pA=rgb2gray(pA);
end
if size(pB,3)==3
    pB=rgb2gray(pB);
end
if size(pF,3)==3
    pF=rgb2gray(pF);
end
pA = im2double(pA);
pB = im2double(pB);
pF = im2double(pF);

SAx = conv2(pA,h3,'same'); SAy = conv2(pA,h1,'same');
gA = sqrt(SAx.^2 + SAy.^2); 
[M,N] = size(SAx); aA = zeros(M,N);
for i=1:M
    for j=1:N
        if ( SAx(i,j) == 0 ) aA(i,j) = pi/2;
        else
            aA(i,j) = atan(SAy(i,j)/SAx(i,j));
        end
    end
end

SBx = conv2(pB,h3,'same'); SBy = conv2(pB,h1,'same');
gB = sqrt(SBx.^2 + SBy.^2); 
[M,N] = size(SBx); aB = zeros(M,N);
for i=1:M
    for j=1:N
        if ( SBx(i,j) == 0 ) aB(i,j) = pi/2;
        else
            aB(i,j) = atan(SBy(i,j)/SBx(i,j));
        end
    end
end

SFx = conv2(pF,h3,'same'); SFy = conv2(pF,h1,'same');
gF = sqrt(SFx.^2 + SFy.^2); 
[M,N] = size(SAx); aF = zeros(M,N);
for i=1:M
    for j=1:N
        if ( SFx(i,j) == 0 ) aF(i,j) = pi/2;
        else
            aF(i,j) = atan(SFy(i,j)/SFx(i,j));
        end
    end
end

% the relative strength and orientation value of GAF,GBF and AAF,ABF;
GAF = zeros(M,N); AAF = zeros(M,N); QgAF = zeros(M,N); QaAF = zeros(M,N); QAF = zeros(M,N);
for i=1:M
    for j=1:N
        
        if ( gA(i,j) > gF(i,j)) 
            GAF(i,j) = gF(i,j)/gA(i,j);
        else
            if ( gA(i,j) == gF(i,j) ) 
                GAF(i,j) = gF(i,j);
            else
                GAF(i,j) = gA(i,j) / gF(i,j);
            end
        end 
        AAF(i,j) = 1 - abs(aA(i,j)-aF(i,j))/(pi/2);
        
        QgAF(i,j) = Tg / (1 + exp(kg*( GAF(i,j) - Dg )));
        QaAF(i,j) = Ta / (1 + exp(ka*( AAF(i,j) - Da )));
        
        QAF(i,j) = QgAF(i,j) * QaAF(i,j);
    end
end

GBF = zeros(M,N); ABF = zeros(M,N); QgBF = zeros(M,N); QaBF = zeros(M,N); QBF = zeros(M,N);
for i=1:M
    for j=1:N
        
        if ( gB(i,j) > gF(i,j))  GBF(i,j) = gF(i,j)/gB(i,j);
        else
            if ( gB(i,j) == gF(i,j) )  GBF(i,j) = gF(i,j);
            else
                GBF(i,j) = gB(i,j) / gF(i,j);
            end
        end 
        ABF(i,j) = 1 - abs(aB(i,j)-aF(i,j))/(pi/2);
        
        QgBF(i,j) = Tg / (1 + exp(kg*( GBF(i,j) - Dg )));
        QaBF(i,j) = Ta / (1 + exp(ka*( ABF(i,j) - Da )));
        
        QBF(i,j) = QgBF(i,j) * QaBF(i,j);
    end
end

% compute the QABFs
deno = sum(sum( gA + gB ));
nume = sum(sum( QAF.*gA + QBF.*gB ));
Qabf_value = nume / deno ;

end

