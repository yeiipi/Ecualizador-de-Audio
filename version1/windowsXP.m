function [frec_filtradas] = windowsXP(frec, b, index, percentage, cost)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT:
%   if percentage = 1     -> hanning
%   if '        ' = 0.5   -> tukey normi
%   if '        ' = 0     -> rectangular
% 
%   frec       -> Vector del espectro de la transformada de fourier
%   b          -> Numero de bandas 
%   index      -> Banda actual a la que se le va a aplicar la ventana
%   cost       -> factor de amplificación de la ventana a aplicar
%
% OUTPUT:
%   frec_filtradas -> banda de frecuencias transformadas con la ventana
%                   seleccionada
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
[B] = bandas(frec,b);

sup = b + index;
inf = b - index+1;

B(:,sup) = cost*(B(:,sup) .* tukeywin(length(B(:,sup)),percentage));
B(:,inf) = cost*(B(:,inf) .* tukeywin(length(B(:,inf)),percentage));

frec_filtradas = reshape(B,1,[]);
end

