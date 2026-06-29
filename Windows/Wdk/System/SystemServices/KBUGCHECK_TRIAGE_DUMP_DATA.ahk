#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KTRIAGE_DUMP_DATA_ARRAY.ahk" { KTRIAGE_DUMP_DATA_ARRAY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_TRIAGE_DUMP_DATA {
    #StructPack 8

    DataArray : KTRIAGE_DUMP_DATA_ARRAY.Ptr

    Flags : UInt32

    MaxVirtMemSize : UInt32

    BugCheckCode : UInt32

    BugCheckParameter1 : IntPtr

    BugCheckParameter2 : IntPtr

    BugCheckParameter3 : IntPtr

    BugCheckParameter4 : IntPtr

}
