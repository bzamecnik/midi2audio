"""
Synthesizes an audio file from MIDI using some basic sound font.

It's a wrapper over fluidsynth which provides a bit easier interface.

Input: MIDI file
Output: audio file (WAV, FLAC, ...) - type determined from the extension

Usage in shell:

# use some default sound font
$ python fluidsynth.py input.mid output.flac
# use a custom sound font
$ python fluidsynth.py -s sound_font.sf2 input.mid output.flac

Usage in Python:

FluidSynth('sound_font.sf2').midi_to_audio('input.mid', 'output.wav')

If no sound font is specified explicitly the path of a default one is searched in the `~/.fluidsynth/default_sound_font` file.
"""

import argparse
from os.path import expanduser
import subprocess

__all__ = ['FluidSynth']

class FluidSynth():
    def __init__(self, sound_font=None, sample_rate=44100):
        self.sample_rate = sample_rate
        if sound_font is not None:
            self.sound_font = sound_font
        else:
            try:
                with(open(expanduser('~/.fluidsynth/default_sound_font'))) as f:
                    self.sound_font = f.readline().strip()
            except Exception as ex:
                raise RuntimeError('Default sound font is not defined, you have to specify it explicitly') from ex

    def midi_to_audio(self, midi_file, audio_file):
        subprocess.call(['fluidsynth', '-ni', self.sound_font, midi_file, '-F', audio_file, '-r', str(self.sample_rate)])

    def play_midi(self, midi_file):
        subprocess.call(['fluidsynth', '-i', self.sound_font, midi_file, '-r', str(self.sample_rate)])

def parse_args():
    parser = argparse.ArgumentParser(description='Convert MIDI to audio via FluidSynth')
    parser.add_argument('midi_file', metavar='MIDI', type=str)
    parser.add_argument('audio_file', metavar='AUDIO', type=str, nargs='?')
    parser.add_argument('-s', '--sound-font', type=str)
    parser.add_argument('-r', '--sample-rate', type=int, nargs='?', default=44100)
    return parser.parse_args()

def main():
    args = parse_args()
    fs = FluidSynth(args.sound_font, args.sample_rate)
    if args.audio_file:
        fs.midi_to_audio(args.midi_file, args.audio_file)
    else:
        fs.play_midi(args.midi_file)

if __name__ == '__main__':
    main()
