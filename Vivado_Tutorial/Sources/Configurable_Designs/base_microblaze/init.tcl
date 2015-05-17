
set currentFile [file normalize [info script]]
set currentDir [file dirname $currentFile]

source -notrace "$currentDir/microblaze.tcl"

proc getConfigDesignInfo {} {
  #name - mandatory
  #description - optional
  return [dict create name {Base MicroBlaze} description {MicroBlaze system with peripherals including GPIO and UART.}]
}

proc getSupportedParts {} {
   return [list kintex7 kintex7{xc7k325tffg900-2} kintex7{xc7k((160t.*ffg676.*(-(2|2L|3)))|(((325t)|(355t)|(410t)|(420t)|(480t)).*ffg.*(-(2|2L|3))))}] 
}


proc getSupportedBoards {} {
  

return [get_board_parts -filter {PART_NAME!~"*xc7z*" && BOARD_NAME!~*adm-pcie-7v3* && VENDOR_NAME=="xilinx.com"} -latest_file_version]

}

proc addOptions {designObject} {
  #place to define all parameters
  add_param -name num_of_processors -type long -value "1" -list_options "2,3,4" $designObject
  add_param -name num_of_peripherals -type long -value "1" -range_options "2,6"  $designObject
  add_param -name include_uart -type bool -value "false" -list_options "true,false"  $designObject
  add_param -name select_board_interface_for_uart -type string -value "rs232_uart" -list_options "rs232_uart,custom"  $designObject
  #initialization specific drc's here -related to device settings
}

proc addGUILayout {} {
  set page [add_guipage -name "Page1" -display_name "Page 1" ]
  add_guiparam -name num_of_processors -display_name "Number of Processors" -parent $page
   
  #place to define GUI layout for options
}

proc update_num_of_processors {num_of_processors include_uart} {
  if { [get_property value $num_of_processors] == "2" } {
    set_property value "false" $include_uart
  }
}

proc validate_num_of_processors {num_of_processors include_uart } {
  if { [get_property value $num_of_processors] == "2" && 
     [get_property value $include_uart] == "true" } {
    set_property errmsg "invalid config" $num_of_processors
    return false
  }
  return true
}
 
 

