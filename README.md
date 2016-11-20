# midi2audio-fluidsynth-py

Synthesize MIDI to audio or play it via FluidSynth - scripted in Python.

## Why?

First, fluidsynth has a CLI which is not so straightforward to use. The goal was to make it easy to use as possible by making some parameters implicit.

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

## Requirements

- Python 3
- FluidSynth
- some sound fonts

## Installation

### OS X

```
brew install fluidsynth
```

You need at least one sound font. Normally you'd install them manually or via a package manager. There's a script that automatically installs one basic sound font and stores its path so that it's recognized as a default sound font for this module.

```
# install some basic soundfont
./install_fluidsynth_with_soundfonts_osx.sh
```

Note this modules stores the path to the default sound font in the `~/.fluidsynth/default_sound_font` file.

## Usage

### Python

```
from fluidsynth import FluidSynth
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
