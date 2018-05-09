clear all;
close all;
clc;

%user prompt - to get the path or name of the image to be converted
prompt = 'Please enter a image to be converted: ';
str = input(prompt,'s');

%Now get the image dimentions from the user
prompt = 'Please enter Horizontal dimention: ';
hori = input(prompt);
prompt = 'Please enter Vertical dimention: ';
vert = input(prompt);

%Open an hex image into a file
fid1 = fopen(str);

%Read in the file
B = fread(fid1, '*char');
fclose(fid1);

len = length(B);

B = reshape(B, [20,len/20]);

%Array of zeros
G = zeros((len/20),1);

for i = 1:len/20
    %We need to consider 15th and 16th row, as they contain all the data
    E = B(15,i);
    F = B(16,i);
    
    %Concatinating the two rows, to ultimately convet it into hex
    D = strcat(E,F);
    G(i) = hex2dec(D);
end

G = G(5:len/20);

%Reshaping the image according the dimentions
G = reshape(G, (hori-2), (vert-2));

G = mat2gray(G);

%Rotate by 90 d
J = imrotate(G, -90);

%Now flipping the image
J = flip(J, 2);

imshow(J);

%Now writing the image into jpg format
imwrite(J, [str(1, 1:length(str)-6) '_output.jpg']);
