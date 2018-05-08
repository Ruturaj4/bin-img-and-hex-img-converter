close all;
%user prompt - to get the path or name of the image to be converted
prompt = 'Please enter a image to be converted: ';
str = input(prompt,'s');

%Now get the image dimentions from the user
prompt = 'Please enter Horizontal dimentions:';
hori = input(prompt);
prompt = 'Please enter Horizontal dimentions:';
vert = input(prompt);

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

dim = hori * vert;

B = reshape(B, [8, dim]);

B = B(1,:);

C=reshape(B, vert, hori);

%J = imrotate(C,90,'bilinear','crop');

%Show the image to the user
imshow(C);