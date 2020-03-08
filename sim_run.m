clear

% init_data  %��ʼ������
iteration_max = 100; %����������
i_now = 0;%��ǰ��������

ps = 0.5; %��Ⱥ�������  ps Ϊ1 ʱ��ֻ��SCA��  psΪ0ʱ��ֻ��DA

popu.num = 30; %��Ⱥ���������
popu.D = 3; %��Ⱥ�и����ά
bound = [-5 5;-5 5;-5 5;-5 5;-5 5;-5 5;-5 5;-5 5]; %ÿһ�� Ϊ ÿ��ά�ȵ����޺�����
ub = 5;
lb = -5;

last_best_result = inf;

indv_rand = zeros(1,popu.num);   %Ԥ�ȷ����ڴ棬ÿ������ĳ�ʼ�������
indv_flag = zeros(1,popu.num);   %��������Ⱥ��ı��
x = zeros(popu.num,popu.D);
v = zeros(popu.num,popu.D);

Destination_position=zeros(1,popu.D); %SCA��������ֵ
SCA_best_score=inf;

Convergence_curve=zeros(1,iteration_max);
Objective_values = zeros(1,size(x,1));%

DA_best_score = inf;


for i=1:popu.num            %��Ⱥ��ʼ����ÿ������ĳ�ֵ��ÿ��������ٶ�
    for j=1:popu.D
        indv_rand(i) = rand;
        x(i,j)=bound(j,1) + indv_rand(i)*(bound(j,2)-bound(j,1));
        v(i,j)=rand;
    end

end

popu_divide

if popu1_num ~= 0
    SCA_num = size(x1_new,1);
    SCA_dim = size(x1_new,2);
    init_popu1
end
if popu2_num ~= 0
    DA_num = size(x2_new,1);
    DA_dim = size(x2_new,2);
    init_popu2
end


% main loop
t = 2;
iter = 1;
while 1
    i_now = i_now+1;
    
    popu_divide            %�ֳ�������Ⱥ
    if popu1_num ~= 0
        SCA_oneStep          %SCA�㷨����һ������
        [SCA_Best,SCA_Second,SCABest_num,SCASecond_num] = sort_solution(x1_new); %�õ���õĸ���ʹ���õĸ��壬����Ӧ���
        [SCAp_res,SCA_best_fitness,SCAp1_vnum,SCAp2_vnum] = orthogonal_design(x1_new(SCABest_num,:),x1_new(SCASecond_num,:));
    end
    if popu2_num ~= 0
%         init_popu2
        DA_oneStep             %DA�㷨����һ������
        [DA_Best,DA_Second,DABest_num,DASecond_num] = sort_solution(x2_new);
        [DAp_res,DA_best_fitness,DAp1_vnum,DAp2_vnum] = orthogonal_design(x2_new(DABest_num,:),x2_new(DASecond_num,:));
    end
    
    [P_res,P_best_fitness,SCA_pnum,DA_pnum] = orthogonal_design(SCAp_res,DAp_res);
  
    ps = SCA_pnum/(SCA_pnum+DA_pnum);
%     if i_now >10
%         ps = 0.3;
%     end
%     if i_now>20
%         ps = 0.8;
%     end
%    if i_now>50
%        ps = 1;
%    end
%    
%    if i_now>60
%        ps = 0;
%    end
%    if i_now>70
%        ps = 0.2;
%    end
%     cg_curve(iter) = P_best_fitness;

%     cg_curve(iter)=Best_score;           %����Ⱥ2�� ͼ
%     Convergence_curve(i_now)=Destination_fitness;%����Ⱥ1��ͼ
%      if DA_best_score<SCA_best_score
%          cg_curve(iter) = DA_best_score;
%      else
%          cg_curve(iter) = SCA_best_score;
%      end
     
%      best_final = SCA_best_fitness;
%      if DA_best_fitness<best_final
%          best_final = DA_best_fitness;
% %          cg_curve(iter) = DA_best_score;
%      end
%      if P_best_fitness<best_final
%          best_final = P_best_fitness;
%      end
     if P_best_fitness < last_best_result
         cg_curve(iter) = P_best_fitness;
     else
         cg_curve(iter) = last_best_result;
     end
     
    last_best_result =  cg_curve(iter);
          
%      x = x1_new;  %������Ⱥ���ºϲ�Ϊһ����Ⱥ
%      x = x2_new;        %����Ⱥ2 �ϲ�������Ⱥ
    
     count1 = 1;
     count2 = 1;
     for i=1:popu.num
         if indv_flag(i)==1
             x(i,:) = x1_new(count1,:);
             count1 = count1+1;
         else
             x(i,:) = x2_new(count2,:);
             count2 = count2+1;
         end
     end

  
    if isequal(i_now,iteration_max)
        break
    end
   
      ppsss(iter) = ps;
    % Increase the iteration counter
    t=t+1;
    iter = iter +1;
  
end

semilogy(cg_curve,'Color','b')
% semilogy(Convergence_curve,'Color','b')