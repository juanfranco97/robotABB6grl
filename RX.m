function [T]=RX(t)
T=[1 0 0 0;...
       0 cosd(t) -sind(t) 0;...
       0 sind(t) cosd(t) 0;...
       0 0 0 1];
end