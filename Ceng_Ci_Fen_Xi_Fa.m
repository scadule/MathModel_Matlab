%% ���ǲ�η������Ĵ���
%% ע�⣺������д���У�Ӧ���ȶ��жϾ������һ���Լ��飬Ȼ���ټ���Ȩ�أ���Ϊֻ���жϾ���ͨ����һ���Լ��飬��Ȩ�ز���������ġ�
%% ������Ĵ����У������ȼ�����Ȩ�أ�Ȼ���ٽ�����һ���Լ��飬����Ϊ��˳Ӧ������̣���ʵ�����߼�����˵����ȥ�ġ�
%% ��˴���Լ�д����������õ��˲�η�������һ��Ҫ�ȶ��жϾ������һ���Լ��顣
%% ����Ҫ˵�����ǣ�ֻ�з�һ�¾�����жϾ������Ҫ����һ���Լ��顣
%% �������жϾ���������һ��һ�¾�����ô��û�б�Ҫ����һ���Լ��顣
%% �����жϾ���
clear;clc
disp('�������жϾ���A�� ')
%������жϾ����Լ������޸�
%A=[];

A =[1 1 4 1/3 3;
 1 1 4 1/3 3;
 1/4 1/4 1 1/3 1/2;
 3 3 3 1 3;
 1/3 1/3 2 1/3 1]

%% ����1������ƽ������Ȩ��
% �жϾ����һ��
Sum_A = sum(A)

[n,n] = size(A)  
SUM_A = repmat(Sum_A,n,1)   %repeat matrix����д
% ����һ������ķ������£�
    SUM_A = [];
    for i = 1:n   %ѭ��Ŷ����һ�к��治�ܼ�ð�ţ���Python��ͬ���������ʾѭ��n��
        SUM_A = [SUM_A; Sum_A];
    end
clc;

%���
Stand_A = A ./ SUM_A;


% �ڶ���������һ���ĸ������(�������)
sum(Stand_A,2)

% ������������Ӻ�õ���������ÿ��Ԫ�س���n���ɵõ�Ȩ������
disp('����ƽ������Ȩ�صĽ��Ϊ��');
disp(sum(Stand_A,2) / n)
% ���ȶԱ�׼����ľ���������ͣ��õ�һ��������
% Ȼ���ٽ������������ÿ��Ԫ��ͬʱ����n���ɣ�ע������Ҳ������./Ŷ��

%% ����2������ƽ������Ȩ��
% ��A��Ԫ�ذ�����˵�һ���µ�������
clc;A
Prduct_A = prod(A,2)

% ���µ�������ÿ��������n�η�
Prduct_n_A = Prduct_A .^ (1/n)
% �Ը����������й�һ�����ɵõ�Ȩ������
% ������������е�ÿһ��Ԫ�س���һ�������ĺͼ���
disp('����ƽ������Ȩ�صĽ��Ϊ��');
disp(Prduct_n_A ./ sum(Prduct_n_A))

%% ����3������ֵ����Ȩ��
% �������A���������ֵ�Լ����Ӧ����������
clc
[V,D] = eig(A)   %V����������, D��������ֵ���ɵĶԽǾ��󣨳��˶Խ���Ԫ���⣬����λ��Ԫ��ȫΪ0��
Max_eig = max(max(D)) %Ҳ����д��max(D(:))Ŷ~
% ��ʱ������õ������볣���Ĵ�С�ж�����
D == Max_eig
[r,c] = find(D == Max_eig , 1)
% �ҵ�D�е�һ�����������ֵ��ȵ�Ԫ�ص�λ�ã���¼�����к��С�

% ������������������й�һ�����ɵõ����ǵ�Ȩ��
V(:,c)
disp('����ֵ����Ȩ�صĽ��Ϊ��');
disp( V(:,c) ./ sum(V(:,c)) )
% �����ȸ��������ҵ����������ֵ������c�ҵ���Ӧ������������Ȼ���ٽ��б�׼����

%% ����һ���Ա���CR
clc
CI = (Max_eig - n) / (n-1);
RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];  %ע��Ŷ�������RI���֧�� n = 15
CR=CI/RI(n);
disp('һ����ָ��CI=');disp(CI);
disp('һ���Ա���CR=');disp(CR);
if CR<0.10
    disp('��ΪCR < 0.10�����Ը��жϾ���A��һ���Կ��Խ���!');
else
    disp('ע�⣺CR >= 0.10����˸��жϾ���A��Ҫ�����޸�!');
end