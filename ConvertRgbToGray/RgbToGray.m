I = imread('building.jpg');
figure, imshow(I);

row = size(I,1);
coloumn = size(I,2);
N = double(zeros(size(I,1),size(I,2)));

for r = 1:row
for c = 1:coloumn
   N(r,c,1) = abs(0.3*I(r,c,1) + 0.6*I(r,c,2) + 0.11*I(r,c,3));
end
end

h = [-1 0 1; -2 0 2; -1 0 1];
v = [1 2 1; 0 0 0; -1 -2 -1];

M = double(zeros(size(I,1),size(I,2)));

for i=1:size(N,1)-2
for j=1:size(N,2)-2
    %Gradient operations
    Gx=sum(sum(v.*N(i:i+2,j:j+2)));
    Gy=sum(sum(h.*N(i:i+2,j:j+2)));
    %Magnitude of vector
    M(i+1,j+1)=sqrt(Gx.^2+Gy.^2);
end
end
figure, imshow(M);

for r = 1:row
for c = 1:coloumn
  if M(r,c)>210
    M(r,c)=255;
  else
    M(r,c)=0;
  end
end
end
figure, imshow(M);

for r = 1:row
for c = 1:coloumn
  if M(r,c)==255
    I(r,c, 1)=255;
    I(r,c, 2) =255;
    I(r,c, 3) = 0;
  end
end
end

figure, imshow(I)






