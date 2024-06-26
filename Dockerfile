# pythonの3.8.0をベースにする
FROM python:3.8.0

RUN apt-get update \
    && apt-get upgrade -y \
    # imageのサイズを小さくするためにキャッシュ削除
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # pipのアップデート
    && pip install --upgrade pip

# 作業するディレクトリを変更
WORKDIR /home/DeepLearning

COPY requirements.txt ${PWD}

# pythonのパッケージをインストール
RUN pip install -r requirements.txt

# 作業するディレクトリを変更
# コンテナの内部には入った際のディレクトリの位置を変更している
WORKDIR /home/DeepLearning/src
