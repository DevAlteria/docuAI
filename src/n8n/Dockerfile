# Use the original n8n image as the basis
FROM n8nio/n8n:1.100.0

RUN N8N_CONFIG_FILES=/n8n-config.json
# Install additional packages as needed

USER root

RUN npm i -g iconv-lite

ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache python3 curl ffmpeg
RUN apk add --update --no-cache py3-pip


RUN pip3 install --no-cache --upgrade --break-system-packages pip 

RUN pip3 install --root-user-action=ignore --break-system-packages SpeechRecognition pydub

RUN mkdir voice
RUN chmod 777 voice

COPY ./entrypoint.sh .
RUN chmod a+x ./entrypoint.sh

USER node

ENTRYPOINT [ "sh", "-xc", "./entrypoint.sh" ]
