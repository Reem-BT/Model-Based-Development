

num=1;
den=[1 1];

sys=tf(num,den);

t=0:0.01:10;

ki_values= [0.001 ,0.01 ,0.1 ,1 10 ,50,100];


figure;

OpenLoopRes= step(sys,t);
plot(t,OpenLoopRes,'k--','LineWidth',1.5);

hold on

ClosedLoopResWithoutController=step(sys/(1+sys),t);
plot(t,ClosedLoopResWithoutController,'b--','LineWidth',1.5);

hold on

for i = 1: length(ki_values)
    ki=ki_values(i);
   I_controller = tf(ki,[1 0]);
   SysWithController = series(I_controller , sys);
    closedLoopSysWithController = feedback(SysWithController,1 );
    
    SysResWithController = step(closedLoopSysWithController ,t);
   
    plot(t,SysResWithController,'LineWidth',1.5);
    
    hold on 
end

xlim([0 ,10]);
ylim([0, 1.2]);

title ('Effect of Ki on Sytem Responcee (first order)');
xlabel('Time');
ylabel('SysResponsce');

legend (['Open Loop';'Closed Loop Without Controller';cellstr(num2str(ki_values'))]);










