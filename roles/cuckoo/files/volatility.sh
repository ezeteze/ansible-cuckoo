curl -L https://github.com/volatilityfoundation/volatility/archive/2.4.1.tar.gz > /tmp/2.4.1.tar.gz
cd /tmp
tar -zxvf 2.4.1.tar.gz
cd volatility-2.4.1
python setup.py install
