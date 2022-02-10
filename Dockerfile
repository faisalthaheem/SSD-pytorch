FROM nvcr.io/nvidia/pytorch:20.12-py3

RUN DEBIAN_FRONTEND=NONINTERACTIVE && \
apt-get update && \
apt-get install -y libgl1-mesa-glx htop mc nload

RUN pip install Cython==0.28.4 \
scikit-image==0.15.0 \
tqdm==4.56.0 \
pycocotools==2.0.0

WORKDIR /packages
RUN git clone https://github.com/NVIDIA/apex && \
cd apex && \
MAX_JOBS=16 pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./


COPY . .
