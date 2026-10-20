from setuptools import setup, find_packages

setup(
    name='apiverve_passwordgenerator',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Password Generator creates random passwords, pronounceable strings, and multi-word passphrases configured by length, complexity, and character sets. It outputs generated strings with character counts and configuration metadata.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/passwordgenerator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
