%%Metropolis-Hastings algorithm with a random walk sampler
clc
clear all
N=2000; %number of samples
f = @(x,y)(sin(7*(2*x^2+3*y^2)))^2; %The given f
%The acceptance probability function 
alpha = @(x1,x2,y1,y2) (min(1,f(y1,y2)/f(x1,x2))); %Metropolis sampler since g is even
%Applying the algorithm
%selection
X = zeros(2,N); % preallocating memory
inellipse=@(x,y) 2*x^2+3*y^2<=1/4;
for i = 2:N
while(1)
    x=1-2*rand;
    y=1-2*rand;
    if(inellipse(x,y))
        break;
    end
end
%Third condition of the algorithm
u = rand();
c=(u<alpha(X(1,i-1),X(2,i-1),X(1,i-1)+x,X(2,i-1)+y));
X(1,i)=c*x+X(1,i-1);
X(2,i)=c*y+X(2,i-1);
end
%The Plotting Part
scatter(X(1,:),X(2,:),'.')
axis equal
grid on

