function [F7]= f7(t1,t2,t3,t4,t5,t6,M)
  AX=M(1,3);
  t2=t2+pi/2;
F7=(cos(t5)*(cos(t1)*cos(t2)*sin(t3) + cos(t1)*cos(t3)*sin(t2)) - sin(t5)*(sin(t1)*sin(t4) + cos(t4)*(cos(t1)*sin(t2)*sin(t3) - cos(t1)*cos(t2)*cos(t3))))-AX;
end
