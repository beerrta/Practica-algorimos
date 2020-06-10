function [pob]=poblacio(portes,poblacio)
n=1;
pob=[];
%portes=8
while n<=poblacio %el 20 aquest sera la mida de la població
    A=zeros(portes+3,portes+3);
   
for i=1:length(A(:,1)) %recorro files
    for j=1:length(A(1,:)) %recorro columnes
    if i==4%les 3 primeres columnes son totes de 0
        d=randi(2:3) % per saber si començem amb 3 cables o amb 2
        if d==3
            cab=[1,1,1];
        elseif  d==2
            cab=[1,1,0];
        end
        a=cab(randperm(length(cab)))
        A(1,4)=a(1)
        A(2,4)=a(2)
        A(3,4)=a(3)
    elseif i>4 % posem 1 de manera random en posicions de la nostra matiu. tenint en compte que no es possible tenir un 1 en una fila si no esta mes enlla de la columna igual el numero de fila
        l=5 %el 5 es perque en la porta 4 hi ha els cables llavors a partir de la 5ena posem els cables randoms ja uqe en la 4 ho hem fet anteriormet
        for k=1:l
            if l<portes+3
                A(k,l)=round(randi(1))
            end
            l=l+1
        end
    end     
    end 
end
pob(:,:,n)=A
n=n+1
end
end
        

    
    
    
