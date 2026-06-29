#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASNOUSERW {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    dwTimeoutMs : UInt32

    szUserName : WCHAR[257]

    szPassword : WCHAR[257]

    szDomain : WCHAR[16]

}
