#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates a range of bytes in a file.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_allocated_range_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_ALLOCATED_RANGE_BUFFER {
    #StructPack 8

    /**
     * The file offset of the start of a range of bytes in a file, in bytes.
     */
    FileOffset : Int64

    /**
     * The size of the range, in bytes.
     */
    Length : Int64

}
