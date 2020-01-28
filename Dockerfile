FROM r-base:3.6.2

COPY ./entrypoint.sh /

COPY ./init.R /

RUN apt update && \
    apt install -y python3-pip libcurl4-openssl-dev  libxml2-dev libssl-dev nodejs npm && \
    pip3 install jupyterlab && \
    pip3 install --pre jupyter-lsp && \
    Rscript /init.R && \
    jupyter labextension install @krassowski/jupyterlab-lsp && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
