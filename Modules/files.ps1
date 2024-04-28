#
$folders = Get-ChildItem -Attributes Directory -Path "./"
$folders
$folders | foreach {
  New-Item -Path ("./" + $_.Name + "/main.tf") -ItemType File 
  New-Item -Path ("./" + $_.Name + "/variable.tf") -ItemType File 
  New-Item -Path ("./" + $_.Name + "/output.tf") -ItemType File 
}