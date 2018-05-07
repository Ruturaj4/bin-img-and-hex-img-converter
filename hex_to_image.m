close all;
fid1 = fopen('ku_eecs_743_median_filter_master_32_chrysler_noise_S_out.odata');
B = fread(fid1, '*char');
fclose(fid1);

fid2 = fopen('ku_eecs_743_median_filter_master_32_chrysler_noise_S_out.odata');
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
G = reshape(G,463,598);
G = mat2gray(G);

imshow(G)

%C=reshape(B,465, 600);

%J = imrotate(C,90,'bilinear','crop');

%imshow(C);