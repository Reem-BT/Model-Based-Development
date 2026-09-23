


Wn=[1 2 4];
Zeta=[0.1 0.5 0.9];
t=0:0.01:10;
step_input=ones(size(t));


figure
for i=1:length(Wn)
    for j=1:length(Zeta)
num=[0 Wn(i)^2];
den=[1, 2*Zeta(j)*Wn(i), Wn(i)^2];

G=tf(num,den);

[y,t]=step(G, t);

plot_idx = (i - 1) * 3 + j;
subplot(3,3,plot_idx);

plot(t,step_input,'b--','LineWidth',1)
hold on

plot(t,y,'r','LineWidth',1.5)

hold off

xlabel('Time');
ylabel('System Response');

if Zeta(j)<1
title(['\zeta = ',num2str(Zeta(j)), ', \omega_n = ',num2str(Wn(i)),' — Complex Conjugate Poles']);   

end

    end
end


