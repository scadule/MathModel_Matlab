function [w] = Entropy_Method(data_Z)
%% ��Ȩ������Ȩ��
    [c,r] = size(data_Z);
    d = zeros(1,r);  % ��ʼ������
    for i = 1:r
        data_x= data_Z(:,i);  % ȡ��ָ��
        P = data_x / sum(data_x);
        % PС����Ļ�ʱ�����Եģ��Լ�����һ������
        e = -sum(P .* mylog(P)) / log(c); % ��Ϣ�ؼ��㣬�й�ʽ
        d(i) = 1- e; % ������ϢЧ��ֵ
    end
    w = d ./ sum(d);  % ��һ��    
end