#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PSHED_INJECT_ERROR {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ErrorType : UInt32

    Parameter1 : Int64

    Parameter2 : Int64

    Parameter3 : Int64

    Parameter4 : Int64

    InjectionStatus : NTSTATUS

    InjectionAttempted : BOOLEAN

    InjectionByPlugin : BOOLEAN

}
