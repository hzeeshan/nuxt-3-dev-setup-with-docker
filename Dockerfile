FROM node:18-alpine3.17

# Create user and group
RUN addgroup hafiz && adduser -S -G hafiz hafiz

# Set working directory
WORKDIR /frontend

# Copy package files and the rest of the application
COPY package*.json ./
COPY . .

# Change ownership of /frontend and all its contents to hafiz user
RUN chown -R hafiz:hafiz /frontend

# Switch to non-root user
USER hafiz

# Install dependencies
RUN npm install && npm cache clean --force

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "npm", "run", "dev" ]
