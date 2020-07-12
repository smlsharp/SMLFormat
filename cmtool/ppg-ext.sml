structure PPGExt =
struct
  val _ = Tools.registerClassifier
              (Tools.stdSfxClassifier { sfx = "ppg", class = "smlformat" })
end
