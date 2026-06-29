#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASAMBW {
    #StructPack 4

    dwSize : UInt32

    dwError : UInt32

    szNetBiosError : WCHAR[17]

    bLana : Int8

}
