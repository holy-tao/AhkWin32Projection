#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASEAPUSERIDENTITYA {
    #StructPack 4

    szUserName : CHAR[257]

    dwSizeofEapInfo : UInt32

    pbEapInfo : Int8[1]

}
