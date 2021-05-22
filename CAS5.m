%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CAS 5
%Code Author: Ellisa Booker
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% Clear workspace
close all;
clear;
clc;

% Load the images
[img,cm] = imread("im_car.png");
[img2,cm2] = imread("im_coins.png");
[img3,cm3] = imread("im_eagles.png");

% Display image with imported colormap
figure(1)
subplot(1,3,1)
imshow(img,cm)

subplot(1,3,2)
imshow(img2,cm2)

subplot(1,3,3)
imshow(img3,cm3)

% Build an averaging (smoothing) low pass filter, HSIZE = 20
h = fspecial('average',[20 20]);

% Filter the images with the lowpass filter above
figure(2)
subplot(1,3,1)
a = imfilter(img,h);
imshow(a,cm)

subplot(1,3,2)
b = imfilter(img2,h);
imshow(b,cm2)

subplot(1,3,3)
c = imfilter(img3,h);
imshow(c,cm3)

% Plot the frequency content of the lowpass filtered images
figure(3)
subplot(3,1,1)
[A,F] =myFFT2(a); 
%plot(F,abs(A));
%xlim([0 0.2])

subplot(3,1,2)
[A2,F2] =myFFT2(b);
%plot(F2,abs(A2));
%xlim([0 0.2])

subplot(3,1,3)
[A3,F3] =myFFT2(c);
%plot(F3,abs(A3));
%xlim([0 0.2])

% Create zeros matrix of size HSIZE with a 1 at the center (2D impulse)
x = zeros(20,20);
x(8,8) = 1;

% Create a high pass filter by subtracting low pass filter from 2D impulse
h2= h-x;

% Filter the images with the highpass filter above
figure(4)
subplot(3,1,1)
a2 = imfilter(img,h2);
imshow(a2, cm)

subplot(3,1,2)
b2 = imfilter(img2,h2);
imshow(b2, cm2)

subplot(3,1,3)
c2 = imfilter(img3,h2);
imshow(c2,cm3)