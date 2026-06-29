#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_ADD_REMOVE_ERROR_SOURCE_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Descriptor : IntPtr

    Status : NTSTATUS

    IsRemove : BOOLEAN

}
