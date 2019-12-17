function [F9]= f9(t1,t2,t3,t4,t5,t6,M)
  AZ=M(3,3);
  t2=t2+pi/2;
F9=(cos(t2 + t3)*cos(t5) - sin(t2 + t3)*cos(t4)*sin(t5))-AZ;
end

