% Visualizing Boundaries: this is using matlab's internal code
%         you will have to conform it your data structures to use
%     This is visualizing the linear function defining the class boundaries
%          boundaries for each class comparison (eq 4.9)
%    MDlLinear is a matrix of discriminant functions
%    featureVector is the features to show
%    labels are the feature vector labels as a categorical array
%    featureA and FeatureB are the index of the features to visualize
function visualizeBoundaries(Wstar,featureVector,labels,featureA,featureB)


clf
category_names = categories(labels);
numGroups = length(category_names);
colors = jet(numGroups*10);
colors = colors(round(linspace(1,numGroups*10,numGroups)),:);
lim_info =  [min(featureVector(:,featureA)),max(featureVector(:,featureA)),...
    min(featureVector(:,featureB)),max(featureVector(:,featureB))  ];

h1 = gscatter(featureVector(:,featureA),featureVector(:,featureB),labels,'','+o*v^');
for i = 1:numGroups
    h1(i).LineWidth = 2;
    h1(i).MarkerEdgeColor = min(colors(i,:)*1.2,1);
end
hold on
x =  [min(featureVector(:,featureA)),max(featureVector(:,featureA)) ];
h2 = [];
        for i = 1:numGroups
            %w_0 = Wstar(1,i);
            h2 = cat(1,h2,plot(x,(- Wstar(1,i)*x) / Wstar(2,i),'LineWidth',2,...
                'DisplayName',sprintf('Class Sep b/w %s,%s',category_names{i})));
        end


axis(lim_info);
hold off
grid on;
set(gca,'FontWeight','bold','LineWidth',2)