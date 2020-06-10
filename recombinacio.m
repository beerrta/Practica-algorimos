function recombinacio=recombinacio(poblacio,portes)
recombinacio=[]
i=1
o=1
while i<length(poblacio)
    p=length(poblacio)-1-(i-1)+1
    ind1=rand(1)*p
    A=poblacio(ind1)%fem que dos individus s'aparellin de forma aleatoria, un cop s'han aparellat, ja no es poden aparella mes
    poblacio(ind1)=[]%un cop lindividu seleccionat el borrem ja que no volem que es repeteixin el progenitors
    ind2=(rand*(length(poblacio)-1-(i-2)))+1
    B=poblacio(ind2)
    poblacio(ind2)=[]
    for m=4:portes
        for n=1:portes
            if m>n
               rand=rand(1)
               if rand>0.5% tenim un 50% de probs de que la desendencia tingui part del pare o de la mare 
                   A(n,m)=B(n,m)
               end
            end
        end
    end
    i=i+2;
    recombinacio(o)=A;
    o=o+1;
end
                