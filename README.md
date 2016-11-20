# midi2audio-fluidsynth-py

Easily synthesize MIDI to audio or just play it.

It provides a Python and command-line interface to the [FluidSynth](http://www.fluidsynth.org/) synthesizer to make it easy to use and suitable for scripting and batch processing. In contrast, most MIDI processing software is GUI-based.

## Why?

First, FluidSynth has a CLI which is not so straightforward to use. The goal was to make it easy to use as possible by making some parameters implicit.

```
fluidsynth -ni sound_font.sf2 input.mid -F output.wav -r 44100
```

```
python fluidsynth.py input.mid output.wav
```

Second, we can have as easy interface scriptable in Python.

```
FluidSynth().midi_to_audio('input.mid', 'output.wav')
```

## What it is not?

Note that is it not a Python binding to all the FluidSynth commands. If needed check out these packages instead:

- [fluidsynth](https://pypi.python.org/pypi/fluidsynth)
- [pyFluidSynth](https://pypi.python.org/pypi/pyFluidSynth)

## Requirements

- Python 3
- FluidSynth
- some sound fonts

## Installation

### OS X

I'd recommend adding the non-default libsndfile which supports output to FLAC and wide variety of audio formats. Otherwise only WAV, raw and a few other will be supported.

```
brew install fluidsynth --with-libsndfile
```

You need at least one sound font. Normally you'd install them manually or via a package manager. There's a script that automatically installs one basic sound font and stores its path so that it's recognized as a default sound font for this module.

```
# install some basic soundfont
./install_fluidsynth_with_soundfonts_osx.sh
```

Note this modules stores the path to the default sound font in the `~/.fluidsynth/default_sound_font` file.

## Other OSs

Check you package manager and put the path of your default sound font to the file mentioned above.

## Usage

Note that the audio format is determined from the audio file extension. The [libsoundfile](http://www.mega-nerd.com/libsndfile/) supports a lot of formats.

### Python

```
from midi2audio import FluidSynth
```

Play MIDI:

```
FluidSynth().play_midi('input.mid')
```

Synthesize MIDI to audio:

```
# using the default sound font in 44100 Hz sample rate
fs = FluidSynth()
fs.midi_to_audio('input.mid', 'output.wav')

# FLAC, a lossless codec, is supported as well (and recommended to be used)
fs.midi_to_audio('input.mid', 'output.flac')
```

Change the defaults:

```
# use a custom sound font
FluidSynth('sound_font.sf2')

# use a custom sample rate
FluidSynth(sample_rate=22050)
```

### Command line interface

```
# play MIDI
$ python fluidsynth.py input.mid

# synthesize MIDI to audio
$ python fluidsynth.py input.mid output.wav

# also to FLAC
$ python fluidsynth.py input.mid output.flac

# custom sound font
$ python fluidsynth.py -s sound_font.sf2 input.mid output.flac

# custom sample rate
$ python fluidsynth.py -r 22050 input.mid output.flac
```
