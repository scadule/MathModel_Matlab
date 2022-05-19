function [posit_x] = Positivization(x,class,i)
%% 输入变量说明：
% x:需要正向化的原始列向量
% class:指标类型
% i:表示正在处理当前列的位置
% 输出变量时正则化后的列向量
%% 正文代码
    if class == 1  %是不是极小型
        disp(['第' num2str(i) '列是极小型，正向化ing'] )
        posit_x = Min2Max(x);  %调用Min2Max函数来正向化
        disp(['第' num2str(i) '列极小型正向化end'] )
        disp('~~~~~~~~~~~~~~~~~~~~分界线~~~~~~~~~~~~~~~~~~~~')
    elseif class == 2  %是不是中间型
        disp(['第' num2str(i) '列是中间型'] )
        best = input('请输入最佳值： ');
        posit_x = Mid2Max(x,best);
        disp(['第' num2str(i) '列中间型正向化处end'] )
        disp('----------------分界线-----------------')
    elseif class == 3  %是不是区间型
        disp(['第' num2str(i) '列是区间型'] )
        a = input('请输入区间的下界： ');
        b = input('请输入区间的上界： '); 
        posit_x = Inter2Max(x,a,b);
        disp(['第' num2str(i) '列区间型正向化end'] )
        disp('~----------------分界线-----------------')
    else
        disp('没有这种类型的指标，请检查class向量中是否有除了1、2、3之外的其他值')
    end
end