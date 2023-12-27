FROM node:21-alpine as builder

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

WORKDIR /app

COPY package.json .
COPY pnpm-lock.yaml .
RUN pnpm install

COPY . .

RUN pnpm run build

FROM nginx 
COPY --from=builder /app/dist /usr/share/nginx/html
