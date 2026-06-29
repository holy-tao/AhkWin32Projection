#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct DNS_SETTINGS {
    #StructPack 8

    Version : UInt32

    Flags : Int64

    Hostname : PWSTR

    Domain : PWSTR

    SearchList : PWSTR

}
