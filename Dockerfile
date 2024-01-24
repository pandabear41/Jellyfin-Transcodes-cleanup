FROM jellyfin/jellyfin:10.8.13

COPY ffmpeg.wrap ffmpeg.wrap.conf transcode.cleanup.sh buffmon.sh /jellyfin/cleanup-scripts/

RUN apt update \
  && jellyfin apt -y install procps \
  && chmod +x /jellyfin/cleanup-scripts/ffmpeg.wrap \ 
  && chmod +x /jellyfin/cleanup-scripts/transcode.cleanup.sh \ 
  && chmod +x /jellyfin/cleanup-scripts/buffmon.sh \
  && ln -sf /jellyfin/cleanup-scripts/ffmpeg.wrap /usr/lib/jellyfin-ffmpeg/ffmpeg.wrap \
  && ln -sf /usr/lib/jellyfin-ffmpeg/ffprobe /usr/lib/jellyfin-ffmpeg/ffprobe.wrap 

ENTRYPOINT [ "./jellyfin/jellyfin", \
             "--ffmpeg", "/usr/lib/jellyfin-ffmpeg/ffmpeg.wrap" ]