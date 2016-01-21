from microimages/alpine

maintainer william <wlj@nicescale.com>

label service=jre

env LANG C.UTF-8
env JAVA_VERSION 7.79
env JAVA_APK_VERSION 7.79.2.5.6-r0

run apk add --update openjdk7-jre="$JAVA_APK_VERSION" && \
    keytool -import -trustcacerts \
    -keystore /usr/lib/jvm/default-jvm/jre/lib/security/cacerts \
    -storepass changeit -noprompt \
    -file /usr/share/ca-certificates/mozilla/DigiCert_Global_Root_CA.crt \
    -alias /usr/share/ca-certificates/mozilla/DigiCert_Global_Root_CA.crt

env JAVA_HOME /usr/lib/jvm/default-jvm

workdir /app
