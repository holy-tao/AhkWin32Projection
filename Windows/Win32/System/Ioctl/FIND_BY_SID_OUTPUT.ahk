#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a file name.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-find_by_sid_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FIND_BY_SID_OUTPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Number of bytes that must be skipped to get to the next record. A value of zero indicates that this is the last record.
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Index of the file.
     * @type {Integer}
     */
    FileIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the file name, in bytes. This size does not include the NULL character.
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A null-terminated string that specifies the file name.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
