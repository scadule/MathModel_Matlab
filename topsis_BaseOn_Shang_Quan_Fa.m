%% ������Ȩ����Topsis������

%% ���ݵ�����
clc,clear all;
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
     disp('���򻯺�ľ��� data_X =  ')
    disp(data_X)
end

%% ��׼���������򻯺�ģ�
data_Z= data_X ./ repmat(sum(data_X.*data_X) .^ 0.5, c, 1);
disp('��׼������ data_data_Z= ')
disp(data_Z)

%% �Ƿ���Ҫ����Ȩ����
disp(" �Ƿ���Ҫ����Ȩ������Ҫ��1�����ð�0")
Judgement = input('�����룺 ');
if Judgement == 1
    Judgement = input('ʹ����Ȩ��ȷ��Ȩ��������1����������0�� ');
    if Judgement == 1
        if sum(sum(data_Z<0)) >0   % ��Ȩ���ǲ����и�����
            disp('ԭ����׼���õ���Z�����д��ڸ�����������Ҫ��X���±�׼��')
            for i = 1:c
                for j = 1:r
                    data_Z(i,j) = [data_X(i,j) - min(data_X(:,j))] / [max(data_X(:,j)) - min(data_X(:,j))];
                end
            end
            disp('data_X���½��б�׼�����data_ZΪ:  ')
            disp(data_Z)
        end
        data_weight = Entropy_Method(data_Z);
        disp('��Ȩ��ȷ����Ȩ��Ϊ��')
        disp(data_weight)
    else
        disp(['�������3ָ�꣬����Ҫ����3Ȩ�أ������Ƿֱ�Ϊ0.35,0.45,0.20, ������Ҫ����[0.35,0.45,0.20]']);
        data_weight = input(['����Ҫ����' num2str(r) '��Ȩ����' '��������������ʽ������' num2str(r) '��Ȩ��: ']);
        ISOK = 0;  % �����ж��û��������ʽ�Ƿ���ȷ
        while ISOK == 0 
            if abs(sum(data_weight) -1)<0.000001 && size(data_weight,1) == 1 && size(data_weight,2) == m  % ע�⣬Matlab�и������ıȽ�ҪС��
                ISOK =1;%��ʽ��ȷ
            else
                data_weight = input('���������������������Ȩ��������: ');%������ʾ
            end
        end
    end
else
    data_weight = ones(1,r) ./ r ; %�������Ĭ��Ȩ����ͬ
end

%% ���Ĳ������������ֵ�ľ������Сֵ�ľ��룬������÷�
D_top = sum([(data_Z - repmat(max(data_Z),c,1)) .^ 2 ] .* repmat(data_weight,c,1) ,2) .^ 0.5;   % D+ �����ֵ�ľ�������
D_bottom = sum([(data_Z - repmat(min(data_Z),c,1)) .^ 2 ] .* repmat(data_weight,c,1) ,2) .^ 0.5;   % D- ����Сֵ�ľ�������
D_S = D_bottom ./ (D_top+D_bottom);    % δ��һ���ĵ÷�
disp('���ĵ÷�Ϊ��')
st_S = D_S / sum(D_S)
[sort_S,index] = sort(st_S ,'descend')






