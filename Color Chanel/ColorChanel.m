
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% RGB channels
% Split an color image to its 3 RGB channels. 

%% 
% _Read image from the link_ 
img = imread('pen.jpg'); % Read image

%% 
% Taking the RGB image, img, and extracting the red, 
% green, and blue parts and creating 3 2-D matrices: red,green, and blue.
red = img(:,:,1); 
green = img(:,:,2); 
blue = img(:,:,3); 


%% 
% create a 2-D array of zeros
a = zeros(size(img, 1), size(img, 2));

%% 
% cat method return a image with specific color channel 
% by setting others channel zero. cat method return a image 
% with specific color channel by setting others channel zero. 

just_red = cat(3, red, a, a);
just_green = cat(3, a, green, a);
just_blue = cat(3, a, a, blue);

%% 
% showing these channel
subplot(2,2,1);
imshow(just_red), title('Red channel')

subplot(2,2,2);
imshow(just_green), title('Green channel')

subplot(2,2,3);
imshow(just_blue), title('Blue channel')

back_to_original_img = cat(3, red, green, blue);
subplot(2,2,4);
imshow(back_to_original_img), title('Back to original image')


%% Importance :
% Each natural color can be approximated by a combination of the three 
% basic colors. Each basic color of an image stored in a group accidental 
% data called channel. In this way we can observe the tendency of the 
% dominant basic color in an image for a specific analysis needs.




