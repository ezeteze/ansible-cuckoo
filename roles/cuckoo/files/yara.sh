curl -L https://github.com/plusvic/yara/archive/v3.3.0.tar.gz > v3.3.0.tar.gz
tar -zxvf v3.3.0.tar.gz
cd yara-3.3.0
./bootstrap.sh
./configure --enable-magic
make install
cd yara-python && python setup.py build install && ldconfig