function nmi_value =nmi_liu(img1,imgF)
% -----------------------------------------------------------
% NMI�� Normalized mutual information
% ����ͼ�����Ƶ�һ��ָ�꣬NMI��ֵԽ�󣬱�ʾ�ں�ͼ��������Դͼ�����Ϣ
% ���ߣ�ImageVisioner@outlook.com
% �汾 ��1.0
% ����һ��img1����ԭͼ 1  
% ��������imgF�����ںϺ��ͼ��
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

%��Ҫ��nmi��������һ���ļ�������
nmi_value=nmi(img1,imgF);

end





