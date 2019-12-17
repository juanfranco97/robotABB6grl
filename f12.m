function [F12]= f12(t1,t2,t3,t4,t5,t6,M)
PZ=M(3,4);
t2=t2+pi/2;
F12=(600*cos(t2 + t3) + 700*sin(t2) + (65*sin(t4 - t5)*sin(t2 + t3))/2 - (65*sin(t2 + t3)*sin(t4 + t5))/2 + 65*cos(t2 + t3)*cos(t5) + 973/2)-PZ;
end
