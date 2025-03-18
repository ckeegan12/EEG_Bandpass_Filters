# IIR Filter Design And Reasoning
The filter being used on the EEG signal is a fourth-order infinite impulse response (IIR) filter that utilizes a Butterworth filter.
I decided to use a IIR Buterworth filter over a traditional finite impulse response filter to reduce latency in the response.
The Goal of the filter is to obtained filtered signal of action potential present in the data. 

<p align="center"> Filter Equation:   </p>
<p align="center"><img width="185" alt="image" src="https://github.com/user-attachments/assets/d033b1d8-ea7f-4a2d-a3fa-b9c6066f85cc" /> </p>  

I use the bandpass filter to obtain the action potentials present in the signal between the freqency range of **300Hz** and **8000Hz**.
The samplying frequency used in the filtering is **20kHz** to avoid aliasing when using the Nyquist samplying frequency. 
I also use the fourier transform of the filtered signal and unfiltered signal to make sure the filter is working properly. 
<p align="center">
<img width="299" alt="image" src="https://github.com/user-attachments/assets/a0a681d3-d3f1-4a06-b650-2ee3b8b366d1" />
<img width="296" alt="image" src="https://github.com/user-attachments/assets/99c90e35-1aef-446c-aec6-443b5f026771" />
</p>

# FIR Filter Design And Reasoning
I created a 150-order finite impulse response (FIR) bandpass filter using a Chebyshev window. I also made this to go along with the traditional
approach to filtering EEG signals. I ended up only using the IIR filter in later spike sorting. It has the same parameters as the IIR filter (Samplying frequency, cutoff frequency, ect)
<p align="center">Chebyshev window:</p> <p align="center">  </p>
<p align="center">  <img width="258" alt="image" src="https://github.com/user-attachments/assets/397c2b1b-6c2a-41e3-952f-c5ed931edfcd" /></p>
