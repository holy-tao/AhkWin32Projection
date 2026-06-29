#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_TS_SELECTORINFO {
    #StructPack 4

    bTSInfolength : Int8

    bReserved : Int8[2]

    guidNetworkType : Guid

    bTSIDCount : Int8

    usTSID : UInt16[1]

}
