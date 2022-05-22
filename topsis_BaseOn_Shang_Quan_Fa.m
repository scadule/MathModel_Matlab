%% 基于熵权法对Topsis的修正

%% 数据的输入
clc,clear all;
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
     disp('正向化后的矩阵 data_X =  ')
    disp(data_X)
end

%% 标准化矩阵（正向化后的）
data_Z= data_X ./ repmat(sum(data_X.*data_X) .^ 0.5, c, 1);
disp('标准化矩阵 data_data_Z= ')
disp(data_Z)

%% 是否需要增加权重捏
disp(" 是否需要增加权重捏，需要按1，不用按0")
Judgement = input('请输入： ');
if Judgement == 1
    Judgement = input('使用熵权法确定权重请输入1，否则输入0： ');
    if Judgement == 1
        if sum(sum(data_Z<0)) >0   % 熵权法是不能有负数的
            disp('原来标准化得到的Z矩阵中存在负数，所以需要对X重新标准化')
            for i = 1:c
                for j = 1:r
                    data_Z(i,j) = [data_X(i,j) - min(data_X(:,j))] / [max(data_X(:,j)) - min(data_X(:,j))];
                end
            end
            disp('data_X重新进行标准化后的data_Z为:  ')
            disp(data_Z)
        end
        data_weight = Entropy_Method(data_Z);
        disp('熵权法确定的权重为：')
        disp(data_weight)
    else
        disp(['如果你有3指标，你需要输入3权重，如它们分别为0.35,0.45,0.20, 则你需要输入[0.35,0.45,0.20]']);
        data_weight = input(['你需要输入' num2str(r) '个权数。' '请以行向量的形式输入这' num2str(r) '个权重: ']);
        ISOK = 0;  % 用来判断用户的输入格式是否正确
        while ISOK == 0 
            if abs(sum(data_weight) -1)<0.000001 && size(data_weight,1) == 1 && size(data_weight,2) == m  % 注意，Matlab中浮点数的比较要小心
                ISOK =1;%格式正确
            else
                data_weight = input('你输入的有误，请重新输入权重行向量: ');%错误提示
            end
        end
    end
else
    data_weight = ones(1,r) ./ r ; %不输入就默认权重相同
end

%% 第四步：计算与最大值的距离和最小值的距离，并算出得分
D_top = sum([(data_Z - repmat(max(data_Z),c,1)) .^ 2 ] .* repmat(data_weight,c,1) ,2) .^ 0.5;   % D+ 与最大值的距离向量
D_bottom = sum([(data_Z - repmat(min(data_Z),c,1)) .^ 2 ] .* repmat(data_weight,c,1) ,2) .^ 0.5;   % D- 与最小值的距离向量
D_S = D_bottom ./ (D_top+D_bottom);    % 未归一化的得分
disp('最后的得分为：')
st_S = D_S / sum(D_S)
[sort_S,index] = sort(st_S ,'descend')






