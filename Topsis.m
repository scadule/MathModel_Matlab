%% Topsis优劣解距离法
%% 清屏和数据的载入
clc,clear all;
%输入数据
data_X=[];%用来存放输入的数据
%% 看是否需要正向化
[c,r]=size(data_X);%c行r列
disp(['现在的数据有' num2str(c) '个评价对象, ' num2str(r) '个评价指标'])
JButtom = input(['这' num2str(r) '个指标是否需要正向化处理，需要请输入1 ，不用输入0：  ']);%输入4
if JButtom == 1 %表示数据是需要处理的
    Pos = input('请输入需要正向化处理的指标所在的列，例如第2、1、4三列需要处理，那么你需要输入[2,1,4]： ');%输入哪行要处理
    disp('请输入需要处理的这些列的指标类型（1:极小型， 2:中间型， 3:区间型） ');%pos行向量
    class = input('例如：第2列是极小型，第1列是区间型，第4列是中间型，就输入[1,3,2]：  '); %class行向量，和post同维度
    %对需要处理的数据进行处理
     for i = 1 : size(Pos,2)
         data_X(:,Pos(i)) = Positivization(data_X(:,Pos(i)),class(i),Pos(i));
         % 参数说明 ：data_data_X需要正则画的 class 指标类型 最后一个那一列
     end
     disp('正向化后的矩阵 data_data_X =  ')
    disp(data_X)
end

%% 标准化矩阵（正向化后的）
data_Z= data_X ./ repmat(sum(data_X.*data_X) .^ 0.5, c, 1);
disp('标准化矩阵 data_data_Z= ')
disp(data_Z)

%% 计算优劣距离和得分
Data_top = sum([(data_Z - repmat(max(data_Z),c,1)) .^ 2 ],2) .^ 0.5;   % D+ 
Data_bottum = sum([(data_Z - repmat(min(data_Z),c,1)) .^ 2 ],2) .^ 0.5;   % D-
Score = Data_bottum./ (Data_top+Data_bottum);    % 未归一化的得分
disp('最后的得分为：')
stand_Score = Score / sum(Score)
[sorted_Score,index] = sort(stand_Score ,'descend')
