FROM jellyfin/jellyfin:10.8.13

COPY ffmpeg.wrap ffmpeg.wrap.conf transcode.cleanup.sh buffmon.sh /jellyfin/cleanup-scripts/

RUN ln -sf /jellyfin/cleanup-scripts/ffmpeg.wrap /usr/lib/jellyfin-ffmpeg/ffmpeg.wrap \
  && ln -sf /usr/lib/jellyfin-ffmpeg/ffprobe /usr/lib/jellyfin-ffmpeg/ffprobe.wrap \
  && apt update \
  && jellyfin apt -y install procps

ENTRYPOINT [ "./jellyfin/jellyfin", \
             "--ffmpeg", "/usr/lib/jellyfin-ffmpeg/ffmpeg.wrap" ]