%% Encryption and Decryption
function [proImageOut] = imageProcess(ImgSrc,key)
[n m k] = size(ImgSrc); % Returns a row vector of the selected image
% key = cell2mat(struct2cell( load('key5.mat')));
% key = keyGen(n*m);

% Generate
for index = 1 : m    
    Fkey(:,index) = key((1+(index-1)*n) : (((index-1)*n)+n));
end

length = n; % get the length
width = m; % get the width
for index = 1 : k
    Img = ImgSrc(:,:,index);
for index1 = 1 : length
    for index2 = 1 : width
        % XOR bit-wise of objects Img and Fkey
        proImage(index1,index2) = bitxor(Img(index1,index2),Fkey(index1,index2));        
    end
end

% Output
proImageOut(:,:,index) = proImage(:,:,1);
end

% figure, imshow(proImageOut);
return;