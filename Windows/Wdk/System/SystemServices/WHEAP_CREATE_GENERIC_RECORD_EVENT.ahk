#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_CREATE_GENERIC_RECORD_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Error : CHAR[32]

    EntryCount : UInt32

    Status : NTSTATUS

}
