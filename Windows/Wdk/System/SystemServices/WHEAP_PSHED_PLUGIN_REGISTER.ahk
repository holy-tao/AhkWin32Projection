#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PSHED_PLUGIN_REGISTER {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Version : UInt32

    Length : UInt32

    FunctionalAreaMask : UInt32

    Status : NTSTATUS

}
