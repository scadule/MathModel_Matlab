function [w] = Entropy_Method(data_Z)
%% 熵权法计算权重
    [c,r] = size(data_Z);
    d = zeros(1,r);  % 初始化过程
    for i = 1:r
        data_x= data_Z(:,i);  % 取出指标
        P = data_x / sum(data_x);
        % P小于零的话时不可以的，自己定义一个函数
        e = -sum(P .* mylog(P)) / log(c); % 信息熵计算，有公式
        d(i) = 1- e; % 计算信息效用值
    end
    w = d ./ sum(d);  % 归一化    
end