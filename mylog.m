
function [ln_p] =  mylog(p)
%%�ú���������Ϊ0���򷵻�0
len = length(p);   % �����ĳ���
ln_p = zeros(len,1);   % ��ʼ�����Ľ��
    for i = 1:len   % ��ʼѭ��
        if p(i) == 0   % �����i��Ԫ��Ϊ0
            ln_p(i) = 0;  % ��ô���صĵ�i�����ҲΪ0
        else
            ln_p(i) = log(p(i));  
        end
    end
end