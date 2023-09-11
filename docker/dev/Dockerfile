FROM coqorg/coq:8.17

USER root

# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get -y install --no-install-recommends fish git \
  #
  # Clean up
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

USER coq

RUN opam install -y  coq-lsp

RUN echo $(opam --version)
RUN echo $(ocaml --version)
RUN echo $(coqc -v)
RUN echo $(coq-lsp --version)

COPY --chown=coq Cpdt /home/coq/Cpdt

ENV PATH="${PATH}:/home/coq/.opam/4.13.1+flambda/bin"

RUN cd /home/coq/Cpdt \
  && coq_makefile -f _CoqProject -o Makefile \
  && make \
  && make install

WORKDIR /workspace

CMD ["fish"]