
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% Load Data To file
% load the save data from 'SaveDataToFile.m' file. 

%load all veriable from .mat file
load('F:\Matlab\Matlab Works\Writing image data to File\ImageData.mat');

a = zeros(size(im, 1), size(im, 2));

just_green = cat(3, a, green, a);

%% 
% Show the image
subplot(2,2,2);
imshow(just_green), title('After gruping some pixel from green channel');