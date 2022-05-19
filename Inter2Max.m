function [posit_X] = Inter2Max(x,m,n)
    r_X = size(x,1);  % row of x 
    M = max([m-min(x),max(x)-n]);
    posit_X = zeros(r_X,1);   %zeros�����÷�: zeros(3)  zeros(3,1)  ones(3)
    % ��ʼ��posit_xȫΪ0  ��ʼ����Ŀ���ǽ�ʡ����ʱ��
    for i = 1: r_X
        if x(i) < m
           posit_X(i) = 1-(m-x(i))/M;
        elseif x(i) > n
           posit_X(i) = 1-(x(i)-n)/M;
        else
           posit_X(i) = 1;
        end
    end
end