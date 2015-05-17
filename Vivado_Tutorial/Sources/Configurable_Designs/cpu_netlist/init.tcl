
set currentFile [file normalize [info script]]
set currentDir [file dirname $currentFile]

source -notrace "$currentDir/cpu_netlist.tcl"

proc getConfigDesignInfo {} {
  #name - mandatory
  #description - optional
  return [dict create name {CPU (Synthesized)} description {Large synthesized netlist project}]
}

proc getSupportedParts {} {
   return [list kintex7{xc7k70tfbg676-2} ] 
}

proc getSupportedBoards {} {
   return ""; 
}

proc addOptions {designObject} {
  #place to define all parameters
}

proc addGUILayout {} {
  #place to define GUI layout for options
}

