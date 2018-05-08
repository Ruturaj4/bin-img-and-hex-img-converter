close all;

%user prompt - to get the path or name of the image to be converted
prompt = 'Please enter a image to be converted: ';
str = input(prompt,'s');

fid1 = fopen('train_number.odata');
B = fread(fid1, '*char');
fclose(fid1);

fid2 = fopen('train_number.odata');
C = fread(fid2, '*char');
fclose(fid2);

len = length(B);

B = reshape(B, [20,len/20]);
C = reshape(C, [20,len/20]);

G = zeros((len/20),1);

for i = 1:len/20
    E = B(15,i);
    F = C(16,i);
    
    D = strcat(E,F);
    G(i) = hex2dec(D);
end

G = G(5:len/20);

length(G)
G = reshape(G,98,61);

G = mat2gray(G);

%Rotate by 90 d
J = imrotate(G, -90);

%Now flipping the image
J = flip(J, 2);

imshow(J)