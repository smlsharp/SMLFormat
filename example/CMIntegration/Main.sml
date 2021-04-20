(**
 * @author YAMATODANI Kiyoshi
 * @copyright 2010, Tohoku University.
 *)
structure Main =
struct

  val tree = Tree.Node(Tree.Leaf 1, Tree.Node(Tree.Leaf 2, Tree.Leaf 3))

  fun main (name, args) =
      (Tree.format_tree (SMLFormat.BasicFormatters.format_int) tree
      ;OS.Process.success
      )

  fun main' () =
    ignore (main (CommandLine.name(), CommandLine.arguments()))
end
