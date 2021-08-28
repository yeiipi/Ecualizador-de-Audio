function [frec_filtradas] = windowsXP(frec,b,index,percentage,cost)
% if percentage = 1     -> hanning
% if '        ' = 0.5   -> tukey normi
% if '        ' = 0     -> rectangular

[B] = bandas(frec,b);

sup = b + index;
inf = b - index+1;

for i=1:b*2
    if or(sup == i,inf == i)
        B(:,i) = cost*(B(:,i) .* tukeywin(length(B(:,i)),percentage)) ;
    end
end
frec_filtradas = reshape(B,1,[]);
end

