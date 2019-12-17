function [F6]= f6(t1,t2,t3,t4,t5,t6,M)
  SZ=M(3,2);
  t2=t2+pi/2;
F6=(sin(t6)*(cos(t2 + t3)*sin(t5) + sin(t2 + t3)*cos(t4)*cos(t5)) + sin(t2 + t3)*cos(t6)*sin(t4))-SZ;
end
