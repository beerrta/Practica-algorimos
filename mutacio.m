function mutated=mutacio(A,portes,mutrate)
%assumim que nomes podem mutar dins el limit de portes que hem posat i que
%les posicions que podem mutar no inclouen les posicions de les 3 primeres
%columnes ja uque aquestes sempre seran 0
for m=4:length(A(:,1))%recorro les columnes de la matriu
    for n=1:length(A(1,:))
        %         r1=rand(1)%cree, dos numeros random entre 0 i 1
        %if sum(A(:,m-1))>=1 %amb aquesta condicio evitem que es creein cables que surtin duna porta si la porta no esta creada encara
        if rand(1)<mutrate && m>n
            if A(n,m)==0
                A(n,m)=1;
            else
                A(n,m)=0;
            end
        end
    end
end
%         if  r2<(mutrate*1/portes) && j>2 %eliminem una porta sencera , aixo implica borrar els inuts i els outputs,
%             %aixo nomes pasara si el nostre cirquit te mes de dues portes sino es quedara igual
%             % pero si hi ha 2 portes o menys ja no eliminem.
%             A(:,m)=0;
%             A(m,:)=0;
%         end

   
    mutated=A;
end

