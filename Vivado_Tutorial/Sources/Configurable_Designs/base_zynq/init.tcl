
set currentFile [file normalize [info script]]
set currentDir [file dirname $currentFile]

source -notrace "$currentDir/zynq.tcl"

proc getConfigDesignInfo {} {
  #name - mandatory
  #description - optional
  return [dict create name {Base Zynq} description {Zynq system that contains a GPIO and memory blocks.}]
}

proc getSupportedParts {} {
   return [list zynq{xc7z020clg484-1}] 
}


proc getSupportedBoards {} {
   return [get_board_parts -filter {PART_NAME=~"*xc7z*" && VENDOR_NAME=="xilinx.com"} -latest_file_version]

}

proc addOptions {} {
  #place to define all parameters
}

proc addGUILayout {} {
  #place to define GUI layout for options
}

