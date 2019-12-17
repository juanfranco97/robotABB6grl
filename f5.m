function [F5]= f5(t1,t2,t3,t4,t5,t6,M)
  SY=M(2,2);
  t2=t2+pi/2;
  F5=(cos(t6)*(cos(t1)*cos(t4) + sin(t4)*(sin(t1)*sin(t2)*sin(t3) - cos(t2)*cos(t3)*sin(t1))) - sin(t6)*(cos(t5)*(cos(t1)*sin(t4) - cos(t4)*(sin(t1)*sin(t2)*sin(t3) - cos(t2)*cos(t3)*sin(t1))) - sin(t5)*(cos(t2)*sin(t1)*sin(t3) + cos(t3)*sin(t1)*sin(t2))))-SY;
end
