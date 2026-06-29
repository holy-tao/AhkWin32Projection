#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct CONFIG_INFO_0 {
    #StructPack 8

    cfgi0_key : PWSTR

    cfgi0_data : PWSTR

}
