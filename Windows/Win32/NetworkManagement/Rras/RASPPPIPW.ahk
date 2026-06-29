#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASPPPIPW {
    #StructPack 4

    dwSize : UInt32

    dwError : UInt32

    szIpAddress : WCHAR[16]

    szServerIpAddress : WCHAR[16]

    dwOptions : UInt32

    dwServerOptions : UInt32

}
