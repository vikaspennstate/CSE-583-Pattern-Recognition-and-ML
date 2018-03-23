%start code for project #1: linear regression
%pattern recognition, CSE583/EE552
%Weina Ge, Aug 2008
%Christopher Funk, Jan 2018

addpath export_fig/

%load the data points
load data.mat

%plot the groud truth curve
figure(1)
clf
hold on;
xx = linspace(1,4*pi,50);
yy = sin(.5*xx);
err = ones(size(xx))*0.3;
% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(x,y,err,{'b-','color','b','LineWidth',2},0);
%plot the noisy observations
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
hold off; 
% Make it look good
grid on;
set(gca,'FontWeight','bold','LineWidth',2)
xlabel('x')
ylabel('t')

% Save the image into a decent resolution
export_fig sampleplot -png -transparent -r150

%% Start your curve fitting program here



