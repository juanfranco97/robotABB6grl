function [F8]= f8(t1,t2,t3,t4,t5,t6,M)
  AY=M(2,3);
  t2=t2+pi/2;
F8=(sin(t5)*(cos(t1)*sin(t4) - cos(t4)*(sin(t1)*sin(t2)*sin(t3) - cos(t2)*cos(t3)*sin(t1))) + cos(t5)*(cos(t2)*sin(t1)*sin(t3) + cos(t3)*sin(t1)*sin(t2)))-AY;
end
