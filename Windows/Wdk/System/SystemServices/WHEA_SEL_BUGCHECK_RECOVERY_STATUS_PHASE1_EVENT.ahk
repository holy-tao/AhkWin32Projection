#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SEL_BUGCHECK_RECOVERY_STATUS_PHASE1_EVENT {
    #StructPack 8


    struct _Data {
        DumpPolicy : Int8

        Reserved : Int8[3]

    }

    WheaEventLogEntry : IntPtr

    Success : BOOLEAN

    Version : Int8

    EntryCount : UInt16

    Data : WHEA_SEL_BUGCHECK_RECOVERY_STATUS_PHASE1_EVENT._Data

}
