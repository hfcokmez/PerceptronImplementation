clear all 
close all
clc

load('perceptronDataset.mat')
 
plot(classes(1,1:100), classes(2,1:100),'+');
hold
plot(classes(1,101:200), classes(2,101:200),'*');

w_init1 =[1 1 -0.5]';
w_init2 = [1 1 0.5]';
rho=0.01;


w_final1 = Algorithm(w_init1,classes,rho);
x1(1,1)=-w_final1(3,1)/w_final1(1,1); x1(1,2)=0;
x2(1,2)=-w_final1(3,1)/w_final1(2,1); x2(1,1)=0;
line(x1,x2);


w_final2 = Algorithm(w_init2,classes,rho);
y1(1,1)=-w_final2(3,1)/w_final2(1,1); y1(1,2)=0;
y2(1,2)=-w_final2(3,1)/w_final2(2,1); y2(1,1)=0;
line(y1,y2);

