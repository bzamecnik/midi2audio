from setuptools import setup

setup(name='midi2audio',
      version='0.1.1',
      description='Easy to use MIDI to audio or playback via FluidSynth',
      url='https://github.com/bzamecnik/midi2audio',
      author='Bohumir Zamecnik',
      author_email='bohumir.zamecnik@gmail.com',
      license='MIT',
      zip_safe=False,
      py_modules=['midi2audio'],
      setup_requires=['setuptools-markdown'],
      long_description_markdown_filename='README.md',
      # See https://pypi.python.org/pypi?%3Aaction=list_classifiers
      classifiers=[
          # How mature is this project? Common values are
          #   3 - Alpha
          #   4 - Beta
          #   5 - Production/Stable
          'Development Status :: 3 - Alpha',

          'Intended Audience :: Developers',
          'Intended Audience :: Science/Research',
          'Topic :: Multimedia :: Sound/Audio :: Analysis',

          'License :: OSI Approved :: MIT License',

          'Programming Language :: Python :: 3',

          'Operating System :: POSIX :: Linux',
          'Operating System :: MacOS :: MacOS X',
      ],
      entry_points={
          'console_scripts': [
              'midi2audio = midi2audio:main',
              'midiplay = midi2audio:main_play'
          ]
      },
      scripts=[
        'install_fluidsynth_with_soundfonts_osx.sh'
      ])
