# Usa una imagen base de Node.js adecuada para tu proyecto Strapi
FROM node:14-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia los archivos del proyecto Strapi a la imagen del contenedor
COPY . .

# Instala las dependencias de Strapi
RUN npm install

# Expone el puerto 1337 utilizado por Strapi
EXPOSE 1337

# Define el comando para ejecutar Strapi cuando el contenedor se inicie
CMD ["npm", "start"]
