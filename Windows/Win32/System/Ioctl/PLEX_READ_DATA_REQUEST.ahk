#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the range of the read operation to perform and the plex from which to read.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-plex_read_data_request
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PLEX_READ_DATA_REQUEST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The offset of the range to be read. The offset can be the virtual offset to a file or volume. File offsets should be cluster aligned and volume offsets should be sector aligned.
     * @type {Integer}
     */
    ByteOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The length of the range to be read. The maximum value is 64 KB.
     * @type {Integer}
     */
    ByteLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The plex from which to read. A value of zero indicates the primary copy, a value of one indicates the secondary copy, and so on.
     * @type {Integer}
     */
    PlexNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
