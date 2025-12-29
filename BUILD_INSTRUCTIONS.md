# build instructions

```txt
git clone https://github.com/cboxdoerfer/fsearch.git
cd fsearch

sudo apt install git build-essential meson itstool libtool pkg-config intltool libicu-dev libpcre2-dev libglib2.0-dev libgtk-3-dev libxml2-utils

meson builddir
ninja -C builddir install
```
