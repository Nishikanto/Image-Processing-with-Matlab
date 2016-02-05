
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% Edge Detection 
% Detection edge of a image using different edge detection method. 

%% 
% _Read image from the link_ 
rgb = imread('C:\Users\nishi_000\Desktop\Extra\simul2.jpg'); 

%%
% _Convert RGB to Grayscale_
a = rgb2gray(rgb);


%% 
% *Detecting Edge using different operator :* 
%   edge() method hass been use for detecting age. It takes two parameter.A
% gray scale image and a operator. There six different kinds of oparetor is
% used in this image. 
%   Here canny operator give the best result for edge detection of a image. 
% Because its give good result with the both normal and noisy image. others 
% are sensitive to noisy images.

b = edge(a, 'canny'); 
c = edge(a, 'sobel');
d = edge(a, 'prewitt');
e = edge(a, 'log');
f = edge(a, 'Roberts');
g = edge(a, 'zerocross');


%%
% _Show image to a 3*3 grid_
subplot(3,3,1);
imshow(a); 
title('input image');

subplot(3,3,2); 
imshow(b);  
title('canny edge');

subplot(3,3,3);
imshow(c); 
title('sobel edge');

subplot(3,3,4);
imshow(d); 
title('prewitt edge');

subplot(3,3,5);
imshow(e);
title('log edge');

subplot(3,3,6);
imshow(f);
title('Roberts edge');

subplot(3,3,7);
imshow(g);
title('zerocross');

%%
% *Algorithm Performance :* 
% Edge  detection  is  a  basic  tool  used  in  image  processing,  
% basically  for  feature  detection  and extraction,  which  aim  to  
% identify  points  in  a  digital  image  where  brightness  of  image  
% changes sharply  and  find  discontinuities.  The  purpose  of  edge  
% detection  is  significantly  reducing  the amount of data in an image 
% and preserves the structural properties for further image processing. 




