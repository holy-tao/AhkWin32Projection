#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_EDPC_ENABLED_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    eDPCEnabled : BOOLEAN

    eDPCRecovEnabled : BOOLEAN

}
