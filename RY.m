function [T]=RY(t)
T=[cosd(t) 0 sind(t) 0;...
       0 1 0 0;...
       -sind(t) 0 cosd(t) 0;...
       0 0 0 1];
end