function [F11]= f11(t1,t2,t3,t4,t5,t6,M)
PY=M(2,4);
t2=t2+pi/2;
F11=(150*sin(t1) - 700*cos(t2)*sin(t1) + 65*sin(t5)*(cos(t1)*sin(t4) + cos(t2)*cos(t3)*cos(t4)*sin(t1) - cos(t4)*sin(t1)*sin(t2)*sin(t3)) + 600*cos(t2)*sin(t1)*sin(t3) + 600*cos(t3)*sin(t1)*sin(t2) + 65*sin(t2 + t3)*cos(t5)*sin(t1))-PY;
end

