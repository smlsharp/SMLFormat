(**
 * @author YAMATODANI Kiyoshi
 * @copyright 2010, Tohoku University.
 *)
structure Main =
struct

  val tree = Tree.Node(Tree.Leaf 1, Tree.Node(Tree.Leaf 2, Tree.Leaf 3))

  fun main () =
      Tree.format_tree (SMLFormat.BasicFormatters.format_int) tree

end
