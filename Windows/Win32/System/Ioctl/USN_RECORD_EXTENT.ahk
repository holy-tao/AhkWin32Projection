#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the offset and length for an update sequence number (USN) record extent.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-usn_record_extent
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct USN_RECORD_EXTENT {
    #StructPack 8

    /**
     * The offset of the extent, in bytes.
     */
    Offset : Int64

    /**
     * The length of the extent, in bytes.
     */
    Length : Int64

}
