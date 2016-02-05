
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% Pixel Grouping
% Group a certain pixel from a image. 

%% 
% _Read image from the link_ 
im = imread('F:\Matlab\Matlab Works\Pixel Grouping\images.jpg');

%% 
% _Show the orginal image_
subplot(2,2,1);
imshow(im), title('Orginal');

%% 
% _Select pixel from green channel with the condition that value is lowar
% than 60.
green = im(:,:,2) <=60;

%% 
% create a 2-D arrays of zeros for the other channels of rgb image
a = zeros(size(im, 1), size(im, 2));

%% 
% Create a image with the specified pixel of green channel. 
just_green = cat(3, a, green, a);

%% 
% Show the image
subplot(2,2,2);
imshow(just_green), title('After gruping some pixel from green channel');

%% Importance :
% We can use this this program to group some specific pixels for farther
% processing. We can use any condition for specifing pixels. pixel grouping
% mainly needed for detecting a object that match to the specific pixels. 
