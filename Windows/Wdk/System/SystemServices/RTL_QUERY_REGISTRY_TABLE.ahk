#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_QUERY_REGISTRY_TABLE {
    #StructPack 8

    QueryRoutine : IntPtr

    Flags : UInt32

    Name : PWSTR

    EntryContext : IntPtr

    DefaultType : UInt32

    DefaultData : IntPtr

    DefaultLength : UInt32

}
