from setuptools import setup, find_packages

setup(
    name='apiverve_passwordgenerator',
    version='1.2.6',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Password Generator is a password generator API that creates random passwords, pronounceable passwords and multi-word passphrases from length, complexity and character-set rules, up to 100 per call. Each comes back with its length and the settings used to build it.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/passwordgenerator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
