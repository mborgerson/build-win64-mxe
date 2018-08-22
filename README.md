# build-win64-mxe

Experiment with building a libvips binary for 64-bit Windows with [MXE](https://github.com/mxe/mxe).

## libvips-web dependencies
| Dependency      | Version  | Used under the terms of         |
|-----------------|----------|---------------------------------|
| [cairo]         | 1.15.12  | Mozilla Public License 2.0      |
| [expat]         | 2.2.6    | MIT Licence                     |
| [fftw]          | 3.3.8    | GPLv2                           |
| [fontconfig]    | 2.13.0   | [fontconfig Licence] (BSD-like) |
| [freetype]      | 2.9.1    | [freetype Licence] (BSD-like)   |
| [fribidi]       | 0.19.7   | LGPLv3                          |
| [gdk-pixbuf]    | 2.36.12  | LGPLv3                          |
| [gettext]       | 0.19.8.1 | LGPLv3                          |
| [giflib]        | 5.1.4    | MIT Licence                     |
| [glib]          | 2.57.2   | LGPLv3                          |
| [harfbuzz]      | 1.8.8    | MIT Licence                     |
| [lcms]          | 2.9      | MIT Licence                     |
| [libcroco]      | 0.6.12   | LGPLv3                          |
| [libexif]       | 0.6.21   | LGPLv3                          |
| [libffi]        | 3.2.1    | MIT Licence                     |
| [libgsf]        | 1.14.44  | LGPLv3                          |
| [libiconv]      | 1.15     | LGPLv3                          |
| [libjpeg-turbo] | 2.0.0    | [zlib License, IJG License]     |
| [libpng]        | 1.6.35   | [libpng License]                |
| [librsvg]       | 2.43.4   | LGPLv3                          |
| [libtiff]       | 4.0.9    | [libtiff License] (BSD-like)    |
| [libvips]       | 8.6.5    | LGPLv3                          |
| [libwebp]       | 1.0.0    | New BSD License                 |
| [libxml2]       | 2.9.8    | MIT Licence                     |
| [pango]         | 1.42.2   | LGPLv3                          |
| [pixman]        | 0.33.6   | MIT Licence                     |
| [zlib]          | 1.2.11   | [zlib Licence]                  |

[cairo]: https://cairographics.org/
[expat]: https://github.com/libexpat/libexpat
[fftw]: https://github.com/FFTW/fftw3
[fontconfig]: https://www.fontconfig.org/
[fontconfig Licence]: https://cgit.freedesktop.org/fontconfig/tree/COPYING
[freetype]: https://www.freetype.org/
[freetype Licence]: http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs/FTL.TXT
[fribidi]: https://github.com/fribidi/fribidi
[gdk-pixbuf]: https://github.com/GNOME/gdk-pixbuf
[gettext]: https://www.gnu.org/software/gettext/
[giflib]: https://sourceforge.net/projects/giflib/
[glib]: https://github.com/GNOME/glib
[harfbuzz]: https://github.com/harfbuzz/harfbuzz
[lcms]: https://github.com/mm2/Little-CMS
[libcroco]: https://github.com/GNOME/libcroco
[libexif]: https://github.com/libexif/libexif
[libffi]: https://sourceware.org/libffi/
[libgsf]: https://github.com/GNOME/libgsf
[libiconv]: https://www.gnu.org/software/libiconv/
[libjpeg-turbo]: https://github.com/libjpeg-turbo/libjpeg-turbo
[zlib License, IJG License]: https://github.com/libjpeg-turbo/libjpeg-turbo/blob/master/LICENSE.md
[libpng]: https://github.com/glennrp/libpng
[libpng License]: http://www.libpng.org/pub/png/src/libpng-LICENSE.txt
[librsvg]: https://github.com/GNOME/librsvg
[libtiff]: http://www.simplesystems.org/libtiff/
[libtiff License]: http://www.simplesystems.org/libtiff/misc.html
[libvips]: https://github.com/jcupitt/libvips
[libwebp]: https://github.com/webmproject/libwebp
[libxml2]: https://github.com/GNOME/libxml2
[pango]: https://www.pango.org/
[pixman]: http://www.pixman.org/
[zlib]: https://zlib.net/
[zlib Licence]: https://github.com/madler/zlib/blob/master/zlib.h

## libvips-all dependencies
Same as libvips-web + these extra dependencies:

| Dependency      | Version   | Used under the terms of          |
|-----------------|-----------|----------------------------------|
| [cfitsio]       | 3.450     | BSD-like                         |
| [hdf5]          | 1.8.12    | BSD-like                         |
| [imagemagick]   | 6.9.10-10 | [ImageMagick License] (GPL-like) |
| [matio]         | 1.5.12    | BSD 2-Clause                     |
| [nifticlib]     | 2.0.0     | Public domain                    |
| [openexr]       | 2.3.0     | BSD 3-Clause                     |
| [openjpeg]      | 2.3.0     | BSD 2-Clause                     |
| [openslide]     | 3.4.1     | LGPLv3                           |
| [poppler]       | 0.68.0    | GPLv2                            |
| [sqlite]        | 3.24.0    | Public domain                    |

[cfitsio]: https://heasarc.gsfc.nasa.gov/fitsio/
[hdf5]: https://www.hdfgroup.org/solutions/hdf5/
[imagemagick]: https://github.com/ImageMagick/ImageMagick6
[ImageMagick License]: https://www.imagemagick.org/script/license.php
[matio]: https://github.com/tbeu/matio
[nifticlib]: https://nifti.nimh.nih.gov/
[openexr]: https://github.com/openexr/openexr
[openjpeg]: http://www.openjpeg.org/
[openslide]: https://github.com/openslide/openslide
[poppler]: https://poppler.freedesktop.org/
[sqlite]: https://www.sqlite.org/

## Dependencies overview
Generated by the [open-source modern Dependency Walker](https://github.com/lucasg/Dependencies).

<details>
 <summary>libvips-web</summary>

```
libvips-42.dll
└───libcairo-2.dll
│   └───libgcc_s_seh-1.dll
│   └───libfontconfig-1.dll
│   │   └───libgcc_s_seh-1.dll
│   │   └───libexpat-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libfreetype-6.dll
│   │   └───libharfbuzz-0.dll  
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libpixman-1-0.dll
│   │   └───libgcc_s_seh-1.dll
│   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libz1.dll
└───libexif-12.dll
│   └───libintl-8.dll
│       └───libiconv-2.dll
└───libexpat-1.dll
└───libfftw3-3.dll
└───libgif-7.dll
└───libglib-2.0-0.dll
│   └───libintl-8.dll
│       └───libiconv-2.dll
└───libgmodule-2.0-0.dll
│   └───libglib-2.0-0.dll
│       └───libintl-8.dll
└───libgobject-2.0-0.dll
│   └───libglib-2.0-0.dll
│   │   └───libintl-8.dll
│   └───libffi-6.dll
└───libgsf-1-114.dll
│   └───libgio-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgmodule-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   │   └───libz1.dll
│   └───libglib-2.0-0.dll
│   │   └───libintl-8.dll
│   └───libgobject-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libffi-6.dll
│   └───libintl-8.dll
│   │   └───libiconv-2.dll
│   └───libxml2-2.dll
│   │   └───libz1.dll
│   │   └───libiconv-2.dll
│   └───libz1.dll
└───libintl-8.dll
│   └───libiconv-2.dll
└───libjpeg-62.dll
└───liblcms2-2.dll
└───libpango-1.0-0.dll
│   └───libfribidi-0.dll
│   │   └───libglib-2.0-0.dll
│   └───libglib-2.0-0.dll
│   │   └───libintl-8.dll
│   └───libgobject-2.0-0.dll
│       └───libglib-2.0-0.dll
│       └───libffi-6.dll
└───libpangoft2-1.0-0.dll
│   └───libpango-1.0-0.dll
│   │   └───libfribidi-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   └───libfontconfig-1.dll
│   │   └───libgcc_s_seh-1.dll
│   │   └───libexpat-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libfreetype-6.dll
│   │   └───libharfbuzz-0.dll  
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libglib-2.0-0.dll
│   │   └───libintl-8.dll
│   └───libgobject-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libffi-6.dll
│   └───libharfbuzz-0.dll 
│       └───libgcc_s_seh-1.dll
│       └───libfreetype-6.dll
│       └───libglib-2.0-0.dll
└───libpng16-16.dll
│   └───libz1.dll
└───librsvg-2-2.dll
│   └───libcairo-2.dll
│   │   └───libgcc_s_seh-1.dll
│   │   └───libfontconfig-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libpixman-1-0.dll
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libcroco-0.6-3.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libxml2-2.dll
│   └───libfontconfig-1.dll
│   │   └───libgcc_s_seh-1.dll
│   │   └───libexpat-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libgdk_pixbuf-2.0-0.dll
│   │   └───libgio-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   │   └───libintl-8.dll
│   │   └───libjpeg-62.dll
│   │   └───libpng16-16.dll
│   │   └───libtiff-5.dll
│   └───libgio-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgmodule-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   │   └───libz1.dll
│   └───libglib-2.0-0.dll
│   │   └───libintl-8.dll
│   └───libgobject-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libffi-6.dll
│   └───libpango-1.0-0.dll
│   │   └───libfribidi-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   └───libpangocairo-1.0-0.dll
│   │   └───libpango-1.0-0.dll
│   │   └───libpangoft2-1.0-0.dll
│   │   └───libpangowin32-1.0-0.dll
│   │   └───libcairo-2.dll
│   │   └───libfontconfig-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   └───libpangoft2-1.0-0.dll
│   │   └───libpango-1.0-0.dll
│   │   └───libfontconfig-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   │   └───libharfbuzz-0.dll 
│   └───libxml2-2.dll
│       └───libz1.dll
│       └───libiconv-2.dll
└───libtiff-5.dll
│   └───libz1.dll
│   └───libjpeg-62.dll
└───libwebp-7.dll
└───libwebpmux-3.dll
│   └───libwebp-7.dll
└───libz1.dll
```
</details>

<details>
 <summary>libvips-all</summary>
Same as libvips-web + these extra dependencies:

```
libvips-42.dll
└───libIlmImf-2_3.dll
│   └───libgcc_s_seh-1.dll
│   └───libstdc++-6.dll
│   └───libz1.dll
└───libMagickCore-6.Q16-6.dll
│   └───libcairo-2.dll
│   │   └───libgcc_s_seh-1.dll
│   │   └───libfontconfig-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libpixman-1-0.dll
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libfftw3-3.dll
│   └───libfontconfig-1.dll
│   │   └───libgcc_s_seh-1.dll
│   │   └───libexpat-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libgobject-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libffi-6.dll
│   └───libjpeg-62.dll
│   └───liblcms2-2.dll
│   └───libopenjp2.dll
│   └───libpango-1.0-0.dll
│   │   └───libfribidi-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   └───libpangocairo-1.0-0.dll
│   │   └───libpango-1.0-0.dll
│   │   └───libpangoft2-1.0-0.dll
│   │   └───libpangowin32-1.0-0.dll
│   │   └───libcairo-2.dll
│   │   └───libfontconfig-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   └───libpng16-16.dll
│   └───libtiff-5.dll
│   │   └───libz1.dll
│   │   └───libjpeg-62.dll
│   └───libwebp-7.dll
│   └───libwebpmux-3.dll
│   │   └───libwebp-7.dll
│   └───libxml2-2.dll
│   │   └───libz1.dll
│   │   └───libiconv-2.dll
│   └───libz1.dll
└───libcfitsio.dll
└───libmatio-4.dll
│   └───libz1.dll
│   └───libhdf5-8.dll
│       └───libz1.dll
└───libniftiio.dll
│   └───libznz.dll
│       └───libz1.dll
└───libopenslide-0.dll
│   └───libcairo-2.dll
│   │   └───libgcc_s_seh-1.dll
│   │   └───libfontconfig-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libpixman-1-0.dll
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libgdk_pixbuf-2.0-0.dll
│   │   └───libgio-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   │   └───libintl-8.dll
│   │   └───libjpeg-62.dll
│   │   └───libpng16-16.dll
│   │   └───libtiff-5.dll
│   └───libgio-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgmodule-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   │   └───libz1.dll
│   └───libglib-2.0-0.dll
│   │   └───libintl-8.dll
│   └───libgobject-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libffi-6.dll
│   └───libjpeg-62.dll
│   └───libopenjp2.dll
│   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libsqlite3-0.dll
│   └───libtiff-5.dll
│   │   └───libz1.dll
│   │   └───libjpeg-62.dll
│   └───libxml2-2.dll
│   │   └───libz1.dll
│   │   └───libiconv-2.dll
│   └───libz1.dll
└───libpoppler-glib-8.dll
│   └───libpoppler-79.dll
│   │   └───libstdc++-6.dll
│   │   └───liblcms2-2.dll
│   │   └───libopenjp2.dll
│   │   └───libjpeg-62.dll
│   │   └───libpng16-16.dll
│   │   └───libtiff-5.dll
│   │   └───libz1.dll
│   └───libstdc++-6.dll
│   └───libcairo-2.dll
│   │   └───libgcc_s_seh-1.dll
│   │   └───libfontconfig-1.dll
│   │   └───libfreetype-6.dll
│   │   └───libpixman-1-0.dll
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libfreetype-6.dll
│   │   └───libharfbuzz-0.dll  
│   │   └───libpng16-16.dll
│   │   └───libz1.dll
│   └───libgio-2.0-0.dll
│   │   └───libglib-2.0-0.dll
│   │   └───libgmodule-2.0-0.dll
│   │   └───libgobject-2.0-0.dll
│   │   └───libz1.dll
│   └───libglib-2.0-0.dll
│   │   └───libintl-8.dll
│   └───libgobject-2.0-0.dll
│       └───libglib-2.0-0.dll
│       └───libffi-6.dll
└───libznz.dll
    └───libz1.dll
```
</details>
