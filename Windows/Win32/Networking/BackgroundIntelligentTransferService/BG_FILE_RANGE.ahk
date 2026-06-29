#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies a range of bytes to download from a file.
 * @remarks
 * The range must exist in the file or BITS generates an <b>BG_E_INVALID_RANGE</b> error.
 * @see https://learn.microsoft.com/windows/win32/api/bits2_0/ns-bits2_0-bg_file_range
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_FILE_RANGE {
    #StructPack 8

    /**
     * Zero-based offset to the beginning of the range of bytes to download from a file.
     */
    InitialOffset : Int64

    /**
     * The length of the range, in bytes. Do not specify a zero byte length. To indicate that the range extends to the end of the file, specify <b>BG_LENGTH_TO_EOF</b>.
     */
    Length : Int64

}
