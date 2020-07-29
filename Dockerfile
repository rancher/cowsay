FROM alpine as build
RUN apk add -U perl git
RUN git clone https://github.com/tnalpgge/rank-amateur-cowsay.git
RUN cd rank-amateur-cowsay && \
    ./install.sh /usr/local

FROM alpine
RUN apk add -U --no-cache perl
COPY --from=build /usr/local/bin/cowsay /usr/local/bin/
COPY --from=build /usr/local/share/cows /usr/local/share/cows
ENTRYPOINT ["cowsay"]
