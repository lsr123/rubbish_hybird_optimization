popu1_num = 0;
popu2_num = 0;
for i=1:popu.num               %��Ⱥ����  ��־   
     if indv_rand(i) < ps
        indv_flag(i) = 1; %����������Ⱥ1
        popu1_num = popu1_num+1;
     else
         indv_flag(i) = 2; %����������Ⱥ2
         popu2_num = popu2_num+1;
     end
end
    
kk = 1;
jj = 1;
x1_new = zeros(popu1_num,popu.D);
x2_new = zeros(popu2_num,popu.D);

% for i=1:popu.num         %���䵽������Ⱥ��
%     if eq(indv_flag(i),1)
%        x1_new(k,:) =  x(i,:);
%        k = k + 1;
%     else
%         x2_new(j,:) = x(i,:);
%         j = j + 1;
%     end
% end

for i=1:popu.num         %���䵽������Ⱥ��
    if indv_rand(i) < ps
       x1_new(kk,:) =  x(i,:);
       kk = kk + 1;
    else
        x2_new(jj,:) = x(i,:);
        jj = jj + 1;
    end
end

