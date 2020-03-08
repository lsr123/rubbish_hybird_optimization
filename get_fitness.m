
function output = get_fitness(X)
%GET_FITNESS 此处显示有关此函数的摘要
%   此处显示详细说明
% X
% for i=1:size(X,2)
%     output = output+X(i)*X(i);
% end
output = sum(X.^2);
% output = sum(abs(X))+prod(abs(X));
% output=max(abs(X));
end

