clc
close
delete(instrfind({'Port'},{'COM3'}));
s= serial('COM3','BaudRate',9600);
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
fopen(s);
h=0;
ma=0;
na=0;
programa=[0,0,0,0,0,0,0,0,0,0];
%Valores de inicio en las articulaciones
tet1=0;
tet2=0;
tet3=0;
tet4=0;
tet5=0;
tet6=0;

% % %   w=1;
  aux=1;
  ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
  %View
  AZ=45;
  EL=30;
  view(AZ,EL)
 [T06]=RABB(ttas);
 TPos=T06;
for p=0:1:80
    fscanf(s);
    pause(.1);
    disp('conectando')
    if p==80
       while 1
       a=fscanf(s);
       b=str2num(a);
       l=b(1,4); 
       disp('menu de tipos de movimientos ')% enu de tipo de movimiento 
     % g=b(1,5); %sub menu del tool y world
          switch l
             case 10000
                break;
             case 1111
                while 1
                   z=fscanf(s);
                   y=str2num(z);
                   e=y(1,3);
                   disp('menu de movimiento join')
                   switch e
                      case 10000
                         break;
                      case 1020
                         while 1
                         x=fscanf(s);
                         w=str2num(x);
                         c=w(1,1);%joystick1
                         d=w(1,2); %joystick2
                         disp('moviendo ariculaciones 1-2')
                            if c==10000
                               break;
                            elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                            elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                               while 1
                                   tet1=tet1-1;
                                   u=fscanf(s);
                                   v=str2num(u);
                                   c=v(1,1);
                                   d=v(1,2);
                                   clf
                                   ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                   [T06]=RABB(ttas);
                                   TPos=T06;
                                   if (c>500)||(c<350)||(d>600)||(d<400)
                                       break;
                                   end
                               end    
                            elseif (c<350)&&(c>150)&&(d<600)&&(d>400)%if joy1 es medio y negativo 
                                  while 1
                                      tet1=tet1-2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      if (c>350)||(c<150)||(d>600)||(d<400)
                                        break;
                                      end
                                  end
                            elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                  while 1
                                      tet1=tet1-4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (c>150)||(d>600)||(d<400)
                                          break;
                                      end
                                  end
                            elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                  while 1
                                      tet1=tet1+1;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (c<500)||(c>650)||(d>600)||(d<400)
                                         break;
                                     end
                                  end    
                            elseif (c>650)&&(c<850)&&(d<600)&&(d>400)   %if joy1 es medio y positivo 
                                  while 1
                                      tet1=tet1+2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      [T06]=RABB([tet1 tet2 tet3 tet4 tet5 tet6]);
                                      
                                      pause(.0001)
                                      if (c<650)||(c>850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                            elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      tet1=tet1+4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                            elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                  while 1
                                      tet2=tet2-1;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d>500)||(d<350)||(c>600)||(c<400)
                                         break;
                                      end
                                  end    
                            elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                  while 1
                                      tet2=tet2-2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d>350)||(d<150)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                 while 1
                                     tet2=tet2-4;
                                     u=fscanf(s);
                                     v=str2num(u);
                                     c=v(1,1);
                                     d=v(1,2);
                                     clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (d>150)||(c>600)||(c<400)
                                         break;
                                     end
                                 end
                            elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                 while 1
                                     tet2=tet2+1;
                                     u=fscanf(s);
                                     v=str2num(u);
                                     c=v(1,1);
                                     d=v(1,2);
                                     clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (d<500)||(d>650)||(c>600)||(c<400)
                                         break;
                                     end
                                 end    
                            elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                  while 1
                                      tet2=tet2+2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d<650)||(d>850)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                  while 1
                                      tet2=tet2+4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d<850)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            end
                         end 
                   
                          
                   case 3040%eje 3 y 4
                       while 1
                         x=fscanf(s);
                         w=str2num(x);
                         c=w(1,1);%joystick1
                         d=w(1,2); %joystick2
                         disp('moviendo articulaciones 3-4')
                            if c==10000
                               break;
                            elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                            elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                               while 1
                                   tet3=tet3-1;
                                   u=fscanf(s);
                                   v=str2num(u);
                                   c=v(1,1);
                                   d=v(1,2);
                                   clf
                                   ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                   [T06]=RABB(ttas);
                                   TPos=T06;
                                   if (c>500)||(c<350)||(d>600)||(d<400)
                                       break;
                                   end
                               end    
                            elseif (c<350)&&(c>150)&&(d<600)&&(d>400)%if joy1 es medio y negativo 
                                  while 1
                                      tet3=tet3-2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      if (c>350)||(c<150)||(d>600)||(d<400)
                                        break;
                                      end
                                  end
                            elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                  while 1
                                      tet3=tet3-4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (c>150)||(d>600)||(d<400)
                                          break;
                                      end
                                  end
                            elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                  while 1
                                      tet3=tet3+1;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (c<500)||(c>650)||(d>600)||(d<400)
                                         break;
                                     end
                                  end    
                            elseif (c>650)&&(c<850)&&(d<600)&&(d>400)   %if joy1 es medio y positivo 
                                  while 1
                                      tet3=tet3+2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      [T06]=RABB([tet1 tet2 tet3 tet4 tet5 tet6]);
                                      
                                      pause(.0001)
                                      if (c<650)||(c>850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                            elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      tet3=tet3+4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                            elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                  while 1
                                      tet4=tet4-1;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d>500)||(d<350)||(c>600)||(c<400)
                                         break;
                                      end
                                  end    
                            elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                  while 1
                                      tet4=tet4-2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d>350)||(d<150)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                 while 1
                                     tet4=tet4-4;
                                     u=fscanf(s);
                                     v=str2num(u);
                                     c=v(1,1);
                                     d=v(1,2);
                                     clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (d>150)||(c>600)||(c<400)
                                         break;
                                     end
                                 end
                            elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                 while 1
                                     tet4=tet4+1;
                                     u=fscanf(s);
                                     v=str2num(u);
                                     c=v(1,1);
                                     d=v(1,2);
                                     clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (d<500)||(d>650)||(c>600)||(c<400)
                                         break;
                                     end
                                 end    
                            elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                  while 1
                                      tet4=tet4+2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d<650)||(d>850)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                  while 1
                                      tet4=tet4+4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d<850)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            end
                       end 
                     
                    
                   case 5060
                       while 1
                         x=fscanf(s);
                         w=str2num(x);
                         c=w(1,1);%joystick1
                         d=w(1,2); %joystick2
                         disp('mociendo articulaciones 5-6')
                            if c==10000
                               break;
                            elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                            elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                               while 1
                                   tet5=tet5-1;
                                   u=fscanf(s);
                                   v=str2num(u);
                                   c=v(1,1);
                                   d=v(1,2);
                                   clf
                                   ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                   [T06]=RABB(ttas);
                                   TPos=T06;
                                   if (c>500)||(c<350)||(d>600)||(d<400)
                                       break;
                                   end
                               end    
                            elseif (c<350)&&(c>150)&&(d<600)&&(d>400)%if joy1 es medio y negativo 
                                  while 1
                                      tet5=tet5-2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      if (c>350)||(c<150)||(d>600)||(d<400)
                                        break;
                                      end
                                  end
                            elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                  while 1
                                      tet5=tet5-4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (c>150)||(d>600)||(d<400)
                                          break;
                                      end
                                  end
                            elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                  while 1
                                      tet5=tet5+1;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (c<500)||(c>650)||(d>600)||(d<400)
                                         break;
                                     end
                                  end    
                            elseif (c>650)&&(c<850)&&(d<600)&&(d>400)   %if joy1 es medio y positivo 
                                  while 1
                                      tet5=tet5+2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      [T06]=RABB([tet1 tet2 tet3 tet4 tet5 tet6]);
                                      
                                      pause(.0001)
                                      if (c<650)||(c>850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                            elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      tet5=tet5+4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                            elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                  while 1
                                      tet6=tet6-1;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d>500)||(d<350)||(c>600)||(c<400)
                                         break;
                                      end
                                  end    
                            elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                  while 1
                                      tet6=tet6-2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d>350)||(d<150)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                 while 1
                                     tet6=tet6-4;
                                     u=fscanf(s);
                                     v=str2num(u);
                                     c=v(1,1);
                                     d=v(1,2);
                                     clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (d>150)||(c>600)||(c<400)
                                         break;
                                     end
                                 end
                            elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                 while 1
                                     tet6=tet6+1;
                                     u=fscanf(s);
                                     v=str2num(u);
                                     c=v(1,1);
                                     d=v(1,2);
                                     clf
                                     ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                     [T06]=RABB(ttas);
                                     TPos=T06;
                                     pause(.0001)
                                     if (d<500)||(d>650)||(c>600)||(c<400)
                                         break;
                                     end
                                 end    
                            elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                  while 1
                                      tet6=tet6+2;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d<650)||(d>850)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                  while 1
                                      tet6=tet6+4;
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);
                                      clf
                                      ttas=[tet1 tet2 tet3 tet4 tet5 tet6];
                                      [T06]=RABB(ttas);
                                      TPos=T06;
                                      pause(.0001)
                                      if (d<850)||(c>600)||(c<400)
                                         break;
                                      end
                                  end
                            end
                       end 
                       
                   end  
                  
                end
             %eje fijo = la matris de ese movimiento * matris resultante
             %eje movil =la matris resultante  * matris de ese movimiento
             case 2222 %tool
                 while 1
                     r=fscanf(s);
                     j=str2num(r);
                     g=j(1,5);
                     disp('menu de tool')
                     switch g
                         case 10000
                             break;
                         case 2525%x
                          while 1
                            x=fscanf(s);
                            w=str2num(x);
                            c=w(1,1);%joystick1
                            d=w(1,2); %joystick2
                            disp('moviendo en x')
                               if (c==10000)||(d==10000)
                                  break;
                               elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                               elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                                  while 1
                                      h=h-1;
                                      pause(.1)
                                      Rxb=RX(h);
                                      TNa=TPos*Rxb;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                    
                                      TPos=TNa;
                                      if (c>500)||(c<350)||(d>600)||(d<400)
                                          break;
                                      end
                                  end    
                               elseif (c<350)&&(c>150)&&(d<600)&&(d>400) %if joy1 es medio y negativo 
                                     while 1
                                         h=h-2;
                                         pause(.1)
                                         Rxb=RX(h);
                                         TNa=TPos*Rxb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>350)||(c<150)||(d>600)||(d<400)
                                           break;
                                         end
                                     end
                                elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                     while 1
                                         h=h-4;
                                         pause(.1)
                                         Rxb=RX(h);
                                         TNa=TPos*Rxb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>150)||(d>600)||(d<400)
                                             break;
                                         end
                                     end
                                elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                     while 1
                                         h=h+1;
                                         pause(.1)
                                         Rxb=RX(h);
                                         TNa=TPos*Rxb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<500)||(c>650)||(d>600)||(d<400)
                                            break;
                                         end
                                     end    
                                elseif (c>650)&&(c<850)&&(d<600)&&(d>400)    %if joy1 es medio y positivo 
                                     while 1
                                         h=h+2;
                                         pause(.1)
                                         Rxb=RX(h);
                                         TNa=TPos*Rxb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<650)||(c>850)||(d>600)||(d<400) 
                                            break;
                                         end
                                     end
                                elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      h=h+4;
                                      pause(.1)
                                      Rxb=RX(h);
                                      TNa=TPos*Rxb;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                 
                                      TPos=TNa;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                               elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                     while 1
                                         f=-1;
                                         pause(.1)
                                         Txb=TX(f,0,0);
                                         TNa=TPos*Txb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>500)||(d<350)||(c>600)||(c<400)
                                            break;
                                         end
                                     end    
                                elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                     while 1
                                         f=-2;
                                         pause(.1)
                                         Txb=TX(f,0,0);
                                         TNa=TPos*Txb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>350)||(d<150)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                    while 1
                                        f=-4;
                                        pause(.1)
                                        Txb=TX(f,0,0);
                                        TNa=TPos*Txb;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                   
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d>150)||(c>600)||(c<400)
                                            break;
                                        end
                                    end
                               elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                    while 1
                                        f=1;
                                        pause(.1)
                                        Txb=TX(f,0,0);
                                        TNa=TPos*Txb;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                    
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d<500)||(d>650)||(c>600)||(c<400)
                                            break;
                                        end
                                    end      
                               elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                     while 1
                                         f=2;
                                         pause(.1)
                                         Txb=TX(f,0,0);
                                         TNa=TPos*Txb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<650)||(d>850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                     while 1
                                         f=4;
                                         pause(.1)
                                         Txb=TX(f,0,0);
                                         TNa=TPos*Txb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               end
                          end
                         case 2626%y
                             while 1
                            x=fscanf(s);
                            w=str2num(x);
                            c=w(1,1);%joystick1
                            d=w(1,2); %joystick2
                            disp('moviendo en y')
                               if (c==10000)||(d==10000)
                                  break;
                               elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                               elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                                  while 1
                                      h=h-1;
                                      pause(.1)
                                      Ryb=RY(h);
                                      TNa=TPos*Ryb;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                    
                                      TPos=TNa;
                                      if (c>500)||(c<350)||(d>600)||(d<400)
                                          break;
                                      end
                                  end    
                               elseif (c<350)&&(c>150)&&(d<600)&&(d>400) %if joy1 es medio y negativo 
                                     while 1
                                         h=h-2;
                                         pause(.1)
                                         Ryb=RY(h);
                                         TNa=TPos*Ryb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>350)||(c<150)||(d>600)||(d<400)
                                           break;
                                         end
                                     end
                                elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                     while 1
                                         h=h-4;
                                         pause(.1)
                                         Ryb=RY(h);
                                         TNa=TPos*Ryb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>150)||(d>600)||(d<400)
                                             break;
                                         end
                                     end
                                elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                     while 1
                                         h=h+1;
                                         pause(.1)
                                         Ryb=RY(h);
                                         TNa=TPos*Ryb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<500)||(c>650)||(d>600)||(d<400)
                                            break;
                                         end
                                     end    
                                elseif (c>650)&&(c<850)&&(d<600)&&(d>400)    %if joy1 es medio y positivo 
                                     while 1
                                         h=h+2;
                                         pause(.1)
                                         Ryb=RY(h);
                                         TNa=TPos*Ryb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<650)||(c>850)||(d>600)||(d<400) 
                                            break;
                                         end
                                     end
                                elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      h=h+4;
                                      pause(.1)
                                      Ryb=RY(h);
                                      TNa=TPos*Ryb;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                 
                                      TPos=TNa;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                               elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                     while 1
                                         f=-1;
                                         pause(.1)
                                         Tyb=TY(f,0,0);
                                         TNa=TPos*Tyb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>500)||(d<350)||(c>600)||(c<400)
                                            break;
                                         end
                                     end    
                                elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                     while 1
                                         f=-2;
                                         pause(.1)
                                         Tyb=TX(0,f,0);
                                         TNa=TPos*Tyb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>350)||(d<150)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                    while 1
                                        f=-4;
                                        pause(.1)
                                        Tyb=TX(0,f,0);
                                        TNa=TPos*Tyb;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                   
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d>150)||(c>600)||(c<400)
                                            break;
                                        end
                                    end
                               elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                    while 1
                                        f=1;
                                        pause(.1)
                                        Tyb=TX(0,f,0);
                                        TNa=TPos*Tyb;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                    
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d<500)||(d>650)||(c>600)||(c<400)
                                            break;
                                        end
                                    end      
                               elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                     while 1
                                         f=2;
                                         pause(.1)
                                         Tyb=TX(0,f,0);
                                         TNa=TPos*Tyb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<650)||(d>850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                     while 1
                                         f=4;
                                         pause(.1)
                                         Tyb=TX(0,f,0);
                                         TNa=TPos*Tyb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               end
                            end
                         case 2727%z
                             while 1
                            x=fscanf(s);
                            w=str2num(x);
                            c=w(1,1);%joystick1
                            d=w(1,2); %joystick2
                            disp('moviendo en z')
                               if (c==10000)||(d==10000)
                                  break;
                               elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                               elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                                  while 1
                                      h=h-1;
                                      pause(.1)
                                      Rzb=RZ(h);
                                      TNa=TPos*Rzb;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                    
                                      TPos=TNa;
                                      if (c>500)||(c<350)||(d>600)||(d<400)
                                          break;
                                      end
                                  end    
                               elseif (c<350)&&(c>150)&&(d<600)&&(d>400) %if joy1 es medio y negativo 
                                     while 1
                                         h=h-2;
                                         pause(.1)
                                         Rzb=RZ(h);
                                         TNa=TPos*Rzb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>350)||(c<150)||(d>600)||(d<400)
                                           break;
                                         end
                                     end
                                elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                     while 1
                                         h=h-4;
                                         pause(.1)
                                         Rzb=RZ(h);
                                         TNa=TPos*Rzb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>150)||(d>600)||(d<400)
                                             break;
                                         end
                                     end
                                elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                     while 1
                                         h=h+1;
                                         pause(.1)
                                         Rzb=RZ(h);
                                         TNa=TPos*Rzb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<500)||(c>650)||(d>600)||(d<400)
                                            break;
                                         end
                                     end    
                                elseif (c>650)&&(c<850)&&(d<600)&&(d>400)    %if joy1 es medio y positivo 
                                     while 1
                                         h=h+2;
                                         pause(.1)
                                         Rzb=RZ(h);
                                         TNa=TPos*Rzb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<650)||(c>850)||(d>600)||(d<400) 
                                            break;
                                         end
                                     end
                                elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      h=h+4;
                                      pause(.1)
                                      Rzb=RZ(h);
                                      TNa=TPos*Rzb;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                 
                                      TPos=TNa;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                               elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                     while 1
                                         f=-1;
                                         pause(.1)
                                         Tzb=TX(0,0,f);
                                         TNa=TPos*Tzb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>500)||(d<350)||(c>600)||(c<400)
                                            break;
                                         end
                                     end    
                                elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                     while 1
                                         f=-2;
                                         pause(.1)
                                         Tzb=TX(0,0,f);
                                         TNa=TPos*Tzb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>350)||(d<150)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                    while 1
                                        f=-4;
                                        pause(.1)
                                        Tzb=TX(0,0,f);
                                        TNa=TPos*Tzb;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                   
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d>150)||(c>600)||(c<400)
                                            break;
                                        end
                                    end
                               elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                    while 1
                                        f=1;
                                        pause(.1)
                                        Tzb=TX(0,0,f);
                                        TNa=TPos*Tzb;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                    
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d<500)||(d>650)||(c>600)||(c<400)
                                            break;
                                        end
                                    end      
                               elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                     while 1
                                         f=2;
                                         pause(.1)
                                         Tzb=TX(0,0,f);
                                         TNa=TPos*Tzb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<650)||(d>850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                     while 1
                                         f=4;
                                         pause(.1)
                                         Tzb=TX(0,0,f);
                                         TNa=TPos*Tzb;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               end
                            end
                     end
                 end
                 
            
              
               
             case 3333 %%base
                 while 1
                     ttas=fscanf(s);
                     m=str2num(ttas);
                     g=j(1,5);
                     disp('menu de base')
                     switch g
                         case 10000
                             break;
                         case 2525
                             while 1
                            x=fscanf(s);
                            w=str2num(x);
                            c=w(1,1);%joystick1
                            d=w(1,2); %joystick2
                            disp('moviendo en x')
                               if (c==10000)||(d==10000)
                                  break;
                               elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                               elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                                  while 1
                                      h=h-1;
                                      pause(.1)
                                      Rxb=RX(h);
                                      TNa=Rxb*TPos;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                    
                                      TPos=TNa;
                                      if (c>500)||(c<350)||(d>600)||(d<400)
                                          break;
                                      end
                                  end    
                               elseif (c<350)&&(c>150)&&(d<600)&&(d>400) %if joy1 es medio y negativo 
                                     while 1
                                         h=h-2;
                                         pause(.1)
                                         Rxb=RX(h);
                                         TNa=Rxb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>350)||(c<150)||(d>600)||(d<400)
                                           break;
                                         end
                                     end
                                elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                     while 1
                                         h=h-4;
                                         pause(.1)
                                         Rxb=RX(h);
                                         TNa=Rxb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>150)||(d>600)||(d<400)
                                             break;
                                         end
                                     end
                                elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                     while 1
                                         h=h+1;
                                         pause(.1)
                                         Rxb=RX(h);
                                         TNa=Rxb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<500)||(c>650)||(d>600)||(d<400)
                                            break;
                                         end
                                     end    
                                elseif (c>650)&&(c<850)&&(d<600)&&(d>400)    %if joy1 es medio y positivo 
                                     while 1
                                         h=h+2;
                                         pause(.1)
                                         Rxb=RX(h);
                                         TNa=Rxb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<650)||(c>850)||(d>600)||(d<400) 
                                            break;
                                         end
                                     end
                                elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      h=h+4;
                                      pause(.1)
                                      Rxb=RX(h);
                                      TNa=Rxb*TPos;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                 
                                      TPos=TNa;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                               elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                     while 1
                                         f=-1;
                                         pause(.1)
                                         Txb=TX(f,0,0);
                                         TNa=Txb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>500)||(d<350)||(c>600)||(c<400)
                                            break;
                                         end
                                     end    
                                elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                     while 1
                                         f=-2;
                                         pause(.1)
                                         Txb=TX(f,0,0);
                                         TNa=Txb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>350)||(d<150)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                    while 1
                                        f=-4;
                                        pause(.1)
                                        Txb=TX(f,0,0);
                                        TNa=Txb*TPos;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                   
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d>150)||(c>600)||(c<400)
                                            break;
                                        end
                                    end
                               elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                    while 1
                                        f=1;
                                        pause(.1)
                                        Txb=TX(f,0,0);
                                        TNa=Txb*TPos;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                    
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d<500)||(d>650)||(c>600)||(c<400)
                                            break;
                                        end
                                    end      
                               elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                     while 1
                                         f=2;
                                         pause(.1)
                                         Txb=TX(f,0,0);
                                         TNa=Txb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<650)||(d>850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                     while 1
                                         f=4;
                                         pause(.1)
                                         Txb=TX(f,0,0);
                                         TNa=Txb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               end
                            end
                             
                         case 2626
                             while 1
                            x=fscanf(s);
                            w=str2num(x);
                            c=w(1,1);%joystick1
                            d=w(1,2); %joystick2
                            disp('moviendo en y')
                               if (c==10000)||(d==10000)
                                  break;
                               elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                               elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                                  while 1
                                      h=h-1;
                                      pause(.1)
                                      Ryb=RY(h);
                                      TNa=Ryb*TPos;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                    
                                      TPos=TNa;
                                      if (c>500)||(c<350)||(d>600)||(d<400)
                                          break;
                                      end
                                  end    
                               elseif (c<350)&&(c>150)&&(d<600)&&(d>400) %if joy1 es medio y negativo 
                                     while 1
                                         h=h-2;
                                         pause(.1)
                                         Ryb=RY(h);
                                         TNa=Ryb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>350)||(c<150)||(d>600)||(d<400)
                                           break;
                                         end
                                     end
                                elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                     while 1
                                         h=h-4;
                                         pause(.1)
                                         Ryb=RY(h);
                                         TNa=Ryb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>150)||(d>600)||(d<400)
                                             break;
                                         end
                                     end
                                elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                     while 1
                                         h=h+1;
                                         pause(.1)
                                         Ryb=RY(h);
                                         TNa=Ryb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<500)||(c>650)||(d>600)||(d<400)
                                            break;
                                         end
                                     end    
                                elseif (c>650)&&(c<850)&&(d<600)&&(d>400)    %if joy1 es medio y positivo 
                                     while 1
                                         h=h+2;
                                         pause(.1)
                                         Ryb=RY(h);
                                         TNa=Ryb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<650)||(c>850)||(d>600)||(d<400) 
                                            break;
                                         end
                                     end
                                elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      h=h+4;
                                      pause(.1)
                                      Ryb=RY(h);
                                      TNa=Ryb*TPos;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                 
                                      TPos=TNa;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                               elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                     while 1
                                         f=-1;
                                         pause(.1)
                                         Tyb=TX(0,f,0);
                                         TNa=Tyb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>500)||(d<350)||(c>600)||(c<400)
                                            break;
                                         end
                                     end    
                                elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                     while 1
                                         f=-2;
                                         pause(.1)
                                         Tyb=TX(0,f,0);
                                         TNa=Tyb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>350)||(d<150)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                    while 1
                                        f=-4;
                                        pause(.1)
                                        Tyb=TX(0,f,0);
                                        TNa=Tyb*TPos;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                   
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d>150)||(c>600)||(c<400)
                                            break;
                                        end
                                    end
                               elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                    while 1
                                        f=1;
                                        pause(.1)
                                        Tyb=TX(0,f,0);
                                        TNa=Tyb*TPos;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                    
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d<500)||(d>650)||(c>600)||(c<400)
                                            break;
                                        end
                                    end      
                               elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                     while 1
                                         f=2;
                                         pause(.1)
                                         Tyb=TX(0,f,0);
                                         TNa=Tyb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<650)||(d>850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                     while 1
                                         f=4;
                                         pause(.1)
                                         Tyb=TX(0,f,0);
                                         TNa=Tyb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               end
                            end
                         case 2727
                             while 1
                            x=fscanf(s);
                            w=str2num(x);
                            c=w(1,1);%joystick1
                            d=w(1,2); %joystick2
                            disp('moviendo en z')
                               if (c==10000)||(d==10000)
                                  break;
                               elseif (c==500)&&(d==500) %joystiks en cero 
                               
                               %sin movimiento despues checar
                               elseif (c<500)&&(c>350)&&(d<600)&&(d>400) %if joy1 es lento y negativo
                                  while 1
                                      h=h-1;
                                      pause(.1)
                                      Rzb=RZ(h);
                                      TNa=Rzb*TPos;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                    
                                      TPos=TNa;
                                      if (c>500)||(c<350)||(d>600)||(d<400)
                                          break;
                                      end
                                  end    
                               elseif (c<350)&&(c>150)&&(d<600)&&(d>400) %if joy1 es medio y negativo 
                                     while 1
                                         h=h-2;
                                         pause(.1)
                                         Rzb=RZ(h);
                                         TNa=Rzb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>350)||(c<150)||(d>600)||(d<400)
                                           break;
                                         end
                                     end
                                elseif (c<150)&&(d<600)&&(d>400)   %if joy1 es alto  y negativo
                                     while 1
                                         h=h-4;
                                         pause(.1)
                                         Rzb=RZ(h);
                                         TNa=Rzb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         if (c>150)||(d>600)||(d<400)
                                             break;
                                         end
                                     end
                                elseif (c>500)&&(c<650)&&(d<600)&&(d>400) %if joy1 es lento y postivo 
                                     while 1
                                         h=h+1;
                                         pause(.1)
                                         Rzb=RZ(h);
                                         TNa=Rzb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<500)||(c>650)||(d>600)||(d<400)
                                            break;
                                         end
                                     end    
                                elseif (c>650)&&(c<850)&&(d<600)&&(d>400)    %if joy1 es medio y positivo 
                                     while 1
                                         h=h+2;
                                         pause(.1)
                                         Rzb=RZ(h);
                                         TNa=Rzb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (c<650)||(c>850)||(d>600)||(d<400) 
                                            break;
                                         end
                                     end
                                elseif (c>850)&&(d<600)&&(d>400)   %if joy1 es alto  y positivo 
                                  while 1
                                      h=h+4;
                                      pause(.1)
                                      Rzb=RZ(h);
                                      TNa=Rzb*TPos;
                                      [t]=Newton(TNa,ttas);
                                      ttas=t;
                                      clf
                                      [T06]=RABB(ttas);
                                      u=fscanf(s);
                                      v=str2num(u);
                                      c=v(1,1);
                                      d=v(1,2);                                 
                                      TPos=TNa;
                                      pause(.0001)
                                      if (c<850)||(d>600)||(d<400)
                                         break;
                                      end
                                  end
                               elseif (d<500)&&(d>350)&&(c<600)&&(c>400)%if joy2 es lento y negativo
                                     while 1
                                         f=-1;
                                         pause(.1)
                                         Tzb=TX(0,0,f);
                                         TNa=Tzb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>500)||(d<350)||(c>600)||(c<400)
                                            break;
                                         end
                                     end    
                                elseif (d<350)&&(d>150)&&(c<600)&&(c>400)  %if joy2 es medio y negativo 
                                     while 1
                                         f=-2;
                                         pause(.1)
                                         Tzb=TX(0,0,f);
                                         TNa=Tzb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d>350)||(d<150)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d<150)&&(c<600)&&(c>400)  %if joy2 es alto  y negativo
                                    while 1
                                        f=-4;
                                        pause(.1)
                                        Tzb=TX(0,0,f);
                                        TNa=Tzb*TPos;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                   
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d>150)||(c>600)||(c<400)
                                            break;
                                        end
                                    end
                               elseif (d>500)&&(d<650)&&(c<600)&&(c>400)%if joy2 es lento y postivo 
                                    while 1
                                        f=1;
                                        pause(.1)
                                        Tzb=TX(0,0,f);
                                        TNa=Tzb*TPos;
                                        [t]=Newton(TNa,ttas);
                                        ttas=t;
                                        clf
                                        [T06]=RABB(ttas);
                                        u=fscanf(s);
                                        v=str2num(u);
                                        c=v(1,1);
                                        d=v(1,2);                                    
                                        TPos=TNa;
                                        pause(.0001)
                                        if (d<500)||(d>650)||(c>600)||(c<400)
                                            break;
                                        end
                                    end      
                               elseif (d>650)&&(d<850)&&(c<600)&&(c>400)  %if joy2 es medio y positivo 
                                     while 1
                                         f=2;
                                         pause(.1)
                                         Tzb=TX(0,0,f);
                                         TNa=Tzb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<650)||(d>850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               elseif (d>850)&&(c<600)&&(c>400)  %if joy2 es alto  y positivo 
                                     while 1
                                         f=4;
                                         pause(.1)
                                         Tzb=TX(0,0,f);
                                         TNa=Tzb*TPos;
                                         [t]=Newton(TNa,ttas);
                                         ttas=t;
                                         clf
                                         [T06]=RABB(ttas);
                                         u=fscanf(s);
                                         v=str2num(u);
                                         c=v(1,1);
                                         d=v(1,2);                                    
                                         TPos=TNa;
                                         pause(.0001)
                                         if (d<850)||(c>600)||(c<400)
                                            break;
                                         end
                                     end
                               end
                            end
                     end
                 end
             case 4444
                 while 1
                     ab=fscanf(s);
                     cd=str2num(ab);
                     ef=cd(1,4);
                     disp('inicio del programa')
                     switch ef
                         case 44441
                             while 1
                                 na=na+1;
                             programa(1,na)=ttas;
                             ma=ma+1;
                             if ma==1
                                 ma=0;
                                 break;
                             end
                             end
                         case 44442
                             while 1
                                 na=na+1;
                             programa(1,na)=ttas;
                             ma=ma+1;
                             if ma==1
                                 ma=0;
                                 break;
                             end
                             end
                     end
                 end
              case 5555
                  for eje=programa(1,na):.1:programana(1,na+1)
                      clf
                      [P06]=RABB(ttas);
                      ttas=P06;
                      if na==11
                          break;
                      end
                      
                  end
          end      
       end
    end
end

fclose(s);