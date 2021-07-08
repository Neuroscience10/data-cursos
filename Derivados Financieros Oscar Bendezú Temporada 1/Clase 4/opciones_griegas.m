clear all;
clc;

r = 0.0165; %retorno libre de riesgo
d = 0.0175; %dividendo anual
Sigma = 0.10; %volatilidad del precio del subyacente
K = 100; %Precio Strike
T = [0.0001 0.5 1 2 3]; %vencimiento en años
S = linspace(0.80*K,1.20*K);

figure
for t = 1: size(T,2)
    [Call,Put] = blsprice(S,K,r,T(t),Sigma,d);
    [CallDelta,PutDelta] = blsdelta(S,K,r,T(t),Sigma,d);
    Gamma = blsgamma(S,K,r,T(t),Sigma,d);
    Vega = blsvega(S,K,r,T(t),Sigma,d);
    [CallTheta,PutTheta] = blstheta(S,K,r,T(t),Sigma,d);
    [CallRho,PutRho] = blsrho(S,K,r,T(t),Sigma,d);
    
    hold on
    subplot(3,4,1)
    plot(S,Call)
    title('Valor Call')
    xlabel('S en t')
    ylabel('Call en t')
    hold off
    
    hold on
    subplot(3,4,2)
    plot(S,CallDelta)
    title('Delta de Call')
    xlabel('S en t')
    ylabel('Delta en t')
    hold off
    
    hold on
    subplot(3,4,3)
    plot(S,CallTheta)
    title('Theta de Call')
    xlabel('S en t')
    ylabel('Theta en t')
    hold off
    
    hold on
    subplot(3,4,4)
    plot(S,CallRho)
    title('Rho de Call')
    xlabel('S en t')
    ylabel('Rho en t')
    hold off
    
    hold on
    subplot(3,4,5)
    plot(S,Put)
    title('Valor Put')
    xlabel('S en t')
    ylabel('Put en t')
    hold off
    
    hold on
    subplot(3,4,6)
    plot(S,PutDelta)
    title('Delta de Put')
    xlabel('S en t')
    ylabel('Delta en t')
    
    hold on
    subplot(3,4,7)
    plot(S,PutTheta)
    title('Theta de Put')
    xlabel('S en t')
    ylabel('Theta en t')
    hold off
    
    hold on
    subplot(3,4,8)
    plot(S,PutRho)
    title('Rho de Put')
    xlabel('S en t')
    ylabel('Rho en t')
    hold off
    
    hold on
    subplot(3,4,10)
    plot(S,Gamma)
    title('Gamma de Call & Put')
    xlabel('S en t')
    ylabel('Gamma en t')
    hold off
    
    hold on
    subplot(3,4,11)
    plot(S,Vega)
    title('Vega de Call & Put')
    xlabel('S en t')
    ylabel('Vega en t')
    hold off
    
end

for i = [1 2 3 4 5 6 7 8 10 11]
    subplot(3,4,i)
    legend("T = "+string(T),'Location','northwest')
end
