function [ Best_solution,Second_Bsolution,Best_num,Second_num] = sort_solution(X)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%Best_solution ��ø�������� 
%Second_Bsolution �ڶ��ø��������
%Best_num ��һ�ø��� ����һ������
%Second_num �ڶ��ø�������һ������
for i=1:size(X,1)
    p1_new_fitness(i) = get_fitness(X(i,:));
end


[res1,res2]=sort(p1_new_fitness);
Best_solution = res1(1);
Second_Bsolution = res1(2);
Best_num = res2(1);
Second_num = res2(2);

end

