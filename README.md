# midi2audio

[![PyPI version](https://img.shields.io/pypi/v/midi2audio.svg)](https://pypi.python.org/pypi/midi2audio)
![Supported Python versions](https://img.shields.io/pypi/pyversions/midi2audio.svg)
![License](https://img.shields.io/pypi/l/midi2audio.svg)

Easily synthesize MIDI to audio or just play it.

It provides a Python and command-line interface to the [FluidSynth](http://www.fluidsynth.org/) synthesizer to make it easy to use and suitable for scripting and batch processing. In contrast, most MIDI processing software is GUI-based.

## Why?

First, FluidSynth has a CLI which is not so straightforward to use. The goal was to make it easy to use as possible by making some parameters implicit.

```
fluidsynth -ni sound_font.sf2 input.mid -F output.wav -r 44100
```

vs.

```
midiplay input.mid
midi2audio input.mid output.wav
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
- some [sound font(s)](https://sourceforge.net/p/fluidsynth/wiki/SoundFont/)

You need at least one sound font. Normally you'd install them manually or via a package manager. `midi2audio` looks for its default sound font in `~/.fluidsynth/default_sound_font.sf2`. It can be a symlink or an actual file.

## Installation

### pip

You can install this package via pip.

```
pip install midi2audio
```

Or for development (changes in code take effect without reinstalling):

```
git clone https://github.com/bzamecnik/midi2audio
pip install -e midi2audio
```

### OS X

I'd recommend adding the non-default libsndfile which supports output to FLAC and wide variety of audio formats. Otherwise only WAV, raw and a few other will be supported.

For Mac OS X we provide a script [install_fluidsynth_with_soundfonts_osx.sh](https://github.com/bzamecnik/midi2audio/blob/master/install_fluidsynth_with_soundfonts_osx.sh) to automatically install FluidSynth with libsndfile and a basic sound font ([Fluid R3 GM](http://www.musescore.org/download/fluid-soundfont.tar.gz)) and symlink it so that it's recognized as a default sound font for this module. Note it it install installed via pip as another entry point.

```
install_fluidsynth_with_soundfonts_osx.sh
```

Or install it manually:

```
brew install fluidsynth --with-libsndfile
mkdir -p ~/.fluidsynth
ln -s /path/to/my/sound_font.sf2 ~/.fluidsynth/default_sound_font.sf2
```

Check the script how to install a few additional (nice but bigger) sound fonts which are not installed by default.

## Other OSs

Check you package manager and link your default sound font as descibed above.

## Usage

Basically you can either play a MIDI file or synthesize it to audio. FluidSynth allows non-realtime synthesis which is faster than the playback.

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

A shell sugars `midi2audio` and `midiplay` are provided instead of more verbose `python -m midi2audio`.

```
# play MIDI
$ midiplay input.mid

# synthesize MIDI to audio
$ midi2audio input.mid output.wav

# also to FLAC
$ midi2audio input.mid output.flac

# custom sound font
$ midi2audio -s sound_font.sf2 input.mid output.flac

# custom sample rate
$ midi2audio -r 22050 input.mid output.flac
```

## About

- Author: Bohumír Zámečník ([@bzamecnik](http://twitter.com/bzamecnik))
- License: MIT, see the [LICENSE](LICENSE) file

### Shoulders of giants

Thanks to the authors of FluidSynth for a nice command-line MIDI synthesizer!

### Support the project

Need some consulting or coding work regarding audio processing, machine learning or big data? Drop me a message via [email](mailto:bohumir.zamecnik@gmail.com?subject=Work+inquiry+-+based+on+midi2audio) or [LinkedIn](https://www.linkedin.com/in/bohumirzamecnik). Or just say hello :).
