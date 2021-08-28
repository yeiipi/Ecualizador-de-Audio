function [frec_filtradas] = windowsVista(coefs, b, index,cost)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT:
%   coefs      -> Vector del espectro de la transformada de fourier
%   b          -> Numero de bandas 
%   index      -> Banda actual a la que se le va a aplicar la ventana
%   cost       -> factor de amplificación de la ventana a aplicar
%
% OUTPUT:
%   frec_filtradas -> banda de frecuencias transformadas con la ventana
%                   seleccionada
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

frec_dims =  size(coefs);

if frec_dims(2) ~= 1
    coefs = coefs';
end
    
[B] = bandas(coefs,b);

sup = b + index;
inf = b - index+1;

B(:,sup) = cost*(B(:,sup) .* triang(length(B(:,sup))) );
B(:,inf) = cost*(B(:,inf) .* triang(length(B(:,inf))) );

frec_filtradas = reshape(B,1,[]);
end