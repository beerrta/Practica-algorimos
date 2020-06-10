function recombinacio_matriu=recombinacio(poblacio,portes)
recombinacio_matriu=[];
i=0;%laparellament el farem random nomes amb la primera meitat de individus
%mes fit ja que volem trobar optim i laparellament amb les menys fit ens allunyaria dell
o=1;
while i<length(poblacio)/2
    p=length(poblacio)/2;%Así escoge entre la mitad mejor
    ind1=round((p-1)*rand)+1;
    %ind1=round(rand(1)*p);
    A=poblacio(:,:,ind1);%fem que dos individus s'aparellin de forma aleatoria, un cop s'han aparellat, ja no es poden aparella mes
    %poblacio(ind1)=[];%un cop lindividu seleccionat el borrem ja que no volem que es repeteixin el progenitors
    ind2=round((p-1)*rand)+1;
    %ind2=round(rand*(length(poblacio)-1-(i-2)))+1;
    B=poblacio(:,:,ind2);
    %poblacio(ind2)=[];
    for m=4:portes
        for n=1:portes
            if m>n
               random=rand(1);
               if rand>0.5% tenim un 50% de probs de que la desendencia tingui part del pare o de la mare 
                   A(n,m)=B(n,m);
               end
            end
        end
    end
    i=i+1;
    recombinacio_matriu(:,:,o)=A;
    o=o+1;
end
                