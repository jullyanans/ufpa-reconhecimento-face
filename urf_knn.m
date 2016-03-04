function c = urf_knn(P, y, Q,  k)
    n = size(P,2);      %retorna o tamanho da matriz da imagens de treino
    if (nargin == 3)    %%se os argumntos da função forem iguais a três, atribui 1 a k
        k=1;
    elseif (k>n)        %%se forem diferentes de 3 e maior que o tamanho da matriz, atribui n a k
        k=n;
    end

    Q = repmat(Q, 1, n);     %repete a matriz Q até ela ter n colunas
    distancias = sqrt(sum(power((P-Q),2),1));       % módulo da soma da diferença entre matriz de treino e matriz de teste
    [distancias, idx] = sort(distancias);
    y = y(idx);
    y = y(1:k);
    h = histc(y,(1:max(y)));
    [v,c] = max(h);
