(**
 * @author YAMATODANI Kiyoshi
 * @copyright 2010, Tohoku University.
 *)
structure TestMain =
struct

  fun test' (_, _) =
      let val tests = PPLibTest.suite()
      in SMLUnit.TextUITestRunner.runTest {output = TextIO.stdOut} tests
       ; OS.Process.success
      end

  fun test () =
    test' (CommandLine.name(), CommandLine.arguments())

end
