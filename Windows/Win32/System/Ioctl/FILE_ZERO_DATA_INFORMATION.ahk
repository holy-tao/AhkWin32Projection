#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a range of a file to set to zeros.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_zero_data_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_ZERO_DATA_INFORMATION {
    #StructPack 8

    /**
     * The file offset of the start of the range to set to zeros, in bytes.
     */
    FileOffset : Int64

    /**
     * The byte offset of the first byte beyond the last zeroed byte.
     */
    BeyondFinalZero : Int64

}
