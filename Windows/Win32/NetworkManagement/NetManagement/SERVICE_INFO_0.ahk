#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVICE_INFO_0 {
    #StructPack 8

    svci0_name : PWSTR

}
