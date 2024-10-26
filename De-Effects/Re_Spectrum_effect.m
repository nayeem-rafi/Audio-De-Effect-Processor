%% Reverse Chorus Effect
clc; clear all; close all;

[y, Fs] = audioread('output_chorus.wav'); 

numVoices = 7;


while true
    delayT = input('Enter delay time used(0 to 0.3): ');
    if delayT >= 0 && delayT <= 0.3
        break;
    else
        disp('Error: Delay time must be between 0 and 0.3.');
    end
end

while true
    feedbackgain = input('Enter feedback gain used(0 to 1): ');
    if feedbackgain >= 0 && feedbackgain <= 1
        break;
    else
        disp('Error: Feedback gain must be between 0 and 1.');
    end
end

depth = 0.005; 
rate = 0.5;
y_c = zeros(size(y));

t = (0:length(y)-1) / Fs; 
modulation = depth * sin(2 * pi * rate * t);

for i = 1:numVoices
    currentDelayTime = delayT + modulation; 
    currentDelaySamples = round(currentDelayTime * Fs); 

    delayedS = zeros(size(y)); 
    
    for n = 1:length(y)
        d = n - currentDelaySamples(n);
        if d > 0
            delayedS(n) = y(n) + feedbackgain * y(d);
        else
            delayedS(n) = y(n) ; 
        end
        y_c(n) = y(n) - delayedS(n); 
    end
end


y_c = y_c / max(abs(y_c));
audiowrite('output_choruus.wav', y_c, Fs);

sound(y_c, Fs);

figure;
subplot(2,1,1); plot(y); title('Chorus');
subplot(2,1,2); plot(y_c); title('Original');

%% Reverse Pitch Shift
clc; clear all; close all;
[y, Fs] = audioread('output_pitch_shifted.wav'); 

% Input loop for nSemitones
while true
    nSemitones = input('Enter the same nSemitones value used for shifting from -8 to 8: ');
    if nSemitones >= -8 && nSemitones <= 8
        break; 
    else
        disp('Error: Limit is -8 to +8. Please try again.');
    end
end


reverseShiftFactor = 2^((nSemitones)/12); 
y1 = resample(y, round(Fs * reverseShiftFactor), Fs);
audiowrite('output_reverse_pitch_shifted.wav', y1, Fs);
sound(y1, Fs);

subplot(2,1,1); plot(y); title('Pitch Shifted Audio (Original Input)');
subplot(2,1,2); plot(y1); title('Reversed Pitch Shifted Audio');
