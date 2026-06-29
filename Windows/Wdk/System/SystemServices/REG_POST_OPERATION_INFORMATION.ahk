#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_POST_OPERATION_INFORMATION {
    #StructPack 8

    Object : IntPtr

    Status : NTSTATUS

    PreInformation : IntPtr

    ReturnStatus : NTSTATUS

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
