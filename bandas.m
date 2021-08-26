function [B] = bandas(frec,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
l = length(frec)/2;
l_banda = floor(l/b);

B = []';
inicio = 1;
for i=1:b
    B = [B; frec(inicio:(inicio + l_banda))]; 
    inicio = inicio + l_banda;
end 
    


% inicio = l + (index-1)*l_banda;
% final = inicio + l_banda;
% 
% inv_inicio = l - (index-1)*l_banda;
% inv_final = inv_inicio - l_banda+1;
end

