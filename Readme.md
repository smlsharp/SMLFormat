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

### Build smlformat

To build the pretty printer generator, use `ml-build` like below:

```sh
$ ml-build smlformat.cm Main.main bin/smlformat
.
.
[creating directory .cm/amd64-unix]
[code: 327, data: 31, env: 39 bytes]
```

This command generates a heap image file named `smlformat.<arch-os>`.
For using this image, running sml with `@SMLload` option:

```sh
$ sml @SMLload=bin/smlformat FILE.ppg
```


### Install

To build pretty printer library, perform `CM.make`.

```sh
$ LOCAL_LIB=~/.smlnj/lib
$ mkdir -p $LOCAL_LIB
$ echo 'CM.stabilize true "smlformatlib.cm";' | sml
$ echo "smlformatlib.cm $LOCAL_LIB/smlformatlib.cm" >> ~/.smlnj-pathconfig
$ mkdir -p $LOCAL_LIB/smlformatlib.cm
$ cp -R .cm $LOCAL_LIB/smlformatlib.cm/.cm
```

Refer to `$/smlformatlib.cm` from your `sources.cm`.


### Test

Performs unit tests by loading `formatlib/test/sources.cm`.

```
- CM.make "formatlib/test/sources.cm";
[autoloading]
.
.
val it = true : bool
- TestMain.test();
.....................................................................................F.........................................
tests = 127, failures = 1, errors = 0
Failures:
//11/SMLFormatTest0011/5/testGuard0101: expected:<"ab
cdef">, actual:<"a
b
cdef">
Errors:
val it = () : unit
```


## License

This software has been developed as a part of the SML# project.
It is distributed under the BSD-style SMLSharp license, which is
included in the file LICENSE in this directory.

For the details of SML# project, consult the web page at:
http://www.pllab.riec.tohoku.ac.jp/smlsharp/

## Author

YAMATODANI Kiyoshi @2010, Tohoku University.


[SMLFormat]: https://www.pllab.riec.tohoku.ac.jp/smlsharp/ja/?cmd=view&p=SMLFormat&key=SMLFormat "SMLFormat"
