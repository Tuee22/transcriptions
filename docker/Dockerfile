FROM jeandeaual/lilypond:latest

# Switch to root for package installation
USER root

# Install dependencies - try apt-get first (Debian/Ubuntu), fallback to apk (Alpine)
RUN if command -v apt-get >/dev/null 2>&1; then \
        apt-get update && apt-get install -y --no-install-recommends git fontconfig ca-certificates && \
        rm -rf /var/lib/apt/lists/*; \
    elif command -v apk >/dev/null 2>&1; then \
        apk add --no-cache git fontconfig ca-certificates; \
    fi

# Clone LilyJazz repository and install fonts/stylesheets
RUN git clone --depth 1 https://github.com/OpenLilyPondFonts/lilyjazz.git /tmp/lilyjazz && \
    # Install OTF fonts to system font directory
    mkdir -p /usr/share/fonts/opentype/lilyjazz && \
    cp /tmp/lilyjazz/otf/*.otf /usr/share/fonts/opentype/lilyjazz/ 2>/dev/null || true && \
    # Get LilyPond version and install to the correct path (/lilypond/share/...)
    LILYPOND_VERSION=$(lilypond --version 2>&1 | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1) && \
    echo "Installing LilyJazz for LilyPond version: $LILYPOND_VERSION" && \
    # Install fonts to LilyPond's font directory
    mkdir -p /lilypond/share/lilypond/${LILYPOND_VERSION}/fonts/otf && \
    cp /tmp/lilyjazz/otf/*.otf /lilypond/share/lilypond/${LILYPOND_VERSION}/fonts/otf/ && \
    # Install stylesheets to LilyPond's ly directory
    mkdir -p /lilypond/share/lilypond/${LILYPOND_VERSION}/ly && \
    cp /tmp/lilyjazz/stylesheet/*.ily /lilypond/share/lilypond/${LILYPOND_VERSION}/ly/ && \
    # List installed files for verification
    ls -la /lilypond/share/lilypond/${LILYPOND_VERSION}/ly/*.ily && \
    # Update font cache
    fc-cache -fv && \
    # Cleanup
    rm -rf /tmp/lilyjazz

# Set working directory
WORKDIR /work
