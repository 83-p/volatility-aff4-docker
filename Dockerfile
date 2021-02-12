FROM ubuntu:18.04

WORKDIR /work

RUN apt-get update && \
    apt-get install -y \
        git \
        libfuzzy-dev \
        python \
        python-crypto \
        python-distorm3 \
        python-intervaltree \
        python-openpyxl \
        python-pefile \
        python-pip \
        python-rdflib \
        python-yaml \
        python-yara \
        && \
    apt-get -y clean && \
    pip install PyBindGen && \
    pip install pyaff4==0.26.post6 && \
    pip install pyimpfuzzy && \
    pip install construct==2.5.3

RUN git clone https://github.com/volatilityfoundation/volatility && \
    git clone https://github.com/volatilityfoundation/community && \
    git clone https://github.com/JPCERTCC/impfuzzy && \
    cp /work/impfuzzy/impfuzzy_for_Volatility/impfuzzy.py /work/volatility/volatility/plugins/

ENV VOLATILITY_PLUGINS=/work/community/AFF4:/work/community/FrancescoPicasso

WORKDIR /work/volatility
