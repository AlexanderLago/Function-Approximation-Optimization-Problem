%Question 1: Solve Maximization Problem using Collocation method
%find ct*

cepath='C:\Users\alexa\OneDrive\Documents\Grad School\Fall 2021\Computational Economics\compecon2011\'; path([cepath 'CEtools;' cepath 'CEdemos'],path);
%define parameters
alpha=0.33;
z=3;
sigma = 1.000001;%sigma=2;
beta=.96;

a=0.01;
b=2.0;

n=50;

%define function that receives vector of coefficients and vector of nodes
%and defines g. Gives back a vector of residuals. 
%x nodes

ApproxStruct= fundefn('spli',n,a,b,3); %defines splines (order 3)

k_nodes = funnode(ApproxStruct); %
n_fine=1000;
k_fine=linspace(a,b,n_fine)';
%Vector A s.t. F(A,x_nodes)=0
fun=@(A) ResidualVectorQ1(A,k_nodes,ApproxStruct,alpha,z,sigma,beta);
A0=.5*(z*(k_nodes.^alpha));
A_hat = fsolve(fun,A0,optimset('Display','off'))   %getting A hats

%2.)

% K approximation k(k) = f (k) − cˆ(k)

sigma = 1.000001;
C_hat = funeval(A_hat,ApproxStruct,k_fine); %this is chat
%C_hat= exp(beta*(ResidualVectorQ1(A_hat,k_fine,ApproxStruct,alpha,z,1.000001,beta)));
f_k =(z*(k_fine.^alpha)); %z*k.^alpha;
k_hat_star = f_k -C_hat;

%(k) = αβzk^α
K_star= alpha*beta*(z*(k_fine.^alpha));

plot(K_star,k_fine,'*',k_hat_star,k_fine,'.')

MaxDiff= max(abs(K_star-k_hat_star))



%3 Suppose k0=0.1 use K^*(k) to simulate it = kt+1 for T=15 periods.
%sigma=2.0;
%sigma=0.5


%sigma 2.0
K_star_20=0.1;
%C_hat_2S = exp(beta*(ResidualVectorQ1(A_hat,k_nodes,ApproxStruct,alpha,z,2.0,beta)));
fun=@(A) ResidualVectorQ1(A,k_nodes,ApproxStruct,alpha,z,2,beta);
A0=.5*(z*(k_nodes.^alpha));
A_hat_2 = fsolve(fun,A0,optimset('Display','off'));


for t=1:15
   C_hat_2S = funeval(A_hat_2,ApproxStruct,K_star_20);
   k_hat_star_2S(t) = (z*(K_star_20.^alpha))-C_hat_2S;
   K_star_20 = k_hat_star_2S(t);
end
k_hat_star_2S(end);

%sigma 0.5

fun=@(A) ResidualVectorQ1(A,k_nodes,ApproxStruct,alpha,z,0.5,beta);
A0=.5*(z*(k_nodes.^alpha));
A_hat_half = fsolve(fun,A0,optimset('Display','off'));

k_hat_star_halfS0=0.1;
%C_hat_halfS = exp(beta*(ResidualVectorQ1(A_hat,k_nodes,ApproxStruct,alpha,z,0.5,beta)));

for t=1:15
    C_hat_halfS=funeval(A_hat_half,ApproxStruct,k_hat_star_halfS0);
   k_hat_star_halfS(t) = (z*(k_hat_star_halfS0.^alpha))-C_hat_halfS;
    k_hat_star_halfS0 = k_hat_star_halfS(t);
end
k_hat_star_halfS(end);
X=linspace(-2,3,15);
plot(X,k_hat_star_2S,'-', X,k_hat_star_halfS,'*')


% From looking at the graph, it seems as if the starting point of sigma 0.5
% converges faster to the final value. 