#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_UPDATE_IE_OP.ahk" { DOT11_UPDATE_IE_OP }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_UPDATE_IE {
    #StructPack 4

    dot11UpdateIEOp : DOT11_UPDATE_IE_OP

    uBufferLength : UInt32

    ucBuffer : Int8[1]

}
