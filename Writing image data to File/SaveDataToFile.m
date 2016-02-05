
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% Writing Data To file
% I use pixel grouping here for save image data.  

%% 
% _Read image from the link_ 
im = imread('F:\Matlab\Matlab Works\Writing image data to File\images.jpg');

%% 
% _Show the orginal image_
subplot(2,2,1);
imshow(im), title('Orginal');

%% 
% _Select pixel from green channel with the condition that value is lowar
% than 60.
green = im(:,:,2) <=60;

%% 
% Save the all veriable value to 'ImageData.mat' file. 
folder = 'F:\Matlab\Matlab Works\Writing image data to File';
save(fullfile(folder, 'ImageData.mat'));