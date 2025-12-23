#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the header for a handle data stream.
 * @remarks
 * In this context, a data stream is a set of data in a minidump file. This header structure is followed by <b>NumberOfDescriptors</b>
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_descriptor">MINIDUMP_HANDLE_DESCRIPTOR</a> or <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_descriptor_2">MINIDUMP_HANDLE_DESCRIPTOR_2</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_data_stream
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_HANDLE_DATA_STREAM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of the header information for the stream, in bytes. This value is <c>sizeof(MINIDUMP_HANDLE_DATA_STREAM)</c>.
     * @type {Integer}
     */
    SizeOfHeader {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of a descriptor in the stream, in bytes. This value is <c>sizeof(MINIDUMP_HANDLE_DESCRIPTOR)</code> or <code>sizeof(MINIDUMP_HANDLE_DESCRIPTOR_2)</c>.
     * @type {Integer}
     */
    SizeOfDescriptor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of descriptors in the stream.
     * @type {Integer}
     */
    NumberOfDescriptors {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved for future use; must be zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
