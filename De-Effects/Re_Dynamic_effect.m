%% Reverse Compressor 
clc; clear all; close all;

[y, fs] = audioread('output_compressed.wav');

while true
    threshold = input('Enter threshold (0 to -100 dB): ');
    if threshold < 0 && threshold > -100
        break; 
    else
        disp('Error: Enter threshold between 0 and -100 dB.');
    end
end


while true
    ratio = input('Enter expansion ratio (1 to 20): ');
    if ratio >= 1 && ratio <= 20
        break; 
    else
        disp('Error: Enter expansion ratio between 1 and 20.');
    end
end

while true
    makeupgain = input('Enter makeup gain (1 to 10): ');
    if makeupgain >= 1 && makeupgain <= 10
        break; 
    else
        disp('Error: Enter makeup gain between 1 and 10.');
    end
end

while true
    attacktime = input('Enter attack time (0 to 1): ');
    if attacktime >= 0 && attacktime <= 1
        break; 
    else
        disp('Error: Enter attack time between 0 and 1.');
    end
end


while true
    releasetime = input('Enter release time (0 to 1): ');
    if releasetime >= 0 && releasetime <= 1
        break; 
    else
        disp('Error: Enter release time between 0 and 1.');
    end
end


thresholdLin = 10^(threshold / 20);
makeupgainLin = 10^(makeupgain / 20);

attackSamples = round(attacktime * fs);
releaseSamples = round(releasetime * fs);

y1 = zeros(size(y));
gainEn = 1;

for n = 1:length(y)
    inputLevel = abs(y(n));
  
    if inputLevel > thresholdLin
        gainEx = 1 + (ratio - 1) * (inputLevel - thresholdLin) / inputLevel;
    else
        gainEx = 1;
    end
 
    if gainEx > gainEn
        gainEn = gainEn + (gainEx - gainEn) / attackSamples;
    else
        gainEn = gainEn + (gainEx - gainEn) / releaseSamples;
    end
    y1(n) = y(n) * gainEn;
end

y1 = y1 * makeupgainLin;
y1 = min(max(y1, -1), 1);
audiowrite('output_expanded.wav', y1, fs);
sound(y1, fs);
subplot(211); plot(y); title('Compressed Signal');
subplot(212); plot(y1); title('Expanded (Reverse Compression)');

%% Reverse Distortion 

clc; clear all; close all;
[y, Fs] = audioread('output_distorted.wav');

N_fft = length(y);               
window = hanning(N_fft);
f = linspace(-Fs/3, Fs/3, N_fft); 
while true
    gain = input('Enter amplifying factor used (up to 50): ');
    if gain >= 0 && gain <= 50
        break; 
    else
        disp('Error: Amplifying factor must be between 0 and 50.');
    end
end
Y = fftshift(fft(y .* window, N_fft));

threshold = 0.1 * max(magY);  
Y_filtered = Y;
Y_filtered(magY < threshold) = 0;
y1 = real(ifft(ifftshift(Y_filtered), N_fft)); 

y1 = y1 / max(abs(y1));  
y1 = flipud(y1);

audiowrite('output_recovered.wav', y1, Fs);

sound(y1, Fs);
subplot(211); plot(y);title('Distorted Audio Signal');
subplot(212);plot(y1);title('Recovered Audio Signal');

%% Normalize
clc; clear all; close all;
[y, Fs] = audioread('output_normalized.wav'); 

level = max(abs(y));

while true
    peak = input('Enter peak previous (up to 500): ');
    if peak >= 0 && peak <= 500
        break; 
    else
        disp('Error: peak  must be between 0 and 500.');
    end
end


y2 = (y *peak) /level;
audiowrite('output_normallized.wav', y2, Fs);
sound(y2, Fs);
subplot(211);plot(y);title('Normalize');
subplot(212);plot (y2);title('original');
