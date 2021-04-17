local
  structure File = OS.FileSys
  structure Path = OS.Path
  val pwd = File.getDir
  val cd = File.chDir
in

(* pushd path; use file.sml; popd *)
fun load path =
  let
    val pwd = pwd ()
  in
    cd (Path.getParent path);
    use (Path.file path) handle exn => (cd pwd; raise exn);
    cd pwd
  end
end

