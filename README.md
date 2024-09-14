Installation
------------
In order to use biblatex/biber (some other packages with the same dependencies might work but have not been tested), the following environment variables must be added to the manifest of the tex editor:
```
--env=PATH=EXT_DEST/texlive/bin:EXT_DEST/texlive/bin/aarch64-linux:EXT_DEST/texlive/bin/x86_64-linux:/app/bin:/usr/bin
--env=LD_LIBRARY_PATH=EXT_DEST/texlive/lib:EXT_DEST/texlive/lib/perl5/5.40.0/aarch64-linux/CORE:EXT_DEST/texlive/lib/perl5/5.40.0/x86_64-linux/CORE
--env=PERL5LIB=EXT_DEST/texlive/lib/perl5/5.40.0:EXT_DEST/texlive/lib/perl5/site_perl/5.40.0
```
Note: The paths have to be expanded and adapted to the respective texlive installation directories.

Alternative
-----------
Another possibility to use texlive could be a local (in the user's home folder) installation of texlive. This requires access to the home folder and a user setting the required paths in accordance to his local tex installation by himself.
