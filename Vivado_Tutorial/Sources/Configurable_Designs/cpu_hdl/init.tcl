
set currentFile [file normalize [info script]]
set currentDir [file dirname $currentFile]

source -notrace "$currentDir/cpu_hdl.tcl"

proc getConfigDesignInfo {} {
  #name - mandatory
  #description - optional
  return [dict create name {CPU (HDL)} description {Large mixed-language RTL project}]
}

proc getSupportedParts {} {
   return [list virtex7{xc7v585tffg1157-2} kintex7{xc7k70tfbg676-2} ] 
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

