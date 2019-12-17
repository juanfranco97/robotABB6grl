function [F1]=f1(t1,t2,t3,t4,t5,t6,M)
NX=M(1,1);
t2=t2+pi/2;
F1=(-sin(t6)*(cos(t4)*sin(t1)-sin(t4)*(cos(t1)*sin(t2)*sin(t3)-cos(t1)*cos(t2)*cos(t3)))-cos(t6)*(cos(t5)*(sin(t1)*sin(t4)+cos(t4)*(cos(t1)*sin(t2)*sin(t3)-cos(t1)*cos(t2)*cos(t3)))+sin(t5)*(cos(t1)*cos(t2)*sin(t3)+cos(t1)*cos(t3)*sin(t2))))-NX;
end