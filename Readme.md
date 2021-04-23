# SMLFormat: Pretty Printer for SML


This is **unofficial** repository for [SMLFormat] distribution.


## What is this

This repository is salvaged from the official SMLFormat distribution (included in SML# 0.90 compiler distribution).
The SMLFormat consists of two components:

* `smlformat-lib` is a pretty printer library for SML.
* `smlformat` is a pretty printer generator for SML.


## What is **not** this

* This is not official repository.


## Dependencies

- mllex ([mllex-polyml] for Poly/ML)
- mlyacc and mlyacc-lib ([mlyacc-polyml] for Poly/ML)
- smlnj-lib ([smlnj-lib-polyml] for Poly/ML)
- smlunit-lib (unit test)
- smldoc (documentations)


## Support platforms

* SML#

    Tested 1.0.0

* SML/NJ

    Tested 110.97, 110.98.1

* MLton

    Tested 20130715

* Poly/ML

    Tested 5.8.1


## SML&#x23;

### Build

Firstly, execute `./configure` script and then `make`.

```sh
$ ./configure
$ make
```


### Install

`smlformat` and `formatlib` are installed with `install` target:

```sh
$ make install
```


### Doc

`doc` target generates api documents to *doc/api*.
This target requires [SMLDoc].

```sh
$ make doc
```

## SML/NJ

### Build

To build `SMLFormat`, run the default target of `Makefile.smlnj`.

```sh
$ make -f Makefile.smlnj
```

The default target generates `smlformat`, `smlformat-lib`, `smlformatlib`, `ppg-ext` and `smlformat-tool` and documentations of the `SMLFormat` api.
If you do not need the documentations, run the `smlformat-nodoc` target.

```sh
$ make -f Makefile.smlnj smlformat-nodoc
```


### Install

To install `SMLFormat`, run the `install` target.

```sh
$ make -f Makefile.smlnj install
```

To change the installation directory, specify `PREFIX`:

```sh
$ make -f Makefile.smlnj install PREFIX=~/.sml/smlnj/110.99
```

If you do not need the documentations, run the `install-nodoc` target.

```sh
$ make -f Makefile.smlnj install-nodoc
```


### Doc

To generate the documentations of `SMLFormat`, run the `doc` target.

```sh
$ make -f Makefile.smlnj doc
```


### Test

To run the unit tests, run the `test` target.

```sh
$ make -f Makefile.smlnj test
```


### Example

To build examples, run the `example` target.

```sh
$ make -f Makefile.smlnj example
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
  [MLTON] typecheck smlformat-lib.mlb
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
$ MLTON_FLAGS="-mlb-path-map /path/to/mlb-path-map" make -f Makefile.mlton test
Makefile.mlton:93: smlformat-lib.mlb.d: No such file or directory
Makefile.mlton:93: generator/mlton/smlformat.mlb.d: No such file or directory
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


## Poly/ML

### Build

To build `smlformat` and `smlformat-lib`, run the default target of `Makefile.polyml`.

```sh
$ make -f Makefile.polyml
```

When some dependencies are not found, specify `PREFIX` or `LIBDIR`:

```sh
$ make -f Makefile.polyml PREFIX=~/.sml/polyml/5.8.1
```

The default target generates `smlformat`, `smlformat-lib` and it's documentations.
If you do not need the documentations, run the `smlformat-nodoc` and the `smlformat-lib-nodoc` targets.

```sh
$ make -f Makefile.polyml smlformat-nodoc
```


### Install

To install `smlformat` and `smlformat-lib`, run the `install` target.

```sh
$ make -f Makefile.polyml install
```

If you do not need the documentations, run the `install-nodoc` target.

```sh
$ make -f Makefile.polyml install-nodoc
```


### Doc

To generate the documentations of `smlformat-lib`, run the `doc` target.

```sh
$ make -f Makefile.polyml doc
```


### Test

To run the unit tests, run the `test` target.

```sh
$ make -f Makefile.polyml test
```


### Example

To build examples, run the `example` target.

```sh
$ make -f Makefile.polyml example
```


## License

This software has been developed as a part of the SML# project.
It is distributed under the BSD-style SMLSharp license, which is
included in the file LICENSE in this directory.

For the details of SML# project, consult the web page at:
http://www.pllab.riec.tohoku.ac.jp/smlsharp/

## Author

YAMATODANI Kiyoshi @2010, Tohoku University.

[mllex-polyml]: https://github.com/eldesh/mllex-polyml "MLLex for Poly/ML"
[mlyacc-polyml]: https://github.com/eldesh/mlyacc-polyml "MLYacc for Poly/ML"
[smlnj-lib-polyml]: https://github.com/eldesh/smlnjlib-polyml "SMLNJ-LIB for Poly/ML"
[SMLFormat]: https://www.pllab.riec.tohoku.ac.jp/smlsharp/ja/?SMLFormat "SMLFormat"
[SMLUnit]: http://www.pllab.riec.tohoku.ac.jp/smlsharp/?SMLUnit "SMLUnit"
[SMLDoc]: https://www.pllab.riec.tohoku.ac.jp/smlsharp/ja/?SMLDoc "SMLDoc"

