clc
close
delete(instrfind({'Port'},{'COM3'}));
s= serial('COM3','BaudRate',9600);
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
fopen(s);
for a=0:1:80
    fscanf(s)
    pause(.1)
    if a==79
        while 1
            z=fscanf(s);
            x=str2num(z)
        end
    end
end
  
  