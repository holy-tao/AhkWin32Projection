#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_SECONDARY_DUMP_DATA_EX {
    #StructPack 8

    InBuffer : IntPtr

    InBufferLength : UInt32

    MaximumAllowed : UInt32

    Guid : Guid

    OutBuffer : IntPtr

    OutBufferLength : UInt32

    Context : IntPtr

    Flags : UInt32

    DumpType : UInt32

    BugCheckCode : UInt32

    BugCheckParameter1 : IntPtr

    BugCheckParameter2 : IntPtr

    BugCheckParameter3 : IntPtr

    BugCheckParameter4 : IntPtr

}
