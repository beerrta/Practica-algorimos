function mutated=mutation(A,portes)
prob_mutacio=1/portes^2
%assumim que nomes podem mutar dins el limit de portes que hem posat i que
%les posicions que podem mutar no inclouen les posicions de les 3 primeres
%columnes ja uque aquestes sempre seran 0
for m=4:length(A(:,1)%recorro les columnes de la matriu
    for n=1:length(A(1,:))
        r=rand(1)
        if r<prob_mutacio && m>n
            if A(n,m)==1
                A(n,m)==0
            else
                A(n,m)==1
            end
        end
    end 