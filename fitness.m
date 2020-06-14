function fitness=fitness(A,obj)% on A es la matriu
%A=[0,0,0,1,0,0;0,0,0,1,0,0,;0,0,0,0,1,0;0,0,0,0,0,1;0,0,0,0,0,1;0,0,0,0,0,0];
cables=0;
portes=0;
    input=[0,0,0;0,0,1;0,1,0;0,1,1;1,0,0;1,0,1;1,1,0;1,1,1];
    % per aixi no modificar directament la matiru de la poblacio creo una matriu alterantiva 
    %on elimino les columens i files que tot son 0;
    B=A; 
    for n=4:length(B(1,:))%elimino totes aquelles files i columnes de la mateixa posicio que tenen tots 0 per facilitar el calcul del resultat de les portes 
          for m=4:length(B(:,1))%simplifico la matriu treien tot allo que no m'aporta
              if m==n % faig que vaigi desde 4 perque no vull que per error melimini les 3 primeres files i columnes
                  if sum(B(:,m))==0 && sum(B(n,:))==0
                      B(:,m)=[];
                        B(n,:)=[];
                  elseif sum(B(:,m))>=1 && sum(B(n,:))==0%elimino aquells portes que els seus outputs no van a para a ninguna porta aixi no tenen cap cost
                      B(:,m)=[];
                      B(n,:)=[];
                  end
                  end
              end
    end
    for j=1:length(B(:,1)) %recorro les columnes
    for i=1:length(B(1,:))%recorro les files
        if B(i,j)==1
            cables=cables+1;
        end
    end
    if sum(B(:,j))>0
        portes=portes+1;
    end
    cost=(portes)*5+cables;
end
    
    out=[];
    for i=1:length(input(:,1))%calcul de la solucio del nostra cirquit
            solucio_porta_ant=[0,0,0];% les tres primeres portes son cables per tant sempre seran 0
            for m=4:length(B(:,1))
                sol=[];%sem guarda els valors de tots els inputs de cada porta
                for n=1:length(B(1,:))
                    if n<=3 %miro si la entrada es de un dels cables del input a,b,c, si ho es, busco el resultat de la porta seguint la taula dels inputs
                        if B(n,m)==1
                            sol(n)=input(i,n);
                        end 
                    elseif B(n,m)==1
                        sol(n)=solucio_porta_ant(m-(m-n));
                   end
                end
                if sum(sol)==0 %sumo tots els valors que entren en la porta nor, al se portes nor, si la suma es major a 1 el output sera 0
                      solucio_porta_ant(m)=1;
                 else
                       solucio_porta_ant(m)=0;  
                end
            end
            out(i)=solucio_porta_ant(length(solucio_porta_ant));

    end
   hamming=sum(abs(out-obj))*500; %definicio de la distancia de hamming 
   fitness=cost+hamming;
end