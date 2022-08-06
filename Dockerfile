FROM python:3.9.2-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev mediainfo
RUN apt-get install neofetch wget -y -f
# Install other dependencies
RUN apt-get install libcrypt1 -y
# Install AOM
RUN apt-get install libaom-dev -y
RUN wget https://ffmpeg.org/releases/ffmpeg-4.2.1.tar.bz2  && \
tar -xf ffmpeg-4.2.1.tar.bz2  && \
rm ffmpeg-4.2.1.tar.bz2  && \
cd ffmpeg-4.2.1
COPY . .
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
