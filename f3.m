function [F3]= f3(t1,t2,t3,t4,t5,t6,M)
  NZ=M(3,1);
 t2=t2+pi/2;
F3=(sin(t2 + t3)*sin(t4)*sin(t6) - cos(t6)*(cos(t2 + t3)*sin(t5) + sin(t2 + t3)*cos(t4)*cos(t5)))-NZ;
end