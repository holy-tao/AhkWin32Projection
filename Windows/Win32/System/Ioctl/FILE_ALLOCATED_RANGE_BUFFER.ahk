#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates a range of bytes in a file.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_allocated_range_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_ALLOCATED_RANGE_BUFFER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The file offset of the start of a range of bytes in a file, in bytes.
     * @type {Integer}
     */
    FileOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The size of the range, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
