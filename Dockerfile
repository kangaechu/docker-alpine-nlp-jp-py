FROM alpine:latest AS build-env
LABEL maintainer="kangae2@gmail.com"

ENV PYKNP_PKG='pyknp-0.3'
WORKDIR /nlp

ADD http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://lotus.kuee.kyoto-u.ac.jp/nl-resource/pyknp/${PYKNP_PKG}.tar.gz&name=${PYKNP_PKG}.tar.gz ${PYKNP_PKG}.tar.gz
ADD https://storage.googleapis.com/alpine-nlp-jp/kangae2%40gmail.com-5b1c9331.rsa.pub /etc/apk/keys/ 
RUN echo "https://storage.googleapis.com/alpine-nlp-jp" >> /etc/apk/repositories && \
  apk add --update --no-cache mecab mecab-dev gcc g++ python3 python3-dev git && \
  git clone https://github.com/SamuraiT/mecab-python3 && \
  cd mecab-python3 && \
  python3 setup.py build && \
  cd .. && \
  tar xzf ${PYKNP_PKG}.tar.gz && \
  cd ${PYKNP_PKG} && \
  python3 setup.py build

FROM kangaechu/nlp-jp:latest

ENV PYKNP_PKG='pyknp-0.3'
WORKDIR /nlp

COPY --from=build-env /nlp /nlp
RUN apk add --update --no-cache python3 mecab-dev bash gcc && \
  cd mecab-python3 && \
  python3 setup.py install && \
  cd .. && \
  cd ${PYKNP_PKG} && \
  python3 setup.py install && \
  cd .. && \
  rm -rf mecab-python* pyknp-*

COPY requirements.txt /nlp
RUN apk add musl linux-headers gcc g++ make gfortran openblas-dev python3 python3-dev && \
  pip3 install --upgrade pip && \
  pip install six numpy scipy scikit-learn

CMD [ "/bin/sh" ]
