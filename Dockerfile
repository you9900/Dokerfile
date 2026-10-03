FROM node:20-bullseye-slim

# Fix pour l'erreur exit code 100
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    git \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone ton bot
RUN git clone https://github.com/Ainz-devs/OVL-MD-V2.git /ovl_bot

WORKDIR /ovl_bot

RUN npm install

EXPOSE 8000

CMD ["npm", "run", "Ovl"]
