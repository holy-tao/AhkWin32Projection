#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of memory regions.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_info_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MEMORY_INFO_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of the header data for the stream, in bytes. This is generally <c>sizeof(MINIDUMP_MEMORY_INFO_LIST)</c>.
     * @type {Integer}
     */
    SizeOfHeader {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of each entry following the header, in bytes. This is generally <c>sizeof(MINIDUMP_MEMORY_INFO)</c>.
     * @type {Integer}
     */
    SizeOfEntry {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of entries in the stream. These are generally  <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_memory_info">MINIDUMP_MEMORY_INFO</a> structures. The entries follow the header.
     * @type {Integer}
     */
    NumberOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
