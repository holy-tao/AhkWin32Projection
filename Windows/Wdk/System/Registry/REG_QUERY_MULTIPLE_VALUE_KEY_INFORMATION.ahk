#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KEY_VALUE_ENTRY.ahk" { KEY_VALUE_ENTRY }

/**
 * @namespace Windows.Wdk.System.Registry
 */
export default struct REG_QUERY_MULTIPLE_VALUE_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    ValueEntries : KEY_VALUE_ENTRY.Ptr

    EntryCount : UInt32

    ValueBuffer : IntPtr

    BufferLength : IntPtr

    RequiredBufferLength : IntPtr

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
