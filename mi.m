function MI=mi(img1,img2,imgF)
% -----------------------------------------------------------
% ���ߣ�ImageVisioner@outlook.com
% �汾 ��1.0
% ����һ��img1����ԭͼ 1  
% ������ (img2)�� ԭͼ 2
% ��������imgF�����ںϺ��ͼ��
% -----------------------------------------------------------

% �Ҷȱ任
% [name,path]=uigetfile({'*.*','��ѡ��ԭͼ��A'},'���ԭͼ��A');
% file1=strcat(path,name);
% 
% [name,path]=uigetfile({'*.*','��ѡ���ں�ͼ��F'},'����ں�ͼ��F');
% file2=strcat(path,name);
% imgF=imread(file2);
% img1=imread(img1);

imgF=rgb2gray(imgF);
img1=rgb2gray(img1);
imgF=double(imgF);
img1=double(img1);
[M,N]=size(imgF);
hab=zeros(256,256);
if max(max(imgF))~=min(min(imgF))
    imgF=(imgF-min(min(imgF)))/(max(max(imgF))-min(min(imgF)));
else
    imgF=zeros(M,N);
end
if max(max(img1))~=min(min(img1))
    img1=(img1-min(min(img1)))/(max(max(img1))-min(min(img1)));
else
    img1=zeros(M,N);
end
imgF=double(int16(imgF*255))+1; 
img1=double(int16(img1*255))+1;

for i=1:M
    for j=1:N
        index_x=imgF(i,j);
        index_y=img1(i,j);
        hab(index_x,index_y)=hab(index_x,index_y)+1;
    end
end

habsum=sum(sum(hab));
index=find(hab~=0);
pab=hab/habsum;
Hab=sum(sum(-pab(index).*log2(pab(index))));

pa=sum(pab');
index=find(pa~=0);
Ha=sum(sum(-pa(index).*log2(pa(index))));

pb=sum(pab);
index=find(pb~=0);
Hb=sum(sum(-pb(index).*log2(pb(index))));

mi=Ha+Hb-Hab;


imgF=imread(file2);
[name,path]=uigetfile({'*.*','��ѡ��ԭͼ��B'},'���ԭͼ��B');
file3=strcat(path,name);
img1=imread(file3);
imgF=rgb2gray(imgF);
img1=rgb2gray(img1);
imgF=double(imgF);
img1=double(img1);
[M,N]=size(imgF);
hab=zeros(256,256);
if max(max(imgF))~=min(min(imgF))
    imgF=(imgF-min(min(imgF)))/(max(max(imgF))-min(min(imgF)));
else
    imgF=zeros(M,N);
end
if max(max(img1))~=min(min(img1))
    img1=(img1-min(min(img1)))/(max(max(img1))-min(min(img1)));
else
    img1=zeros(M,N);
end
imgF=double(int16(imgF*255))+1; 
img1=double(int16(img1*255))+1;

for i=1:M
    for j=1:N
        index_x=imgF(i,j);
        index_y=img1(i,j);
        hab(index_x,index_y)=hab(index_x,index_y)+1;
    end
end

habsum=sum(sum(hab));
index=find(hab~=0);
pab=hab/habsum;
Hab=sum(sum(-pab(index).*log2(pab(index))));

pa=sum(pab'); 
index=find(pa~=0);
Ha=sum(sum(-pa(index).*log2(pa(index))));

pb=sum(pab);
index=find(pb~=0);
Hb=sum(sum(-pb(index).*log2(pb(index))));

MI=Ha+Hb-Hab+mi;
end
