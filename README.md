# Audio De-Effect Processor

By [Naimur Rahman](https://github.com/nayeem-rafi), [Md. Nayon Khan](https://github.com/nayon045), [Suvom Karmakar](https://github.com/suvom027).

## [Click for Open Source of Project Details & Video](https://drive.google.com/drive/folders/1DnzlJkw3hlO5iq0watlQuw7EBvpG2Dsl?usp=drive_link)


## Abstract
This project report documents the design and implementation of a De-Effects Processor using MATLAB, focusing on enhancing and restoring audio signals through advanced digital signal processing (DSP) techniques. The system is designed to effectively remove unwanted artifacts such as noise, echo, and distortion, significantly improving audio clarity and quality. This report covers the architecture, design methodology, user interface development, and performance evaluation of the processor, providing a comprehensive guide for anyone interested in understanding or replicating this project.

## Introduction
As digital audio technology continues to evolve, there is a growing demand for tools that not only enhance audio quality but also restore signals affected by unwanted artifacts. This project aims to design and implement a MATLAB-based De-Effects Processor, which focuses on cleaning and refining audio signals. The system provides a range of functionalities, including noise reduction, echo cancellation, and distortion removal, showcasing practical applications of DSP techniques. By leveraging the App Designer, users can intuitively interact with the processor, making it accessible for both novice and experienced users looking to improve their audio recordings.

## Description
 This project report details the design and implementation of a De-Effects Processor using MATLAB for real-time enhancement and restoration of audio signals through digital signal processing (DSP) techniques. The system focuses on removing unwanted effects such as noise, echo, and distortion, improving the clarity and quality of audio. It covers the architecture, design, user interface development, and performance evaluation of the processor.

## Components
• **Computer**:  
A personal computer for developing and running the processor.

• **MATLAB Software**:  
The main development environment used for implementing the effects and building the App Designer.

## User Interface
We developed a user-friendly Interface using MATLAB’s App Designer, enabling users to
interact with the processor without needing to understand the underlying code. This
Interface significantly improves the accessibility of our system, catering to both experienced users and novices in DSP.

### Buttons In Interface
• **Browse button for original file choose**  

• **Browse button for effected file choose**  

• **All available De-Effect buttons**  

• **Button to apply reverse effect**  

• **Play different audios**

• **Show original graph** 

• **Show Effected graph** 

• **Show recovered graph** 

• **Reset button**  

• **Save button**

### Features
• **User can choose any file by browsing**  

• **Can see original, effected and De-Effected graph**  

• **Can check if wanted to that reverse graph matched with original**  

• **Can save the audio**  

• **Can apply multiple De-effects over one audio**

<h1 align= "center">

**App Interface**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/a716c1f1-6d77-48b3-bb1e-7de1b571de99", width="720">
</p>

### Reverse Gain
The Gain effect changes the volume of the audio. Anyone can make it louder or
quieter by adjusting the gain. It works by multiplying the audio signal by a certain
factor—higher values make the sound louder, and value less than 1 make it quieter.

#### Implementation
The audio signal is multiplied by a user-specified gain factor to increase or decrease
volume.
#### Input and output Analysis
We gave a limit of 0 to 4 times for gain. Below one for lowering the sound and more
than one to boost the sound. We had keep the limit because more than 4 times gain
can cause distortion in audio. Below a sample of input and output is given where
first we gave input 2x boost. We find out our gaining effect is
perfectly working from amplitude analysis of the signal.

<h1 align= "center">

**Reverse Gain**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/cd678eb8-edc1-4b02-9b8d-dc595e66de70", width="620">
</p>

### Reverse Trimming
Reverse trimming isn’t possible due to loss of data or signal. Trimmed signal can’t be
reversed until the signal trimmed here want to undo , otherwise not possible.

### Reverse Fade-in
The Fade In effect gradually increases the volume of the audio upto the point user
wanted and finally reach the maximum level and stay in max. The effect doesn’t have any extra gaining. So it starts soft and then becomes louder. This is useful for making smooth transitions into a track.
Reverse fade-in also approximately possible and can’t back the exact original signal.
#### Implementation
Same as Fade in implementation, just here user give the percentage of faded in, approximately
or when the used fade in previously, then we just amplify that percent of
signal.
#### Input and output Analysis
Here user can choose how much percentage of the audio will be affected by fade-in
effect. For example, here we choose 70 percent of our audio would be faded in. Now reverse it by same 70% input.

<h1 align= "center">

**Reverse Fade In**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/695b9f51-95b1-4fcd-94c6-fa71c08157c9", width="620">
</p>

### Reverse Fade Out
The Fade Out effect does the opposite of fade-in. It gradually decreases the volume
at the end of the audio, so it fades into silence. This creates a smooth ending. Reverse fade-out also approximately possible and can’t back the exact original signal.
#### Implementation
A linear ramp is applied to the end of the audio signal, reducing the amplitude to zero. Here user give the percentage of faded out,
approximately or when the used fade out previously, then we just amplify that percent

#### Input and output Analysis
Here user can choose how much percentage of the audio will be affected by fade-out
effect. For example, here we choose 90 percent of our audio would be faded out. For reverse we again give 90% as fade out created by 90%.
<h1 align= "center">

**Reverse Fade Out**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/6dba78b5-5b49-4720-86f7-88f5d5a85c72", width="620">
</p>


### Reverse of Reversed Signal
The Reverse effect plays the audio backward, starting from the end and moving toward
the beginning.
#### Implementation
A matlab function ”flipud” used to flip the audio and play from the backward.
#### Input and output Analysis
Audio will be reversed, so we will find the original.

<h1 align= "center">

**Reverse of Reversed Signal**

</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/bc1753c2-c9ee-4bb9-974c-200f08aeb0ff", width="620">
</p>

</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/536dfb8a-0857-4b9a-ac2f-2f3d065bd8fe", width="620">
</p>



### Slows Down
The slows down(reverse speed) effect changes the playback speed of the audio. Slowing
down makes it play slower.
#### Implementation
Divide in frequency is applied to the audio to change its duration, slows it down without
altering pitch.
#### Input and output Analysis
User can chose how much slower they want the audio to be. They can choose between
1 to 4 times. From the graph we can’t analyse this effect. If signal plotted with time
it can be inspected.

<h1 align= "center">

**Slows Down**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/fb1c6a9f-71e6-45fb-ab38-ccffbf3aefc0", width="620">
</p>


## Reverse Dynamic Effect
### Reverse Compressor
The Compressor reduces the difference between the loud and soft parts of the audio.
If a sound gets too loud, the compressor lowers the volume to make it more balanced,
so the listener doesn’t have to adjust the volume constantly. The Reverse compressor is just opposite of compressor.
#### Implementation
Compression is applied based on a threshold, ratio, makeupgain, attacktime, releasetime
reducing the amplitude of loud sections. Threshold is limit, where if sound passes
threshold then it will be decrease according to the ratio, like if ration is 5 means after
passing threshold every 5dB will be converted to 1dB. Make up gain is additional
gain if user wanted to have gain then attacktime is how quickly the compressor reacts and starts reducing the volume (gain reduction) after the audio signal exceeds the
threshold and The release time refers to how quickly the compressor stops compressing
(returns the gain back to normal) once the signal falls below the threshold. By doing reverse code engineering we can find the original signal.
#### Input and output Analysis
Here, user have to give the inputs they used for compressing. Here, we take input as
previously compressed output signal.

<h1 align= "center">

**Reverse Compressor**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/781e200c-45b5-4944-8b23-629f24d1c95f", width="620">
</p>

### Reverse Normalize
The Normalize effect adjusts the overall volume so that the loudest part of the audio
reaches a target level. It ensures the audio isn’t too soft or too loud by scaling the
volume to a certain point. For reverse normalize just amplifying the signal is enough. User can use the gain effect.
#### Input and output Analysis
Taking Previous normalized output as an input. In that signal original peak was 0.75.
So, here input will be 0.75 peak. However, perfect recovery may not be possible.

<h1 align= "center">

**Reverse Normalize**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/38f15fa6-4770-4c9d-a2b6-504b09745475", width="620">
</p>

### Reverse Distortion
The Reverse Distortion effect alters the audio by making it sound smoother or softer,
typically by reducing the signal strength below its normal limits. This can give the
sound a muted or compressed quality.
#### Implementation
We built a hanning filter to remove distortion.
#### Input and output analysis
Users can choose a reduction factor to apply reverse distortion. In this sample, an
input attenuation factor of 1 is given. We will take previously distorted output as an
input signal. However, we can’t recover fully from noisy signal, we tried best to have
the best recovery but from graph we can see still noisy output.

<h1 align= "center">

**Reverse Distortion**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/522f7166-df94-4931-b2b2-60d9c5fb6a72", width="620">
</p>

</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/a96237f4-5e7e-41b7-9ea5-bd34255fdc8a", width="620">
</p>

## Reverse Spectrum Effect
### Reverse Chorus
The Chorus effect creates a richer, fuller sound by layering the original audio with
slightly delayed and pitch-shifted versions of itself. This makes it sound like multiple
people or instruments are playing the same part. Reverse chorus means removing the clone voices form signal.
#### Implementation
The chorus effect created by duplicating the original signal, applying small, varying
delays to each copy, and mixing them back with the original. This simulates the effect
of multiple voices or instruments playing the same note with slight timing variations. Same way of chorus implement just reverse this times.
#### Input and Output Analysis
Here, we take feedback gain and delay time used to make chorus, from user.For sample
, we used the previously chorused signal. However, there is error that we didn’t fully
succeed to remove chorus.

<h1 align= "center">

**Reverse Chorus**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/e698e70e-ab73-4ab5-9b69-34e181df667d", width="620">
</p>

### Reverse Equalizer
For reversing the equalizer just need to give gain opposite of previously given input,
in every band to retrieve the original signal. GO ANOTHER REPOSITORY Audio Effect/ Eqalizer.

### Reverse Pitch Effect
Reverse pitch shifting restores the pitch to its original value after it has been shifted.
This allows returning deep or shallow voices back to their natural pitch.
#### Implementation
We reverse pitch shifting by resampling the signal using the inverse of the original
shift factor. We use MATLAB’s built-in resample function to undo the pitch change.
#### Input and Output Analysis
User inputs the same semitone shift used originally (between -8 and 8) to reverse the
effect. For instance, using semitones of -5 will return the pitch to its original value, as
seen from the graphs when comparing x-axis shifts.

<h1 align= "center">

**Reverse Pitch Effect**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/a2c3a692-da18-4e6f-bd60-bcddd01a8850", width="620">
</p>

<p align="center">
<img src="https://github.com/user-attachments/assets/39f3e25e-39a0-4aa7-9d90-9d744ec3706a", width="620">
</p>


## Result Analysis
The De-Effects Processor successfully demonstrates its capability to enhance audio signals by removing unwanted artifacts such as noise, echo, and distortion (not properly). Throughout various tests, the processor has shown a significant improvement in audio clarity and quality. Each implemented effect has been evaluated based on its functionality, where the following results were observed:

1. **Noise Reduction**: Effective in attenuating background noise, leading to a cleaner output signal.
2. **Distortion Removal**: Restored audio to a smoother sound, with significant improvements noted.
3. **Dynamic Range Compression**: Balanced audio dynamics, resulting in a more uniform sound level.
4. **Pitch and Time Adjustments**: Successfully returned audio to original characteristics.

Overall, the De-Effects Processor has shown great promise in restoring audio signals to their intended quality, while also providing users with an intuitive interface for easy interaction.

## Applications
The De-Effects Processor has a wide range of applications in various fields, including:

1. **Music Production**: Enhancing recordings by removing unwanted noise and artifacts.
2. **Podcasting and Broadcasting**: Improving clarity of spoken audio.
3. **Film and Video Production**: Cleaning audio tracks for films and documentaries.
4. **Restoration of Old Recordings**: Bringing vintage audio recordings closer to original quality.
5. **Speech Analysis and Linguistics**: Analyzing spoken language with cleaned audio samples.

## Limitations
• Irreversibility of Time-Based Effects.
• Limited User Customization.

## How to Run
1. **Clone the Repository**: Clone the repository to your local machine.
2. **Install MATLAB**: Ensure you have MATLAB installed with the necessary toolboxes.
3. **Open the Project**: Launch MATLAB and navigate to the project folder.
4. **Run the App**: Open the main .mlapp file in MATLAB's App Designer and run the application.
5. **Load Audio Files**: Use the Browse buttons to load original and affected audio files.
6. **Apply De-Effects**: Select the desired de-effect options and click the corresponding buttons to apply.
7. **Save Processed Audio**: After processing, use the Save button to store the enhanced audio file.

## Conclusion
The Audio De-Effects Processor demonstrates a significant advancement in the realm of audio processing, providing a powerful tool for enhancing and restoring audio signals. Through the application of various digital signal processing techniques, users can effectively remove unwanted artifacts such as noise, echo, and distortion. The MATLAB-based interface offers an accessible solution for both novices and professionals, facilitating intuitive interaction with the system.

Future improvements could include the integration of machine learning algorithms to enhance the de-effect processes further, allowing for more automated and intelligent restoration techniques. Overall, this project serves as a robust foundation for further exploration and development in the field of audio processing, contributing to the ongoing evolution of digital sound manipulation tools.
