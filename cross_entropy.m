function [MCE,RCE]=cross_entropy(img1,img2,imgF)
% -----------------------------------------------------------
% ��ӳ����ͼ��Ĳ���,�����ԽС,
% ���ں�ͼ���ԭͼ��Ĳ��ԽС
% ƽ�������MCE�������������RCE
% ���ߣ�ImageVisioner@outlook.com
% �汾 ��1.0
% ����һ��img1����ԭͼ   
% ������ (img2)�� ԭͼ   
% ��������imgF�����ںϺ��ͼ��
% -----------------------------------------------------------

% %{[name,path]=uigetfile({'*.*','��ѡ��ԭͼ��A'},'���ԭͼ��A');
% file1=strcat(path,name);
% [name,path]=uigetfile({'*.*','��ѡ��ԭͼ��B'},'���ԭͼ��B');
% file2=strcat(path,name);
% [name,path]=uigetfile({'*.*','��ѡ���ں�ͼ��F'},'����ں�ͼ��F');
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

% ƽ�������MCE�������������RCE
MCE=(CE1+CE2)/2;
RCE=sqrt((CE1^2+CE2^2)/2);
end
