function [frec_filtradas] = hamming_window(frec,b,index)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[B] = bandas(frec,b);
N = length(B);


sup = b + index;
inf = b - index+1;


for i=1:b*2
    if or(sup == i,inf == i)
        B(i,:) = 0.54 - 0.46*cos(2 * pi * (B(i,:)/N))
    else
        B(i,:) = B(i,:) * 0
    end
end

frec_filtradas = reshape(B',1,[])
end

