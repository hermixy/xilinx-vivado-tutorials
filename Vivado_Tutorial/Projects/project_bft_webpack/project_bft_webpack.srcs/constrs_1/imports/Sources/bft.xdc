create_clock -period 10.000 -name wbClk [get_ports wbClk]
create_clock -period 5.000 -name bftClk [get_ports bftClk]


set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property CFGBVS VCCO [current_design]
