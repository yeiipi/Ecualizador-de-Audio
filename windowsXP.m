function [frec_filtradas] = windowsXP(coefs, b, index, percentage, cost)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT:
%   if percentage = 1     -> hanning
%   if '        ' = 0.5   -> tukey normi
%   if '        ' = 0     -> rectangular
% 
%   coefs      -> Vector de la transformada de fourier
%   b          -> Numero de bandas 
%   index      -> Banda actual a la que se le va a aplicar la ventana
%   cost       -> factor de amplificación de la ventana a aplicar
%
% OUTPUT:
%   frec_filtradas -> banda de frecuencias transformadas con la ventana
%                   seleccionada
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

coef_dims =  size(coefs);

if coef_dims(2) ~= 1
    coefs = coefs';
end
    
[B] = bandas(coefs,b);

sup = b + index;
inf = b - index+1;

B(:,inf) = cost*(B(:,inf) .* tukeywin(length(B(:,inf)),percentage));
B(:,sup) = cost*(B(:,sup) .* tukeywin(length(B(:,sup)),percentage));


frec_filtradas = reshape(B,1,[]);
end

