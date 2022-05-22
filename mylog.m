
function [ln_p] =  mylog(p)
%%该函数若输入为0，则返回0
len = length(p);   % 向量的长度
ln_p = zeros(len,1);   % 初始化最后的结果
    for i = 1:len   % 开始循环
        if p(i) == 0   % 如果第i个元素为0
            ln_p(i) = 0;  % 那么返回的第i个结果也为0
        else
            ln_p(i) = log(p(i));  
        end
    end
end