function [F10]= f10(t1,t2,t3,t4,t5,t6,M)
  PX=M(1,4);
  t2=t2+pi/2;
F10=(150*cos(t1) - 700*cos(t1)*cos(t2) - 65*sin(t5)*(sin(t1)*sin(t4) - cos(t1)*cos(t2)*cos(t3)*cos(t4) + cos(t1)*cos(t4)*sin(t2)*sin(t3)) + 65*sin(t2 + t3)*cos(t1)*cos(t5) + 600*cos(t1)*cos(t2)*sin(t3) + 600*cos(t1)*cos(t3)*sin(t2))-PX;
end

