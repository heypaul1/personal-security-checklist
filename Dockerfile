FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl xz-utils libgtk-3-0 libdbus-glib-1-2 libxt6 libxrender1 libxcomposite1 libasound2 libpangocairo-1.0-0 libx11-xcb1 libx11-6

# Download and extract Tor Browser
RUN curl -L https://www.torproject.org/dist/torbrowser/12.0.3/tor-browser-linux64-12.0.3_ALL.tar.xz -o tor.tar.xz && \
    tar -xJf tor.tar.xz && \
    mv tor-browser_en-US /opt/tor-browser && \
    rm tor.tar.xz

# Create desktop entry
RUN echo -e "[Desktop Entry]\n\
Name=Tor Browser\n\
Comment=Protect your privacy and access blocked websites with Tor Browser\n\
Exec=/opt/tor-browser/start-tor-browser.desktop\n\
Terminal=false\n\
Type=Application\n\
Icon=/opt/tor-browser/Browser/browser/chrome/icons/default/default128.png\n\
Categories=Network;WebBrowser;\n" > /usr/share/applications/tor-browser.desktop

CMD ["/opt/tor-browser/Browser/start-tor-browser"]
