# SMLFormat: Pretty Printer for SML


This is **unofficial** repository for [SMLFormat] distribution.


## What is this

The SMLFormat consists of two components:
  formatlib (Pretty Printer library for SML)
  smlformat (Pretty Printer Generator for SML)

* `formatlib` is a pretty printer library for SML.
* `smlformat` is a pretty printer generator for SML.
* salvaged from the official SMLFormat distribution (included in SML# 0.90 compiler distribution)


## What is **not** this

* This is not official repository.


## Support platforms

* SML#

    Not supported.
    SML# > 0.90 requires interface file (.smi).

* SML/NJ

    Tested 110.97


## SML/NJ

### Install

Compile with `CM`.

```sh
$ LOCAL_LIB=~/.smlnj/lib
$ mkdir -p $LOCAL_LIB
$ echo 'CM.stabilize true "smlformatlib.cm";' | sml
$ echo "smlformatlib.cm $LOCAL_LIB/smlformatlib.cm" >> ~/.smlnj-pathconfig
$ mkdir -p $LOCAL_LIB/smlformatlib.cm
$ cp -R .cm $LOCAL_LIB/smlformatlib.cm/.cm
```

Refer to `$/smlformatlib.cm` from your `sources.cm`.


## License

This software has been developed as a part of the SML# project.
It is distributed under the BSD-style SMLSharp license, which is
included in the file LICENSE in this directory.

For the details of SML# project, consult the web page at:
http://www.pllab.riec.tohoku.ac.jp/smlsharp/

## Author

YAMATODANI Kiyoshi @2010, Tohoku University.


[SMLFormat]: https://www.pllab.riec.tohoku.ac.jp/smlsharp/ja/?cmd=view&p=SMLFormat&key=SMLFormat "SMLFormat"
