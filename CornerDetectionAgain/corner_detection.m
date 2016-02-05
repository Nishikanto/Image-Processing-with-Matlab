clear;
img = imread('checker.jpg'); 
if length(size(img))>2
img = rgb2gray(img);
end 
%%applying sobel edge detector in the horizontal direction
fx = [-1 0 1;-1 0 1;-1 0 1];
Ix = conv2(fx,img);


% applying sobel edge detector in the vertical direction
fy = [1 1 1;0 0 0;-1 -1 -1];
Iy = conv2(fy,img); 


Ix2 = Ix.^2;
figure, imshow(Ix2);


Iy2 = Iy.^2;
figure, imshow(Iy2);

Ixy = Ix.*Iy;
figure, imshow(Ixy);

clear Ix;
clear Iy;

%applying gaussian filter on the computed value
h= fspecial('gaussian',[50 50],2); 
Ix2 = filter2(h,Ix2);
Iy2 = filter2(h,Iy2);
Ixy = filter2(h,Ixy);



height = size(img,1);
width = size(img,2);
result = zeros(height,width); 
R = zeros(height,width);

Rmax = 0; 
for i = 1:height
for j = 1:width
M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)]; 
R(i,j) = det(M)-0.01*(trace(M))^2;
if R(i,j) > Rmax
Rmax = R(i,j);
end;
end;
end;

cnt = 0;
a = 0;
b = 0;

for i = 3:height-3
for j = 3:width-3
if R(i,j) > 0.05*Rmax && R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
   
        result(i,j) = 1;
        cnt = cnt+1;
   
end;
end;
end;

[posc, posr] = find(result == 1);

cnt;
imshow(img);
hold on;
plot(posr,posc,'*');






