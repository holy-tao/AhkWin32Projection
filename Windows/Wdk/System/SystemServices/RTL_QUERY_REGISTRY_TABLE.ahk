#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRTL_QUERY_REGISTRY_ROUTINE.ahk" { PRTL_QUERY_REGISTRY_ROUTINE }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_QUERY_REGISTRY_TABLE {
    #StructPack 8

    QueryRoutine : PRTL_QUERY_REGISTRY_ROUTINE

    Flags : UInt32

    Name : PWSTR

    EntryContext : IntPtr

    DefaultType : UInt32

    DefaultData : IntPtr

    DefaultLength : UInt32

}
