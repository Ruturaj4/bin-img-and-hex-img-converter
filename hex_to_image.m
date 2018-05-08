close all;

%user prompt - to get the path or name of the image to be converted
prompt = 'Please enter a image to be converted: ';
str = input(prompt,'s');

%Now get the image dimentions from the user
prompt = 'Please enter Horizontal dimentions:';
hori = input(prompt);
prompt = 'Please enter Horizontal dimentions:';
vert = input(prompt);

fid1 = fopen(str);
B = fread(fid1, '*char');
fclose(fid1);

len = length(B);

B = reshape(B, [20,len/20]);
C = B;

G = zeros((len/20),1);

for i = 1:len/20
    %We need to consider 15th and 16th row, as they contain all the data
    E = B(15,i);
    F = C(16,i);
    
    D = strcat(E,F);
    G(i) = hex2dec(D);
end

G = G(5:len/20);

G = reshape(G, hori, vert);

G = mat2gray(G);

%Rotate by 90 d
J = imrotate(G, -90);

%Now flipping the image
J = flip(J, 2);

imshow(J)