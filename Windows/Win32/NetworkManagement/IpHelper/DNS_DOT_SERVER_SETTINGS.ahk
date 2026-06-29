#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct DNS_DOT_SERVER_SETTINGS {
    #StructPack 8

    Hostname : PWSTR

    Flags : Int64

    Port : UInt16

}
