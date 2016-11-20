test:
	nosetests

install:
	pip install midi2audio

install_dev:
	pip install -e .

uninstall:
	pip uninstall midi2audio

clean:
	rm -r build/ dist/ midi2audio.egg-info/

# twine - a tool for uploading packages to PyPI
install_twine:
	pip install twine

build:
	python setup.py sdist
	python setup.py bdist_wheel --universal

# PyPI production
pypi_register:
	twine register dist/midi2audio-*.whl

publish:
	twine upload dist/*

# PyPI test
test_pypi_register:
	python setup.py register -r pypitest

test_publish:
	python setup.py sdist upload -r pypitest

test_install:
	pip install --verbose --index-url https://testpypi.python.org/pypi/ midi2audio
