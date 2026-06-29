#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASIPXW {
    #StructPack 4

    dwSize : UInt32

    dwError : UInt32

    szIpxAddress : WCHAR[22]

}
