
structure Main =
struct
  fun main () = Main.main (CommandLine.name(), CommandLine.arguments())
end

