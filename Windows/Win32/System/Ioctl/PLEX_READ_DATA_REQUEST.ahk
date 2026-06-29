#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the range of the read operation to perform and the plex from which to read.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-plex_read_data_request
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PLEX_READ_DATA_REQUEST {
    #StructPack 8

    /**
     * The offset of the range to be read. The offset can be the virtual offset to a file or volume. File offsets should be cluster aligned and volume offsets should be sector aligned.
     */
    ByteOffset : Int64

    /**
     * The length of the range to be read. The maximum value is 64 KB.
     */
    ByteLength : UInt32

    /**
     * The plex from which to read. A value of zero indicates the primary copy, a value of one indicates the secondary copy, and so on.
     */
    PlexNumber : UInt32

}
