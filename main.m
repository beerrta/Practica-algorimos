% Continuous Genetic Algorithm
clear all
% objective function
ff= 'fitness'; 
obj=[0,0,0,1,0,1,0,1];
%obj=[1,1,0,0,0,0,0,1]
% obj=[0,1,1,0,0,0,0,1]
% obj=[0,1,1,1,0,0,0,1]


maxit=600; % max number of iterations
mincost= 0; % minimum cost
portes=6;
%_______________________________________________________
% III GA parameters
popsize = 100; % set population size
selection = 0.5; % fraction of population kept
%Nt=npar; % continuous parameter GA Nt=#variables
%keep=floor(selection*popsize); % #population memberst that survive
%nmut=ceil((popsize-1)*Nt*mutrate); % total number of mutations
%M=ceil((popsize-keep)/2); % number of matings
poblacio=poblacio(portes,popsize);
mutrate=1/portes^2
%_______________________________________________________
% Create the initial population
iga=0; % generation counter initialized
for i=1:popsize
 cost(i)=fitness(poblacio(:,:,i),obj);
end
[cost, ind] =sort(cost); % min cost in element 1
poblacio=poblacio(:,:,ind); % sort continuous
minc(1)=min(cost); % minc contains the minimum of population
meanc(1)=mean(cost); % meanc contains average fitness of population
%_______________________________________________________
% Iterate through generations (MAIN LOOP)
while iga<maxit
 iga=iga+1; % increments generation counter

 % Pair and mate
 %Performs mating using the single point crossover
 % ---------------------------------------------------
 descendencia=recombinacio(poblacio,portes); %em retorna la desendencia dels aparellaments aleatoris
 x=length(poblacio)*selection
 selecio=[]
 for i=1:x
     selecio(:,:,i)=poblacio(:,:,i)
 end
 for j=1:popsize/2
     selecio(:,:,popsize/2+j)=descendencia(:,:,j)
 end
 poblacio=selecio %creo la nova poblacio amb els mes fits de la generacio anteroro i els desencdents

 % Mutate the population
 % ---------------------------------------------------
m_poblacio=[]
 for ii=1:length(poblacio)
    m_poblacio(:,:,ii)=mutacio(poblacio(:,:,ii),portes,mutrate);% mutation
 end
 poblacio=m_poblacio
 % The new offspring and mutated chromosomes are evaluated
 % ---------------------------------------------------
 % cost=feval(ff,par); & WHY THIS IS NOT WORKING!!!!
 for i=1:popsize
 cost(i)=fitness(poblacio(:,:,i),obj);
 end
 % Sort the costs and associated parameters
 % ---------------------------------------------------
 [cost,ind]=sort(cost);
 poblacio=poblacio(:,:,ind);
 %Coords{iga+1}=par;
 % Do statistics for a single nonaveraging run
 % ---------------------------------------------------
 minc(iga+1)=min(cost);
 meanc(iga+1)=mean(cost);

 % Stopping criteria
 if iga>maxit || cost(1)<mincost
 break
 end
 [iga cost(1)];
end % iga
%_______________________________________________________
% Displays the output
day=clock;
disp(datestr(datenum(day(1),day(2),day(3),day(4),day(5), day(6)),0))
disp(['optimized function is ' ff])
format short g
disp(['popsize = ' num2str(popsize) ' mutrate = ' num2str(mutrate) ])
disp(['#generations=' num2str(iga) ' best cost=' num2str(cost(1))])
disp('best solution')
disp(num2str(poblacio(:,:,1)))
disp('continuous genetic algorithm')
figure(1)
iters=0:length(minc)-1;
plot(iters,minc,iters,meanc,'-');
xlabel('generation'); ylabel('cost');
% text(0,minc(1),'best');
% text(1,minc(2),'population average');
