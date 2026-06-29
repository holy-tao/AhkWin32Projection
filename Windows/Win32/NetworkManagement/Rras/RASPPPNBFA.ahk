#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASPPPNBFA {
    #StructPack 4

    dwSize : UInt32

    dwError : UInt32

    dwNetBiosError : UInt32

    szNetBiosError : CHAR[17]

    szWorkstationName : CHAR[17]

    bLana : Int8

}
