%% CITS4402 Lab2 week3 Submission (test1.m uses provided example images)
% Isaac Bergl (22710992)

% Clear Environment
    clear;
    clc;
        f = figure();
    f.Position = [100 0 1200 800];

  
%% Hyper Parameters

    lowPassImageName = 'cat.jpg';
    highPassImageName = 'mouse.jpg';

    lowPass_c = 0.038;
    lowPass_n = 2;

    highPass_c = 0.2;
    highPass_n = 2;


%% Scripting 



% Import Images
    % low-pass
        lowPassImage = rgb2gray(imread(lowPassImageName));
        subplot(3, 4, 1);
        imshow(lowPassImage);
    
    % high-pass
        highPassImage = rgb2gray(imread(highPassImageName));
        subplot(3, 4, 5);
        imshow(highPassImage);

% Show the 2D Fourier Transform
    % low-pass
        lowPassFFT = fft2(lowPassImage);
        subplot(3, 4, 2);
        imagesc(abs(fftshift(lowPassFFT)));

    % high-pass
        highPassFFT = fft2(highPassImage);
        subplot(3, 4, 6);
        imagesc(abs(fftshift(highPassFFT)));

% Create and Apply Filters
    % low-pass
        lowPassFilter = lowpassfilter(size(lowPassFFT), lowPass_c, lowPass_n);
        lowPassFiltered = lowPassFFT.*lowPassFilter;  
        subplot(3, 4, 3);
        imagesc(abs(fftshift(lowPassFiltered)));

    % high-pass
        highPassFilter = highpassfilter(size(highPassFFT), highPass_c, highPass_n);
        highPassFiltered = highPassFFT.*highPassFilter;
        subplot(3, 4, 7);
        imagesc(abs(fftshift(highPassFiltered)));

% Add Frequency Domains
    composite = lowPassFiltered + highPassFiltered;
    subplot(3, 4, 11);
    imagesc(abs(fftshift(composite)));

% Invert the FFT
    % low-pass 
        lowPassIFFT = ifft2(lowPassFiltered);
        subplot(3, 4, 4);
        imshow(uint8(abs(lowPassIFFT)));

    % high-pass
        highPassIFFT = ifft2(highPassFiltered);
        subplot(3, 4, 8);
        imshow(uint8(abs(highPassIFFT)));

    % composite
        compositeIFFT = ifft2(composite);
        subplot(3, 4, 12);
        imshow(uint8(abs(compositeIFFT)));

% Add Titles to Plots
    % x labels
        subplot(3,4,1);
        title('Original Image');

        subplot(3,4,2);
        title('Frequency Domain');

        subplot(3,4,3);
        title('Filtered Frequency Domain');

        subplot(3,4,4);
        title('Filtered Image');
    
    % y labels
        subplot(3,4,1);
        ylabel('Blurred Image');
        
        subplot(3,4,5);
        ylabel('Sharpened Image');
        
        subplot(3,4,9);
        ylabel('Combined Image');
        set(gca, 'visible', 'off')
        set(findall(gca, 'type', 'text'), 'visible', 'on')
    

