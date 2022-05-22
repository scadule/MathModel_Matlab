%% 灰色关联度分析应用一：系统分析
% 求母序列和子序列的灰色关联度以达到关联分析的效果
% 注意第一列应该为母序列
%% 导入数据
clear;clc
GDP=[];

%% 具体求法
Mean = mean(GDP);  % 求出每一列的均值\理
GDP = GDP ./ repmat(Mean,size(GDP,1),1);  %数据预处理
disp('预处理后的矩阵为：'); disp(GDP)
Y = GDP(:,1);  % 母序列
X = GDP(:,2:end); % 子序列
absx0_xi = abs(X - repmat(Y,1,size(X,2)))  % 计算|X0-Xi|矩阵(在这里我们把X0定义为了Y)
A = min(min(absx0_xi))    % 计算两级最小差a
B = max(max(absx0_xi))  % 计算两级最大差b
rho = 0.5; % 分辨系数取0.5
gama = (A+rho*B) ./ (absx0_xi  + rho*B)  % 计算子序列中各个指标与母序列的关联系数
disp('子序列中各个指标的灰色关联度分别为：')
disp(mean(gama))