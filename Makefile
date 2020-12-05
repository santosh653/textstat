.PHONY: dist

install:
	python3 -m pip install .

check: test style spelling

test:
	poetry run pytest test.py

style:
	poetry run flake8 textstat/
	poetry run pycodestyle test.py

spelling:
	poetry run codespell -L paket --skip=./**/easy_words.txt

clean:
	rm -rf build/ dist/ textstat.egg-info/ __pycache__/ */__pycache__/
	rm -f *.pyc */*.pyc

dist:
	python3 setup.py sdist bdist_wheel

upload:
	twine upload dist/*

