#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a function table stream.
 * @remarks
 * The first descriptor in the function table stream follows the header, 
  * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_stream">MINIDUMP_FUNCTION_TABLE_STREAM</a>. The generic descriptor is followed by a native system descriptor, then by <b>EntryCount</b> native system function entry structures.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_descriptor
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_FUNCTION_TABLE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The minimum address of functions described by the table.
     * @type {Integer}
     */
    MinimumAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum address of functions described by the table.
     * @type {Integer}
     */
    MaximumAddress {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The base address to use when computing full virtual addresses from relative virtual addresses in function entries.
     * @type {Integer}
     */
    BaseAddress {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of entries in the function table.
     * @type {Integer}
     */
    EntryCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The size of alignment padding that follows the function entry data, in bytes. The function entry data in the stream is guaranteed to be aligned appropriately for access to the data members. If a minidump is directly mapped in memory, it is always possible to directly reference structure members in the stream.
     * @type {Integer}
     */
    SizeOfAlignPad {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
