% Continuous Genetic Algorithm
clear all
% objective function
ff= 'fitness'; 
%obj=[0,0,0,1,0,1,0,1];
obj=[1,1,0,0,0,0,0,1];
%obj=[0,1,1,0,0,0,0,1]
%obj=[0,1,1,1,0,0,0,1]


maxit=1400; % max number of iterations
mincost= 1; % minimum cost
portes=8;
%_______________________________________________________
% III GA parameters
popsize = 800; % set population size
selection = 0.5; % fraction of population kept
poblacio=poblacions(portes,popsize);
mutrate=0.15;
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
m_poblacio(:,:,1)=poblacio(:,:,1);
while iga<maxit
 iga=iga+1; % increments generation counter

 % Pair and mate
 %Performs mating using the single point crossover
 % ---------------------------------------------------
 fittest=poblacio(:,:,1:length(poblacio)*selection);
 descendencia=recombinacio(poblacio,portes); %em retorna la desendencia dels aparellaments aleatoris
 for i = 1: length(fittest(:,:,1))
     poblacio(:,:,i)=fittest(:,:,i);
 end
 for i = length(descendencia(:,:,1))*2: length(descendencia(:,:,1))*2
     poblacio(:,:,i)=descendencia(:,:,i);
 end
 
% %Ordenado posterior a recombinacion
 for i=1:popsize
 cost(i)=fitness(poblacio(:,:,i),obj);
 end
[cost,ind]=sort(cost);
poblacio=poblacio(:,:,ind); % sort continuous

 %Mutate the population
% ---------------------------------------------------
no_mut=poblacio
% m_poblacio=mutacio(poblacio(:,:,1),portes,mutrate);
%  if fitness(poblacio(:,:,1),obj)>fitness(m_poblacio,obj)
%  poblacio(:,:,1)= m_poblacio(:,:,1);
%  end
 for ii=1:length(poblacio)
    poblacio(:,:,ii)=mutacio(no_mut(:,:,ii),portes,mutrate);% mutatio
 end
    poblacio(:,:,1)= no_mut(:,:,1);
 
 % Thenew offspring and mutated chromosomes are evaluated
 % ---------------------------------------------------
 % cost=feval(ff,par); & WHY THIS IS NOT WORKING!!!!
 for h=1:popsize
 cost(h)=fitness(poblacio(:,:,h),obj);
 end
[cost,ind]=sort(cost);
poblacio=poblacio(:,:,ind);
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
