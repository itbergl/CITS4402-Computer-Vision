% Isaac Bergl
% 22710992

% Read and Display Image
    figure("Name", 'Original Image');
    im = imread('lego1.png');
    imshow(im);
    title('Original Image');
    
    

% Display Greyscaled Image
    figure("Name", 'Greyscaled Image');
    g = rgb2gray(im);
    imshow(g);
    title('Greyscaled Image');
    

% Display Histogram
    figure("Name", 'Histogram of Greyscale values');
    imhist(g); 
    title('Histogram of Greyscale values');
    

% Display Black and White Image at Threshold of 172
    figure("Name",'Black and White Filter with Threshhold = 172');
    bw = g > 172;
    imshow(bw);
    title('Black and White Filter with Threshhold = 172');

% Apply and Display Erosion
    figure("Name",'Eroded Image');
    SE = strel('square', 4);
    bw_e = imerode(~bw,SE);
    imshow(bw_e);
    title('Eroded Image');

% Apply and Display Dilation
    figure("Name",'Dilated Image');
    SE = strel('square', 4);
    bw_d = imdilate(~bw,SE);
    imshow(bw_d);
    title('Dilated Image');

% Find and Print Correct Number of Components - 20
    
    % Do an erosion followed by an dilation to make
    % an opening - will remove any tiny non-components
    % and then fill back in holes within the components

    SE_e = strel('square', 3);     
    bw_e = imerode(~bw,SE_e);
    
    SE_d = strel('square', 5);      
    bw_d = imdilate(bw_e, SE_d);
    
    [L, num] = bwlabel(bw_d, 8);   
    disp(num);




