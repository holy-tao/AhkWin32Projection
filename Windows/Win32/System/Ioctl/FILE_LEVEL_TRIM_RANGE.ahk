#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of a file that is to be trimmed.
 * @remarks
 * Before the trim operation is passed to the underlying storage system the input ranges are reduced to be 
 *     aligned to page boundaries (4,096 bytes on 32-bit and x64-based editions of Windows, 8,192 bytes on Itanium-Based 
 *     editions of Windows).
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_level_trim_range
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_LEVEL_TRIM_RANGE {
    #StructPack 8

    /**
     * Offset, in bytes, from the start of the file for the range to be trimmed.
     */
    Offset : Int64

    /**
     * Length, in bytes, for the range to be trimmed.
     */
    Length : Int64

}
