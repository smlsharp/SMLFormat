# SMLFormat: Pretty Printer for SML


This is **unofficial** repository for [SMLFormat] distribution.


## What is this

The SMLFormat consists of two components:
  formatlib (Pretty Printer library for SML)
  smlformat (Pretty Printer Generator for SML)

* `smlformatlib` is a pretty printer library for SML.
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
    32bit mode is required.

* MLton

    Tested 20130715


## SML/NJ

### Build smlformat

To build the pretty printer generator first build heap image by `ml-build` like below:
This must be done in 32bit mode, even if you use 64bit architecture host.

```sh
$ ml-build -32 smlformat.cm Main.main bin/smlformat
.
.
[creating directory .cm/x86-unix]
[code: 328, data: 72, env: 39 bytes]
```

This command build a heap image named `smlformat.x86-linux`.
Next it is needed to convert the image to an executable.

```sh
$ SMLNJ_HOME=/path/to/root/of/smlnj bin/heap2exec-fix -32 bin/smlformat.x86-linux bin/smlformat
```


### Build smlformatlib

To build the formatter library, build `smlformatlib.cm` using CM with _stabilize_ flag.

```sh
echo 'CM.stabilize true "smlformatlib.cm";'          | sml
```

Build ppg plugin in the same way.


```sh
echo 'CM.stabilize true "cmtool/ppg-ext.cm";'        | sml
echo 'CM.stabilize true "cmtool/smlformat-tool.cm";' | sml
```

`smlformatlib` and ppg plugin are supported for both 32bit and 64bit mode.


### Install

Prepare the install directories.

```sh
$ LOCAL_LIB=~/.smlnj/lib
$ LOCAL_BIN=~/.smlnj/bin
$ mkdir -p $LOCAL_LIB
$ mkdir -p $LOCAL_BIN
```

To install `smlformat`, copy the executable binary.

```sh
$ install -m 755 bin/smlformat $LOCAL_BIN
```

To install library and plugins:

```sh
$ mkdir -p $LOCAL_LIB/smlformatlib.cm
$ mkdir -p $LOCAL_LIB/ppg-ext.cm
$ mkdir -p $LOCAL_LIB/smlformat-tool.cm
$ cp -R        .cm $LOCAL_LIB/smlformatlib.cm/.cm
$ cp -R cmtool/.cm $LOCAL_LIB/ppg-ext.cm/.cm
$ cp -R cmtool/.cm $LOCAL_LIB/smlformat-tool.cm/.cm
```

Finally, register installed files.


```sh
$ cat <<EOF >> ~/.smlnj-pathconfig
smlformatlib.cm   $LOCAL_LIB/smlformatlib.cm
ppg-ext.cm        $LOCAL_LIB/ppg-ext.cm
smlformat-tool.cm $LOCAL_LIB/smlformat-tool.cm
smlformat         $LOCAL_BIN
EOF
```


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


### Examples

To build examples, load "sources.cm" in each project directories.
To load an example before install `smlformatlib` and plugins, run `sml` with special pathconfig file like below:

```sh
$ CM_LOCAL_PATHCONFIG=cmtool/local_pathconfig sml
- CM.make "examples/<project>/sources.cm";
.
.
val it = true : bool
```


## MLton

To build smlformat project with `mlton`, use `Makefile.mlton`.


### Build smlformat

Make `smlformat` target:

```sh
$ make -f Makefile.mlton smlformat
```

`bin/smlformat` will be generated.


### Install

Install by `install` target.

```sh
$ make -f Makefile.mlton install
  [MLTON] typecheck smlformatlib.mlb
................Installation has been completed.
Please add the entry to your mlb path map file:

  SMLFORMAT_LIB /usr/local/mlton/lib/SMLFormat

```

It is able to change the location with `PREFIX` variable like:

```sh
make -f Makefile.mlton PREFIX=~/.sml/mlton install
.
.
  SMLFORMAT_LIB /home/user/.sml/mlton/lib/SMLFormat

```

After `make install`, you need to add an entry in your mlb path mapping file:

```sh
$ echo 'SMLFORMAT_LIB /path/to/$PREFIX/lib/SMLFormat' >> /path/to/mlb-path-map
```


### Test

To perform unit test for `formatlib`, execute `test` target.
This Unit test requires [SMLUnit], you need to specify the path to the library.


```sh
$ make -f Makefile.mlton MLB_PATH_MAP=/path/to/mlb-path-map test
Makefile.mlton:83: smlformatlib.mlb.d: No such file or directory
Makefile.mlton:83: generator/mlton/smlformat.mlb.d: No such file or directory
.
.
  [MLTON] formatlib/test/sources
formatlib/test/sources
.....................................................................................F...............F.........................
tests = 127, failures = 2, errors = 0
Failures:
//11/SMLFormatTest0011/5/testGuard0101: expected:<"ab
cdef">, actual:<"a
b
cdef">
//14/BasicFormattersTest0001/8/testFormatReal0002: expected:<[...{0}..., Term #1 = 3, ...]>, actual:<[...{0}..., Term #1 = 1, ...]>
Errors:
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
[SMLUnit]: http://www.pllab.riec.tohoku.ac.jp/smlsharp/?SMLUnit "SMLUnit"


