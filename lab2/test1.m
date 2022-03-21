% Isaac Bergl 
% 22710992
% lab02

% Note: Subplot of imaqges is labelled as a matrix - each label corresponds
%       to the whole row/columns

% Clear Environment
    clear;
    clc;
        f = figure();
    f.Position = [100 0 1200 800];

  
%% Hyper Parameters

    lowPassImageName = 'rhino.jpg';
    highPassImageName = 'frog.jpg';

    lowPass_c = 0.038;
    lowPass_n = 2;

    highPass_c = 0.2;
    highPass_n = 2;


%% Scripting 



% Import Images
    % low-pass
        lowPassImage = rgb2gray(imread(lowPassImageName));
        subplot(3, 3, 1);
        imshow(lowPassImage);
    
    % high-pass
        highPassImage = rgb2gray(imread(highPassImageName));
        subplot(3, 3, 4);
        imshow(highPassImage);

% Apply 2D Fourier Transform
    % low-pass
        lowPassFFT = fft2(lowPassImage);

    % high-pass
        highPassFFT = fft2(highPassImage);

% Create and Apply Filters
    % low-pass
        lowPassFilter = lowpassfilter(size(lowPassFFT), lowPass_c, lowPass_n);
        lowPassFiltered = lowPassFFT.*lowPassFilter;  
        subplot(3, 3, 2);
        imagesc(abs(fftshift(lowPassFiltered)));

    % high-pass
        highPassFilter = highpassfilter(size(highPassFFT), highPass_c, highPass_n);
        highPassFiltered = highPassFFT.*highPassFilter;
        subplot(3, 3, 5);
        imagesc(abs(fftshift(highPassFiltered)));

% Add Frequency Domains
    composite = lowPassFiltered + highPassFiltered;
    subplot(3, 3, 8);
    imagesc(abs(fftshift(composite)));

% Invert the FFT
    % low-pass 
        lowPassIFFT = ifft2(lowPassFiltered);
        subplot(3, 3, 3);
        imshow(uint8(abs(lowPassIFFT)));

    % high-pass
        highPassIFFT = ifft2(highPassFiltered);
        subplot(3, 3, 6);
        imshow(uint8(abs(highPassIFFT)));

    % composite
        compositeIFFT = ifft2(composite);
        subplot(3, 3, 9);
        imshow(uint8(abs(compositeIFFT)));
    
% Add Titles to Plots
    % x labels
        subplot(3,3,1);
        title('Original Image');

        subplot(3,3,2);
        title('Filtered Frequency Domain');

        subplot(3,3,3);
        title('Filtered Image');
    
    % y labels
        subplot(3,3,1);
        ylabel('Blurred Image');
        
        subplot(3,3,4);
        ylabel('Sharpened Image');
        
        subplot(3,3,7);
        ylabel('Combined Image');
        set(gca, 'visible', 'off')
        set(findall(gca, 'type', 'text'), 'visible', 'on')

figure();
imshow(uint8(abs(compositeIFFT)));
title("Output Image");
    

