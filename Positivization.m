function [posit_x] = Positivization(x,class,i)
%% �������˵����
% x:��Ҫ���򻯵�ԭʼ������
% class:ָ������
% i:��ʾ���ڴ���ǰ�е�λ��
% �������ʱ���򻯺��������
%% ���Ĵ���
    if class == 1  %�ǲ��Ǽ�С��
        disp(['��' num2str(i) '���Ǽ�С�ͣ�����ing'] )
        posit_x = Min2Max(x);  %����Min2Max����������
        disp(['��' num2str(i) '�м�С������end'] )
        disp('~~~~~~~~~~~~~~~~~~~~�ֽ���~~~~~~~~~~~~~~~~~~~~')
    elseif class == 2  %�ǲ����м���
        disp(['��' num2str(i) '�����м���'] )
        best = input('���������ֵ�� ');
        posit_x = Mid2Max(x,best);
        disp(['��' num2str(i) '���м������򻯴�end'] )
        disp('----------------�ֽ���-----------------')
    elseif class == 3  %�ǲ���������
        disp(['��' num2str(i) '����������'] )
        a = input('������������½磺 ');
        b = input('������������Ͻ磺 '); 
        posit_x = Inter2Max(x,a,b);
        disp(['��' num2str(i) '������������end'] )
        disp('~----------------�ֽ���-----------------')
    else
        disp('û���������͵�ָ�꣬����class�������Ƿ��г���1��2��3֮�������ֵ')
    end
end