function entropy_value=entropy_liu(img)
% -----------------------------------------------------------
% ��ʾͼ����������ƽ����Ϣ���Ķ���
% ��ֵԽ����������Ϣ��Խ��
% ���ߣ�ImageVisioner@outlook.com
% �汾 ��1.0
% -----------------------------------------------------------

% [name,path]=uigetfile({'*.*','��ѡ���ں�ͼ��F'},'����ں�ͼ��F');
% 
% file=strcat(path,name);
% F=imread(file);

% �鿴�Ƿ�Ϊ�Ҷ�ͼ
if size(img,3)==3
    img=rgb2gray(img);
end
p=imhist(img);
p(p==0)=[];
p=p/numel(img);
entropy_value=-sum(p.*log2(p));
end