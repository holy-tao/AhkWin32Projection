#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASAUTODIALENTRYW {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    dwDialingLocation : UInt32

    szEntry : WCHAR[257]

}
