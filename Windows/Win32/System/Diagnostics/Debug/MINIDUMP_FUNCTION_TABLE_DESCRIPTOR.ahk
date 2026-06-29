#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a function table stream.
 * @remarks
 * The first descriptor in the function table stream follows the header, 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_stream">MINIDUMP_FUNCTION_TABLE_STREAM</a>. The generic descriptor is followed by a native system descriptor, then by <b>EntryCount</b> native system function entry structures.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_descriptor
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_FUNCTION_TABLE_DESCRIPTOR {
    #StructPack 8

    /**
     * The minimum address of functions described by the table.
     */
    MinimumAddress : Int64

    /**
     * The maximum address of functions described by the table.
     */
    MaximumAddress : Int64

    /**
     * The base address to use when computing full virtual addresses from relative virtual addresses in function entries.
     */
    BaseAddress : Int64

    /**
     * The number of entries in the function table.
     */
    EntryCount : UInt32

    /**
     * The size of alignment padding that follows the function entry data, in bytes. The function entry data in the stream is guaranteed to be aligned appropriately for access to the data members. If a minidump is directly mapped in memory, it is always possible to directly reference structure members in the stream.
     */
    SizeOfAlignPad : UInt32

}
