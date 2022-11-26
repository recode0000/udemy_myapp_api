#ベースイメージを指定する
# FROM ベースイメージ:tag
FROM ruby:2.7.2-alpine

# Dockerfile内で使用する変数を定義
#a 実際はappが入る
ARG WORKDIR
ARG RUNTIME_PACKAGES="nodejs tzdata postgresql-dev postgresql git"
ARG DEV_PACKAGES="build-base curl-dev"


# 環境変数を定義(Dockefile, コンテナ参照可)
ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

# ベースイメージに対してコマンドを実行する
WORKDIR ${HOME}

# ホスト側のファイルをコンテナにコピーする際に使う
# COPY コピー コピー先（コンテナ）
# コピーもと..Dockerfaileがあるディレクトリ以下を指定(api) ../NGになる
COPY Gemfile* ./

# apk..アルパインリナックスのコマンド
# apk update = パッケージの最新リストを取得する場合
# apk upgrade = インストールパッケージを最新のものにする
# --no-package パッケージをキャッシュしない(Dockerイメージを軽量化)
RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} gcompat && \
    # 名前（任意）= 仮想パッケージ
apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    # bundle install は gemのインストールコマンド
    # -j4(jobs=4) = Gem インストールの高速化
    bundle install -j4 && \
    # パッケージを削除する（Dockerイメージを軽量化する目的がある）
    apk del build-dependencies

COPY . ./

# コンテナ内で実行しないコマンドを定義する
# -b ... バインド。プロセスを指定したip{0.0.0.0}アドレスに紐付け（バインド）する
CMD ["rails", "server", "-b", "0.0.0.0"]

#ホスト（PC） | コンテナ
#ブラウザ（外部） | Rails