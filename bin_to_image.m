close all;
%user prompt - to get the path or name of the image to be converted
prompt = 'Please enter a image to be converted: ';
str = input(prompt,'s');

%Open the bin file inputed by the user
fid = fopen(str);

B = fread(fid, '*uint8');

%Collecting the length of the file
l = length(B);

%Get rid of 24 elements
l = l - 24;
%Close the file
fclose(fid);

B = B(1:l);

B = reshape(B, [8, 279000]);

B = B(1,:);

C=reshape(B,465, 600);

%J = imrotate(C,90,'bilinear','crop');

%Show the image to the user
imshow(C);