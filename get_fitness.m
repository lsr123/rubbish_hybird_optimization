
function output = get_fitness(X)
%GET_FITNESS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% X
% for i=1:size(X,2)
%     output = output+X(i)*X(i);
% end
output = sum(X.^2);
% output = sum(abs(X))+prod(abs(X));
% output=max(abs(X));
end

