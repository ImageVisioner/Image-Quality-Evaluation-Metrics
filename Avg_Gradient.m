function outval = Avg_Gradient(img) 
% -----------------------------------------------------------
% ƽ���ݶȣ�Ҳ��Ϊ�����ȣ���ӳ��ͼ���е�΢Сϸ�ڷ���������仯����
% ͬʱҲ��ӳ��ͼ��������ȣ�Խ��Խ����
% ����ͼ�����Ƶ�һ��ָ�ֵ꣬Խ�󣬱�ʾ�ں�ͼ��������Դͼ�����Ϣ
% ���ߣ�ImageVisioner@outlook.com
% �汾 ��1.0

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
