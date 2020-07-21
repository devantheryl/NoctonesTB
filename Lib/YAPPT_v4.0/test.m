wavFile = 'AudioTest\DJ_TAYE_midi_DJ_TAYE_midi_crown_chakra_120_F#m.wav'
tic
[data1, fs1] = audioread(wavFile);
[ps, nf1] = yaapt(data1, fs1, 0, [], 1, 1);
wavre