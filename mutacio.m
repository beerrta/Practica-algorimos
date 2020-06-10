function mutated=mutation(A,portes,mutrate)
%assumim que nomes podem mutar dins el limit de portes que hem posat i que
%les posicions que podem mutar no inclouen les posicions de les 3 primeres
%columnes ja uque aquestes sempre seran 0
for m=4:length(A(:,1))%recorro les columnes de la matriu
    for n=1:length(A(1,:))
        r1=rand(1)
        r2=rand(1)
        
        if r1<mutrate && m>n
            if A(n,m)==0
                A(n,m)==1
            end
        end
        if  r2<mutrate && m>n
            if A(n,m)==1
                A(n,m)==0
            end
        end
        end
end
    mutated=A
end

