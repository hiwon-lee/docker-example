# base image를 가지고 간다. 미리 만들어 두어져 있는 것을 사용한다.
FROM node:16-alpine  

# 어떤 경로에서 실행할 것인지에 대해 명시해줘야 한다.
WORKDIR /app

# layer를 고려해줘야하기 때문에 많이 변경되는것을 아래쪽에 배치한다.
COPY package.json package-lock.json ./

# npm install보다 ci가 낫다. 개발할 때썻던 버전에 명확하게 셋팅해주기 때문에
RUN npm ci

# 소스파일을 카피
COPY index.js .

# 노드를 통해 인덱스파일을 설치해
ENTRYPOINT [ "node", "index.js" ]
