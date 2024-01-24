FROM jellyfin/jellyfin:10.8.13

COPY ffmpeg.wrap ffmpeg.wrap.conf transcode.cleanup.sh bufmon.sh /jellyfin/cleanup-scripts/

RUN apt update \
  && apt -y install procps \
  && chmod +x /jellyfin/cleanup-scripts/ffmpeg.wrap \ 
  && chmod +x /jellyfin/cleanup-scripts/transcode.cleanup.sh \ 
  && chmod +x /jellyfin/cleanup-scripts/bufmon.sh \
  && ln -sf /jellyfin/cleanup-scripts/ffmpeg.wrap /usr/lib/jellyfin-ffmpeg/ffmpeg.wrap \
  && ln -sf /usr/lib/jellyfin-ffmpeg/ffprobe /usr/lib/jellyfin-ffmpeg/ffprobe.wrap 

WORKDIR /repo

ENTRYPOINT [ "./jellyfin/jellyfin", \
             "--ffmpeg", "/usr/lib/jellyfin-ffmpeg/ffmpeg.wrap" ]
