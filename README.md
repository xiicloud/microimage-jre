![jre](https://csphere.cn/assets/e8e58fe7-1b3a-45df-8cb2-0387250938ff)

## 启动一个Java实例

使用JDK镜像最直接的方法是将其看作Java容器的build和运行时环境。你可以像下面这样编写一个Dockerfile:

```dockerfile
FROM index.csphere.cn/microimages/jdk:7
COPY . /app
WORKDIR /app
RUN javac Main.java
CMD ["java", "Main"]
```

然后可以构建并运行:

```console
$ docker build -t my-java-app .
$ docker run -it --rm --name my-running-app my-java-app
```

## 在容器里编译应用

有时你的应用也许不适合运行在容器里，但是却适合在容器里编译:

```console
$ docker run --rm -v "$PWD":/app -w /app java:7 javac Main.java
```

这将会把你的当前目录 `PWD` 当作一个volume卷挂载到容器里，设置workdir到volume卷，并运行 `javac Main.java` 来编译生成 `Main.class` 。

## 授权和法律

该镜像由希云制造，未经允许，任何第三方企业和个人，不得重新分发。违者必究。

## 支持和反馈

该镜像由希云为企业客户提供技术支持和保障，任何问题都可以直接反馈到: `docker@csphere.cn`

