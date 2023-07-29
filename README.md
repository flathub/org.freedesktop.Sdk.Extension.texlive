Installation
------------
In order to use the full functionality (e.g. `biber`) of the texlive extension, the following environment variables must be added to the manifest of the tex editor:

```
--env=PATH=EXT_DEST/texlive/bin:EXT_DEST/texlive/bin/aarch64-linux:EXT_DEST/texlive/bin/x86_64-linux
--env=LD_LIBRARY_PATH=EXT_DEST/texlive/lib:EXT_DEST/texlive/lib/perl5/5.38.0/x86_64-linux/CORE
--env=PERL5LIB=EXT_DEST/texlive/lib/perl5/5.38.0:EXT_DEST/texlive/lib/perl5/site_perl/5.38.0
```
