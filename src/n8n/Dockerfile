# Use the original n8n image as the basis
FROM n8nio/n8n:1.100.0

RUN N8N_CONFIG_FILES=/n8n-config.json
# Install additional packages as needed

USER root
#
RUN mkdir -p /home/node/.n8n/nodes
WORKDIR /home/node/.n8n/nodes
#
RUN npm i iconv-lite

ENV N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true
RUN npm i n8n-nodes-appflowy 

WORKDIR /home/node

ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache python3 curl ffmpeg
RUN apk add --update --no-cache py3-pip

RUN pip3 install --no-cache --upgrade --break-system-packages pip 

RUN pip3 install --root-user-action=ignore --break-system-packages SpeechRecognition pydub

# RUN apk add --update --no-cache pandas numpy
RUN pip3 install --no-cache --upgrade --break-system-packages pandas numpy 

RUN mkdir voice
RUN chmod 777 voice

COPY ./entrypoint.sh .
RUN chmod a+x ./entrypoint.sh

RUN apk add --update --no-cache kicad

USER node

ENTRYPOINT [ "sh", "-xc", "./entrypoint.sh" ]
