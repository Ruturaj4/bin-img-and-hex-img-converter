close all;

%user prompt - to get the path or name of the image to be converted
prompt = 'Please enter a image to be converted: ';
str = input(prompt,'s');

fid1 = fopen(str);
B = fread(fid1, '*char');
C = fread(fid1, '*char');
fclose(fid1);

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
G = reshape(G,463,598);
G = mat2gray(G);

J = imrotate(G, -90);

imshow(J)

%C=reshape(B,465, 600);

%J = imrotate(C,90,'bilinear','crop');

%imshow(C);