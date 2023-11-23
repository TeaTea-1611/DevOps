FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN mkdir -p ./prisma

COPY prisma/schema.prisma ./prisma/

RUN npx prisma generate

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
