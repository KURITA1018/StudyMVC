FROM node
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN git clone https://github.com/c9/core.git /cloud9
WORKDIR /cloud9
RUN ./scripts/install-sdk.sh
WORKDIR /workspace