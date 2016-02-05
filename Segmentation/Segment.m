
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% Segmentation
% Split an color image to its 3 RGB channels. 

%% 
% _Read image from the link_ 
c = imread('images.jpg');

%% 
% activecontour method returns a binary image. The foreground is white 
% (logical true) and the background is black(logical false)

I = rgb2gray(c);
mask = zeros(size(I));
mask(50:end-50,50:end-50) = 1;
bw = activecontour(I,mask,300);


subplot(2,2,1);
imshow(I)
title('Original Image');

subplot(2,2,2);
imshow(mask);
title('Initial Contour Location');

subplot(2,2,3);
imshow(bw);
title('Segmented Image');

%% Importance
% Sometimes we need to get a specific object from a image. by this process 
% we can split a object from its background. 



