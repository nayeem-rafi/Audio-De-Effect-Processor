%% Gain_re
clc;clear all;close all;

[y Fs]= audioread('music.mp3');
while true
    inp = input('Enter amplifying factor (0 to 1 times): ');
    if inp >= 0 && inp <= 1
        break;
    else
        disp('Error: Amplifying factor must be between 0 and 1. Please try again.');
    end
end
gain_re = inp * y;
audiowrite('music.wav', gain_re, Fs);
sound(gain_re , Fs);
subplot(211);plot(y);title('original');
subplot(212);plot (gain_re);title('gain_ re');
%% Reverse_re
clc; clear all; close all;
outputFile = 'reverse.wav';

[y, Fs] = audioread( 'reverse.wav');

y_re = flipud(y);
audiowrite(outputFile, y_re, Fs);

sound(y_re, Fs);
subplot(211);plot(y);title('reversed');
subplot(212);plot (y_re);title('recovered');
%% Reverse Fade In 
[y, Fs] = audioread('music.wav');

nsamples = length(y);
while true
    x = input('Enter percentage of signal that is faded in (assumption) (0 to 100): ');
    if x >= 0 && x <= 100
        break; 
    else
        disp('Error: Percentage must be between 0 and 100. Please try again.');
    end
end
gradin = round(nsamples*(x/100));

fadeout = [linspace(0, 1, gradin), ones(1, nsamples - gradin)]';
if size(y, 2) > 1
    fadeout = [fadeout, fadeout];
end

z = 0.000001;
fadeout(fadeout == 0) = z;
y1 = y ./ fadeout;

sound(y1, Fs);
subplot(211); plot(y); title('Faded in Signal');
subplot(212); plot(y1); title('Recovered Signal');
audiowrite('recovered_signal.wav', y1, Fs);
%% Reverse Fade out
[y, Fs] = audioread('music.wav');

nsamples = length(y);
while true
    x = input('Enter percentage of signal you want to fade out (0 to 100): ');
    if x >= 0 && x <= 100
        break;
    else
        disp('Error: Percentage must be between 0 and 100. Please try again.');
    end
end

gradin = round(nsamples*(x/100));
T = nsamples / Fs;

fadeout = [linspace(1, 0,gradin), zeros(1, nsamples - gradin)]';

if size(y, 2) > 1
    fadeout = [fadeout, fadeout]; 
end
z = 0.000001;
fadeout(fadeout == 0) = z;
yFin = y ./ fadeout;
audiowrite('musitc.wav', yFin, Fs);

sound(yFin, Fs);
subplot(211);plot(y);title('Faded-out');
subplot(212);plot (yFin);title('Recovered');
%% Slowdown

[y, Fs] = audioread('Audio.wav'); 

while true
    inp = input('Enter how many times you need to slow down (1x to 4x): ');
    if inp >= 1 && inp <= 4
        break; 
    else
        disp('Error: Must be between 1x and 4x. Please try again.');
    end
end
nFs = Fs / inp; 
audiowrite('Audio1.wav', y, nFs);
sound(y, nFs);
