#! /bin/sh

TLPDB='texlive.tlpdb'
TRUNK='https://www.texlive.info/tlnet-archive'


if [ $# -ne 1 ]; then
    printf "Usage: ./tlpdb2flatyml.sh YYYY-MM-DD\n" >&2
    exit 1
fi


date=$1
year=${date%%-*}
_notyear=${date#*-}
month=${_notyear%-*}
day=${_notyear#*-}


wget "$TRUNK/$year/$month/$day/tlnet/tlpkg/$TLPDB" -O $TLPDB
wget "$TRUNK/$year/$month/$day/tlnet/tlpkg/$TLPDB.sha512" -O $TLPDB.sha512
if ! sha512sum -c texlive.tlpdb.sha512 >/dev/null; then
    printf "Checksum failure downloading tlpdb!\n" >&2
    exit 1
fi


packages="$(grep '^name [^0]\|^containerchecksum ' $TLPDB | xargs -n2 -d'\n')"

    printf "# TeXLive snapshot from %s-%s-%s\n" $year $month $day
    printf "\n- name: %s\n" texlive
    printf   "  buildsystem: simple\n"
    printf   "  sources:\n"
IFS=$'\n'
for p in $packages; do
    name=$(echo "$p" | cut -d' ' -f 2)
    cksum=$(echo "$p" | cut -d' ' -f 4)
    printf   "    - type: file\n"
    printf   "      url: %s/%s/%s/%s/tlnet/archive/%s.tar.xz\n" $TRUNK $year $month $day $name
    printf   "      sha512: %s\n" $cksum
    printf   "      dest: tlnet/archive\n"
done
    printf   "    - type: archive\n"
    printf   "      url: %s/%s/%s/%s/tlnet/%s.tar.gz\n" $TRUNK $year $month $day install-tl-unx
    printf   "      sha512: 57c44236f13017a1ce44fcc866b803618372b22ac0d96031d5fe7e08ee3c3aaabb3bcb343be8eebb40b983d867084d50a2ad67795d426f9bc595b67117bc9f88\n"
    printf   "    - type: file\n"
    printf   "      url: %s/%s/%s/%s/tlnet/tlpkg/%s/\n" $TRUNK $year $month $day $TLPDB
    printf   "      sha512: %s\n" $(cut -d' ' -f1 < texlive.tlpdb.sha512)
    printf   "      dest: tlnet/tlpkg\n"
    printf   "    - type: file\n"
    printf   "      path: $TLPDB.sha512\n"
    printf   "      dest: tlnet/tlpkg\n"
    printf   "    - type: file\n"
    printf   "      path: texlive.profile\n"
    printf   "  build-commands:\n"
    printf   "    - ./install-tl -profile texlive.profile -repository ./tlnet\n"

rm -f $TLPDB
