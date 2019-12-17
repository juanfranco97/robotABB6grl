function [kk]=Newton(M,vv)

damp=0.000001; %Incremento en Angulos por Iteración
t1=vv(1)*pi/180;
t2=vv(2)*pi/180;
t3=vv(3)*pi/180;
t4=vv(4)*pi/180;
t5=vv(5)*pi/180;
t6=vv(6)*pi/180;

for n=1:1000
  t1p=t1+damp;
  t2p=t2+damp;
  t3p=t3+damp;
  t4p=t4+damp;
  t5p=t5+damp;
  t6p=t6+damp;

  %Orientaciones Deseadas
J(1,1)=(f1(t1p,t2,t3,t4,t5,t6,M)-(f1(t1,t2,t3,t4,t5,t6,M)))/damp;
J(1,2)=(f1(t1,t2p,t3,t4,t5,t6,M)-(f1(t1,t2,t3,t4,t5,t6,M)))/damp;
J(1,3)=(f1(t1,t2,t3p,t4,t5,t6,M)-(f1(t1,t2,t3,t4,t5,t6,M)))/damp;
J(1,4)=(f1(t1,t2,t3,t4p,t5,t6,M)-(f1(t1,t2,t3,t4,t5,t6,M)))/damp;
J(1,5)=(f1(t1,t2,t3,t4,t5p,t6,M)-(f1(t1,t2,t3,t4,t5,t6,M)))/damp;
J(1,6)=(f1(t1,t2,t3,t4,t5,t6p,M)-(f1(t1,t2,t3,t4,t5,t6,M)))/damp;

J(2,1)=(f2(t1p,t2,t3,t4,t5,t6,M)-(f2(t1,t2,t3,t4,t5,t6,M)))/damp;
J(2,2)=(f2(t1,t2p,t3,t4,t5,t6,M)-(f2(t1,t2,t3,t4,t5,t6,M)))/damp;
J(2,3)=(f2(t1,t2,t3p,t4,t5,t6,M)-(f2(t1,t2,t3,t4,t5,t6,M)))/damp;
J(2,4)=(f2(t1,t2,t3,t4p,t5,t6,M)-(f2(t1,t2,t3,t4,t5,t6,M)))/damp;
J(2,5)=(f2(t1,t2,t3,t4,t5p,t6,M)-(f2(t1,t2,t3,t4,t5,t6,M)))/damp;
J(2,6)=(f2(t1,t2,t3,t4,t5,t6p,M)-(f2(t1,t2,t3,t4,t5,t6,M)))/damp;

J(3,1)=(f3(t1p,t2,t3,t4,t5,t6,M)-(f3(t1,t2,t3,t4,t5,t6,M)))/damp;
J(3,2)=(f3(t1,t2p,t3,t4,t5,t6,M)-(f3(t1,t2,t3,t4,t5,t6,M)))/damp;
J(3,3)=(f3(t1,t2,t3p,t4,t5,t6,M)-(f3(t1,t2,t3,t4,t5,t6,M)))/damp;
J(3,4)=(f3(t1,t2,t3,t4p,t5,t6,M)-(f3(t1,t2,t3,t4,t5,t6,M)))/damp;
J(3,5)=(f3(t1,t2,t3,t4,t5p,t6,M)-(f3(t1,t2,t3,t4,t5,t6,M)))/damp;
J(3,6)=(f3(t1,t2,t3,t4,t5,t6p,M)-(f3(t1,t2,t3,t4,t5,t6,M)))/damp;

J(4,1)=(f4(t1p,t2,t3,t4,t5,t6,M)-(f4(t1,t2,t3,t4,t5,t6,M)))/damp;
J(4,2)=(f4(t1,t2p,t3,t4,t5,t6,M)-(f4(t1,t2,t3,t4,t5,t6,M)))/damp;
J(4,3)=(f4(t1,t2,t3p,t4,t5,t6,M)-(f4(t1,t2,t3,t4,t5,t6,M)))/damp;
J(4,4)=(f4(t1,t2,t3,t4p,t5,t6,M)-(f4(t1,t2,t3,t4,t5,t6,M)))/damp;
J(4,5)=(f4(t1,t2,t3,t4,t5p,t6,M)-(f4(t1,t2,t3,t4,t5,t6,M)))/damp;
J(4,6)=(f4(t1,t2,t3,t4,t5,t6p,M)-(f4(t1,t2,t3,t4,t5,t6,M)))/damp;

J(5,1)=(f5(t1p,t2,t3,t4,t5,t6,M)-(f5(t1,t2,t3,t4,t5,t6,M)))/damp;
J(5,2)=(f5(t1,t2p,t3,t4,t5,t6,M)-(f5(t1,t2,t3,t4,t5,t6,M)))/damp;
J(5,3)=(f5(t1,t2,t3p,t4,t5,t6,M)-(f5(t1,t2,t3,t4,t5,t6,M)))/damp;
J(5,4)=(f5(t1,t2,t3,t4p,t5,t6,M)-(f5(t1,t2,t3,t4,t5,t6,M)))/damp;
J(5,5)=(f5(t1,t2,t3,t4,t5p,t6,M)-(f5(t1,t2,t3,t4,t5,t6,M)))/damp;
J(5,6)=(f5(t1,t2,t3,t4,t5,t6p,M)-(f5(t1,t2,t3,t4,t5,t6,M)))/damp;

J(6,1)=(f6(t1p,t2,t3,t4,t5,t6,M)-(f6(t1,t2,t3,t4,t5,t6,M)))/damp;
J(6,2)=(f6(t1,t2p,t3,t4,t5,t6,M)-(f6(t1,t2,t3,t4,t5,t6,M)))/damp;
J(6,3)=(f6(t1,t2,t3p,t4,t5,t6,M)-(f6(t1,t2,t3,t4,t5,t6,M)))/damp;
J(6,4)=(f6(t1,t2,t3,t4p,t5,t6,M)-(f6(t1,t2,t3,t4,t5,t6,M)))/damp;
J(6,5)=(f6(t1,t2,t3,t4,t5p,t6,M)-(f6(t1,t2,t3,t4,t5,t6,M)))/damp;
J(6,6)=(f6(t1,t2,t3,t4,t5,t6p,M)-(f6(t1,t2,t3,t4,t5,t6,M)))/damp;

J(7,1)=(f7(t1p,t2,t3,t4,t5,t6,M)-(f7(t1,t2,t3,t4,t5,t6,M)))/damp;
J(7,2)=(f7(t1,t2p,t3,t4,t5,t6,M)-(f7(t1,t2,t3,t4,t5,t6,M)))/damp;
J(7,3)=(f7(t1,t2,t3p,t4,t5,t6,M)-(f7(t1,t2,t3,t4,t5,t6,M)))/damp;
J(7,4)=(f7(t1,t2,t3,t4p,t5,t6,M)-(f7(t1,t2,t3,t4,t5,t6,M)))/damp;
J(7,5)=(f7(t1,t2,t3,t4,t5p,t6,M)-(f7(t1,t2,t3,t4,t5,t6,M)))/damp;
J(7,6)=(f7(t1,t2,t3,t4,t5,t6p,M)-(f7(t1,t2,t3,t4,t5,t6,M)))/damp;

J(8,1)=(f8(t1p,t2,t3,t4,t5,t6,M)-(f8(t1,t2,t3,t4,t5,t6,M)))/damp;
J(8,2)=(f8(t1,t2p,t3,t4,t5,t6,M)-(f8(t1,t2,t3,t4,t5,t6,M)))/damp;
J(8,3)=(f8(t1,t2,t3p,t4,t5,t6,M)-(f8(t1,t2,t3,t4,t5,t6,M)))/damp;
J(8,4)=(f8(t1,t2,t3,t4p,t5,t6,M)-(f8(t1,t2,t3,t4,t5,t6,M)))/damp;
J(8,5)=(f8(t1,t2,t3,t4,t5p,t6,M)-(f8(t1,t2,t3,t4,t5,t6,M)))/damp;
J(8,6)=(f8(t1,t2,t3,t4,t5,t6p,M)-(f8(t1,t2,t3,t4,t5,t6,M)))/damp;

J(9,1)=(f9(t1p,t2,t3,t4,t5,t6,M)-(f9(t1,t2,t3,t4,t5,t6,M)))/damp;
J(9,2)=(f9(t1,t2p,t3,t4,t5,t6,M)-(f9(t1,t2,t3,t4,t5,t6,M)))/damp;
J(9,3)=(f9(t1,t2,t3p,t4,t5,t6,M)-(f9(t1,t2,t3,t4,t5,t6,M)))/damp;
J(9,4)=(f9(t1,t2,t3,t4p,t5,t6,M)-(f9(t1,t2,t3,t4,t5,t6,M)))/damp;
J(9,5)=(f9(t1,t2,t3,t4,t5p,t6,M)-(f9(t1,t2,t3,t4,t5,t6,M)))/damp;
J(9,6)=(f9(t1,t2,t3,t4,t5,t6p,M)-(f9(t1,t2,t3,t4,t5,t6,M)))/damp;

%Posiciones Deseadas
J(10,1)=(f10(t1p,t2,t3,t4,t5,t6,M)-(f10(t1,t2,t3,t4,t5,t6,M)))/damp;
J(10,2)=(f10(t1,t2p,t3,t4,t5,t6,M)-(f10(t1,t2,t3,t4,t5,t6,M)))/damp;
J(10,3)=(f10(t1,t2,t3p,t4,t5,t6,M)-(f10(t1,t2,t3,t4,t5,t6,M)))/damp;
J(10,4)=(f10(t1,t2,t3,t4p,t5,t6,M)-(f10(t1,t2,t3,t4,t5,t6,M)))/damp;
J(10,5)=(f10(t1,t2,t3,t4,t5p,t6,M)-(f10(t1,t2,t3,t4,t5,t6,M)))/damp;
J(10,6)=(f10(t1,t2,t3,t4,t5,t6p,M)-(f10(t1,t2,t3,t4,t5,t6,M)))/damp;

J(11,1)=(f11(t1p,t2,t3,t4,t5,t6,M)-(f11(t1,t2,t3,t4,t5,t6,M)))/damp;
J(11,2)=(f11(t1,t2p,t3,t4,t5,t6,M)-(f11(t1,t2,t3,t4,t5,t6,M)))/damp;
J(11,3)=(f11(t1,t2,t3p,t4,t5,t6,M)-(f11(t1,t2,t3,t4,t5,t6,M)))/damp;
J(11,4)=(f11(t1,t2,t3,t4p,t5,t6,M)-(f11(t1,t2,t3,t4,t5,t6,M)))/damp;
J(11,5)=(f11(t1,t2,t3,t4,t5p,t6,M)-(f11(t1,t2,t3,t4,t5,t6,M)))/damp;
J(11,6)=(f11(t1,t2,t3,t4,t5,t6p,M)-(f11(t1,t2,t3,t4,t5,t6,M)))/damp;

J(12,1)=(f12(t1p,t2,t3,t4,t5,t6,M)-(f12(t1,t2,t3,t4,t5,t6,M)))/damp;
J(12,2)=(f12(t1,t2p,t3,t4,t5,t6,M)-(f12(t1,t2,t3,t4,t5,t6,M)))/damp;
J(12,3)=(f12(t1,t2,t3p,t4,t5,t6,M)-(f12(t1,t2,t3,t4,t5,t6,M)))/damp;
J(12,4)=(f12(t1,t2,t3,t4p,t5,t6,M)-(f12(t1,t2,t3,t4,t5,t6,M)))/damp;
J(12,5)=(f12(t1,t2,t3,t4,t5p,t6,M)-(f12(t1,t2,t3,t4,t5,t6,M)))/damp;
J(12,6)=(f12(t1,t2,t3,t4,t5,t6p,M)-(f12(t1,t2,t3,t4,t5,t6,M)))/damp;

f(1)=f1(t1,t2,t3,t4,t5,t6,M);
f(2)=f2(t1,t2,t3,t4,t5,t6,M); 
f(3)=f3(t1,t2,t3,t4,t5,t6,M); 
f(4)=f4(t1,t2,t3,t4,t5,t6,M); 
f(5)=f5(t1,t2,t3,t4,t5,t6,M); 
f(6)=f6(t1,t2,t3,t4,t5,t6,M); 
f(7)=f7(t1,t2,t3,t4,t5,t6,M); 
f(8)=f8(t1,t2,t3,t4,t5,t6,M); 
f(9)=f9(t1,t2,t3,t4,t5,t6,M); 
f(10)=f10(t1,t2,t3,t4,t5,t6,M); 
f(11)=f11(t1,t2,t3,t4,t5,t6,M); 
f(12)=f12(t1,t2,t3,t4,t5,t6,M); 

%ds= -J/f';
ds=pinv(J)*(-f');
 t1=t1+ds(1);
 t2=t2+ds(2);
 t3=t3+ds(3);
 t4=t4+ds(4);
 t5=t5+ds(5);
 t6=t6+ds(6);
 
 t=[t1 t2 t3 t4 t5 t6];
 kk=t*180/pi;

 if (abs(f(1))<1.0e-9 && abs(f(2))<1.0e-9 && abs(f(3))<1.0e-9 && abs(f(4))<1.0e-9 && abs(f(5))<1.0e-9 && abs(f(6))<1.0e-9 && abs(f(7))<1.0e-9 && abs(f(8))<1.0e-9 && abs(f(9))<1.0e-9 && abs(f(10))<1.0e-9 && abs(f(11))<1.0e-9 && abs(f(12))<1.0e-9),break;end%if
end
while kk(1,1)<-360
  kk(1,1)=kk(1,1)+360;
end
while kk(1,1)>360
  kk(1,1)=kk(1,1)-360;
end

while kk(1,2)<-360
  kk(1,2)=kk(1,2)+360;
end
while kk(1,2)>360
  kk(1,2)=kk(1,2)-360;
end

while kk(1,3)<-360
  kk(1,3)=kk(1,3)+360;
end
while kk(1,3)>360
  kk(1,3)=kk(1,3)-360;
end

 while kk(1,4)<-360
  kk(1,4)=kk(1,4)+360;
 end
while kk(1,4)>360
  kk(1,4)=kk(1,4)-360;
end

while kk(1,5)<-360
  kk(1,5)=kk(1,5)+360;
end
while kk(1,5)>360
  kk(1,5)=kk(1,5)-360;
end

while kk(1,6)<-360
  kk(1,6)=kk(1,6)+360;
end
while kk(1,6)>360
  kk(1,6)=kk(1,6)-360;
end

end
