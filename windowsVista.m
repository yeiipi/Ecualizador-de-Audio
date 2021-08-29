function [frec_filtradas] = windowsVista(coefs, b, index,cost)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT:
%   coefs      -> Vector de la transformada de fourier
%   b          -> Numero de bandas 
%   index      -> Banda actual a la que se le va a aplicar la ventana
%   cost       -> factor de amplificación de la ventana a aplicar
%
% OUTPUT:
%   frec_filtradas -> banda de frecuencias transformadas con la ventana
%                   seleccionada (vector fila)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

coef_dims =  size(coefs);

if coef_dims(2) ~= 1
    coefs = coefs';
end
    
[B] = bandas(coefs,b);

sup = b + index;
inf = b - index+1;

B(:,inf) = cost*(B(:,inf) .* triang(length(B(:,inf))) );
B(:,sup) = cost*(B(:,sup) .* triang(length(B(:,sup))) );


frec_filtradas = reshape(B,1,[]);
end