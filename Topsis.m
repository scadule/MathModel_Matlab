%% Topsis���ӽ���뷨
%% ���������ݵ�����
clc,clear all;
%��������
data_X=[];%����������������
%% ���Ƿ���Ҫ����
[c,r]=size(data_X);%c��r��
disp(['���ڵ�������' num2str(c) '�����۶���, ' num2str(r) '������ָ��'])
JButtom = input(['��' num2str(r) '��ָ���Ƿ���Ҫ���򻯴�����Ҫ������1 ����������0��  ']);%����4
if JButtom == 1 %��ʾ��������Ҫ�����
    Pos = input('��������Ҫ���򻯴����ָ�����ڵ��У������2��1��4������Ҫ������ô����Ҫ����[2,1,4]�� ');%��������Ҫ����
    disp('��������Ҫ�������Щ�е�ָ�����ͣ�1:��С�ͣ� 2:�м��ͣ� 3:�����ͣ� ');%pos������
    class = input('���磺��2���Ǽ�С�ͣ���1���������ͣ���4�����м��ͣ�������[1,3,2]��  '); %class����������postͬά��
    %����Ҫ��������ݽ��д���
     for i = 1 : size(Pos,2)
         data_X(:,Pos(i)) = Positivization(data_X(:,Pos(i)),class(i),Pos(i));
         % ����˵�� ��data_data_X��Ҫ���򻭵� class ָ������ ���һ����һ��
     end
     disp('���򻯺�ľ��� data_data_X =  ')
    disp(data_X)
end

%% ��׼���������򻯺�ģ�
data_Z= data_X ./ repmat(sum(data_X.*data_X) .^ 0.5, c, 1);
disp('��׼������ data_data_Z= ')
disp(data_Z)

%% �������Ӿ���͵÷�
Data_top = sum([(data_Z - repmat(max(data_Z),c,1)) .^ 2 ],2) .^ 0.5;   % D+ 
Data_bottum = sum([(data_Z - repmat(min(data_Z),c,1)) .^ 2 ],2) .^ 0.5;   % D-
Score = Data_bottum./ (Data_top+Data_bottum);    % δ��һ���ĵ÷�
disp('���ĵ÷�Ϊ��')
stand_Score = Score / sum(Score)
[sorted_Score,index] = sort(stand_Score ,'descend')
