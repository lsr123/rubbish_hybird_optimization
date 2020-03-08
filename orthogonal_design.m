function [out_p,best_result,p1_num,p2_num] = orthogonal_design(p1,p2)
%ORTHOGONAL_DESIGN.M �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%best_result Ϊ����ʵ�������� fitness
%p1 p2 Ϊ�������������
% out_p Ϊ����������� p1_num Ϊ���������p1�����ĸ�����p2_numΪ���������p2�����ĸ���
  a = p1;
  b = [p1(1) p2(2) p2(3)];
  c = [p2(1) p1(2) p2(3)];
  d = [p2(1) p2(2) p1(1)];
  
  a_fitness = get_fitness(a);
  b_fitness = get_fitness(b);
  c_fitness = get_fitness(c);
  d_fitness = get_fitness(d);
    
  K1a = (a_fitness + b_fitness)/2;
  K1b = (a_fitness + c_fitness)/2;
  K1c = (a_fitness + d_fitness)/2;
  K2a = (c_fitness + d_fitness)/2;
  K2b = (b_fitness + d_fitness)/2;
  K2c = (b_fitness + c_fitness)/2;

  count_p1 = 0;  %��һ��������У�����p1�ķ����м���
  if K1a<K2a
      out_p(1) = p1(1);
      count_p1 = count_p1+1;
  else
      out_p(1) = p2(1);
  end
  
  if K1b<K2b
      out_p(2) = p1(2);
      count_p1 = count_p1+1;
  else
      out_p(2) = p2(2);
  end
  
  if K1c<K2c
      out_p(3) = p1(3);
      count_p1 = count_p1+1;
  else
      out_p(3) = p2(3);
  end
  
  out_p_fitness = get_fitness(out_p);
  p1_num = count_p1;
  p2_num = 3 - p1_num;
  
  best_result = a_fitness;
  if out_p_fitness<best_result
      best_result = out_p_fitness;
  end
    
    
  
end

