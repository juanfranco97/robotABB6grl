function [P06]=RABB(ttas)
  teta1=ttas(1,1);
  teta2=ttas(1,2)+90;
  teta3=ttas(1,3);
  teta4=ttas(1,4);
  teta5=ttas(1,5);
  teta6=ttas(1,6);
P0=[1 0 0 0;0 1 0 0;0 0 1 0; 0 0 0 1];
a=-2000;
axis([a -a a -a a -a])

PA=TX(0,0,486.5)*RZ(0);
line([0 PA(1,4)],[0 PA(2,4)],[0 PA(3,4)],'color','black','linewidth',2);

P01=TX(0,0,486.5)*RZ(teta1)*TX(150,0,0)*RX(-90);
line([PA(1,4) P01(1,4)],[PA(2,4) P01(2,4)],[PA(3,4) P01(3,4)],'color','black','linewidth',2);

P12=TX(0,0,0)*RZ(teta2)*TX(-700,0,0)*RX(0);
P02=P01*P12;
line([P01(1,4) P02(1,4)],[P01(2,4) P02(2,4)],[P01(3,4) P02(3,4)],'color','black','linewidth',2);

P23=TX(0,0,0)*RZ(teta3)*TX(0,0,0)*RX(90);
P03=P01*P12*P23;
line([P02(1,4) P03(1,4)],[P02(2,4) P03(2,4)],[P02(3,4) P03(3,4)],'color','black','linewidth',2);

P34=TX(0,0,600)*RZ(teta4)*TX(0,0,0)*RX(-90);
P04=P01*P12*P23*P34;
line([P03(1,4) P04(1,4)],[P03(2,4) P04(2,4)],[P03(3,4) P04(3,4)],'color','black','linewidth',2);

P45=TX(0,0,0)*RZ(teta5)*TX(0,0,0)*RX(90);
P05=P01*P12*P23*P34*P45;
line([P04(1,4) P05(1,4)],[P04(2,4) P05(2,4)],[P04(3,4) P05(3,4)],'color','black','linewidth',2);

P56=TX(0,0,65)*RZ(teta6)*TX(0,0,0)*RX(0);
P06=P01*P12*P23*P34*P45*P56;
line([P05(1,4) P06(1,4)],[P05(2,4) P06(2,4)],[P05(3,4) P06(3,4)],'color','black','linewidth',2);

hold on
grid on 
EjesMovil(P0)
EjesMovil(P01)
%EjesMovil(P02)
%EjesMovil(P03)
%EjesMovil(P04)
%EjesMovil(P05)
EjesMovil(P06)

hold off
end
