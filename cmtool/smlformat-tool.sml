structure SMLFormatTool =
struct
  val _ = Tools.registerStdShellCmdTool
             { tool = "SMLFormat",
               class = "smlformat",
               cmdStdPath = fn () => ("smlformat", []),
               template = NONE,
               extensionStyle = Tools.EXTEND [("sml", SOME "sml", fn x => x)],
               dflopts = [] }
end
