#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the header for the function table stream.
 * @remarks
 * In this context, a data stream is a set of data in a minidump file. This header structure is followed by <b>NumberOfDescriptors</b> function tables. For each function table there is a 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_descriptor">MINIDUMP_FUNCTION_TABLE_DESCRIPTOR</a> structure, then the raw system descriptor for the table, then the raw system function entry data. If necessary, alignment padding is placed between tables to properly align the initial structures.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_stream
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_FUNCTION_TABLE_STREAM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The size of header information for the stream, in bytes. This value is <c>sizeof(MINIDUMP_FUNCTION_TABLE_STREAM)</c>.
     * @type {Integer}
     */
    SizeOfHeader {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of a descriptor in the stream, in bytes. This value is <c>sizeof(MINIDUMP_FUNCTION_TABLE_DESCRIPTOR)</c>.
     * @type {Integer}
     */
    SizeOfDescriptor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of a raw system descriptor in the stream, in bytes. This value depends on the particular platform and system version on which the minidump was generated.
     * @type {Integer}
     */
    SizeOfNativeDescriptor {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of a raw system function table entry, in bytes. This value depends on the particular platform and system version on which the minidump was generated.
     * @type {Integer}
     */
    SizeOfFunctionEntry {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of descriptors in the stream.
     * @type {Integer}
     */
    NumberOfDescriptors {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The size of alignment padding that follows the header, in bytes.
     * @type {Integer}
     */
    SizeOfAlignPad {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
