  function []=EjesMovil(TR)

  TRsc=TR*65;
  plot3([TR(1,4) (TR(1,4)+TRsc(1,1))],[TR(2,4) (TR(2,4)+TRsc(2,1))],[TR(3,4) (TR(3,4)+TRsc(3,1))],'color','r','linewidth' ,3)
  plot3([TR(1,4) (TR(1,4)+TRsc(1,2))],[TR(2,4) (TR(2,4)+TRsc(2,2))],[TR(3,4) (TR(3,4)+TRsc(3,2))],'color','g','linewidth' ,3)
  plot3([TR(1,4) (TR(1,4)+TRsc(1,3))],[TR(2,4) (TR(2,4)+TRsc(2,3))],[TR(3,4) (TR(3,4)+TRsc(3,3))],'color','b','linewidth' ,3)

  end
