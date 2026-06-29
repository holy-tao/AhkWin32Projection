#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_NAME {
    #StructPack 2

    wszName : WCHAR[65]

}
