#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_STATUS_BLOCK32 {
    #StructPack 4

    Status : NTSTATUS

    Information : UInt32

}
