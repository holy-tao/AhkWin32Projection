#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies a single range of bytes to download from a file.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_range
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
export default struct DO_DOWNLOAD_RANGE {
    #StructPack 8

    /**
     * Zero-based offset to the beginning of the range of bytes to download from a file.
     */
    Offset : Int64

    /**
     * The length of the range, in bytes. Do not specify a zero-byte length. To indicate that the range extends to the end of the file, specify **DO_LENGTH_TO_EOF**.
     */
    Length : Int64

}
