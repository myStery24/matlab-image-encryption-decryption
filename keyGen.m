function [key] = keyGen(n) % n is the number of bytes in key

n = n*8; % Convert bytes to bits
% n = 2048*2048*16;
% n = 24 * 24 * 8;
bin_x = zeros(n,1,'uint8'); % Store binary representation of key
r = 3.9999998;
bin_x_N_Minus_1 =  0.300001; % Value used to calculate the next bit
x_N = 0;

% tic and toc functions used to calculate the time of the for-loop complete
tic % Record the current time

for index = 2 : n
    x_N = 1 - 2* bin_x_N_Minus_1 * bin_x_N_Minus_1;
    if (x_N > 0.0) % if x_N is positive, the key = 1
        bin_x(index-1) = 1;
    end
    bin_x_N_Minus_1 =  x_N; % if x_N is not positive, the key = 0
end

toc % Calculate the elapsed time using the recorded value
% Save bin_sec bin_x;
t = uint8(0);
key = zeros(n/8,1,'uint8'); % 8-bit number represented by taking every (N/8)th entry in bin_x, starting from K.

% Convert bits of key into bytes and store in 'key' output array
for index1 = 1 : n/8
    for index2 = 1 : 8
        key(index1) = key(index1) + bin_x(index2*index1)* 2 ^ (index2-1);
    end 
end