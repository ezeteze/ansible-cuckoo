curl -L https://github.com/plusvic/yara/archive/v3.3.0.tar.gz > /tmp/v3.3.0.tar.gz
cd /tmp
tar -zxvf v3.3.0.tar.gz
cd yara-3.3.0
./bootstrap.sh
./configure --enable-magic
make install
cd yara-python && python setup.py build install && ldconfig
