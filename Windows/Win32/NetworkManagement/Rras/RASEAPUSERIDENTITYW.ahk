#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASEAPUSERIDENTITYW {
    #StructPack 4

    szUserName : WCHAR[257]

    dwSizeofEapInfo : UInt32

    pbEapInfo : Int8[1]

}
