
im = imread("iris-1.jpg");
imshow(im);
[centers, radii, metric] = imfindcircles(im,[16 50], 'ObjectPolarity', 'dark','Sensitivity', 0.93);

centersStrong5 = centers(1,:); 
radiiStrong5 = radii(1);
metricStrong5 = metric(1);

disp(radiiStrong5)

viscircles(centersStrong5, radiiStrong5,'EdgeColor','b');