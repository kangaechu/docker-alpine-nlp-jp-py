docker-alpine-nlp-jp-py
====

Alpine Linuxの自然言語処理Python実行パッケージ Dockerfile

## Description

Dockerで日本語の自然言語処理関連ツールをPythonで実行するためのDockerfileです。

Docker HubからPullできます。
```
$ docker pull kangaechu/nlp-jp-py
```
https://hub.docker.com/r/kangaechu/nlp-jp-py/

### 対応しているパッケージ

- [MeCab (+ IPADIC)](http://taku910.github.io/mecab/)
- [Juman](http://nlp.ist.i.kyoto-u.ac.jp/EN/index.php?JUMAN)
- [KNP](http://nlp.ist.i.kyoto-u.ac.jp/?KNP)
- [Juman++](https://github.com/ku-nlp/jumanpp)

- scikit-learn
- numpy

## Requirement

Docker

## Usage

以下コマンドを実行します。
イメージが4GBくらいあるので時間がかかります。

```bash
$ docker run -it kangaechu/nlp-jp-py /bin/sh
```

## Licence

MIT

## Author

[kangaechu](https://github.com/kangaechu)
