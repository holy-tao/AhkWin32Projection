#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a range of a file to set to zeros.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-file_zero_data_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_ZERO_DATA_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The file offset of the start of the range to set to zeros, in bytes.
     * @type {Integer}
     */
    FileOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The byte offset of the first byte beyond the last zeroed byte.
     * @type {Integer}
     */
    BeyondFinalZero {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
