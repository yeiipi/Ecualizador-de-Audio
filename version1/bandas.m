function [B] = bandas(frec,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
l = length(frec)/2;
l_banda = floor(l/b);

B = [];
inicio = 1;
for i=1:b*2
    B = [B, frec(inicio:(inicio + l_banda-1))]; 
    inicio = inicio + l_banda;
end 

    
end

