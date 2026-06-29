#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_CONFIG {
    #StructPack 2

    uMIU : UInt16

    uWKS : UInt16

    bLTO : Int8

    bOptions : Int8

    fAutoActivate : BOOLEAN

}
