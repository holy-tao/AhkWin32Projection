#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_AZCC_SET_POISON_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Bus : UInt32

    ReadSuccess : BOOLEAN

    WriteSuccess : BOOLEAN

    IsEnable : BOOLEAN

}
