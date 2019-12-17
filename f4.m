function [F4]= f4(t1,t2,t3,t4,t5,t6,M)
  SX=M(1,2);
  t2=t2+pi/2;
F4=(sin(t6)*(cos(t5)*(sin(t1)*sin(t4) + cos(t4)*(cos(t1)*sin(t2)*sin(t3) - cos(t1)*cos(t2)*cos(t3))) + sin(t5)*(cos(t1)*cos(t2)*sin(t3) + cos(t1)*cos(t3)*sin(t2))) - cos(t6)*(cos(t4)*sin(t1) - sin(t4)*(cos(t1)*sin(t2)*sin(t3) - cos(t1)*cos(t2)*cos(t3))))-SX;
end
