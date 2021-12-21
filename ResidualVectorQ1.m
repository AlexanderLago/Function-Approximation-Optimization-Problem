%Solves for utiltiy 

function [RES] = ResidualVectorQ1(A,k,ApproxStruct,alpha,z,sigma,beta)
C=funeval(A,ApproxStruct,k);
k_next=(z*(k.^alpha))-C;
C_next=funeval(A,ApproxStruct,k_next);
RES= (beta.*((C_next.^(-sigma))./(C.^(-sigma))).*(alpha.*z*(k_next.^(alpha-1))))-1; %Solution to max problem including optimal c
end