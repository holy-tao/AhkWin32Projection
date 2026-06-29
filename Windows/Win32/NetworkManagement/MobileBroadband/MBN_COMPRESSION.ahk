#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_COMPRESSION enumerated type specifies whether compression is to be used in the data link for header and data.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_compression
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_COMPRESSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Data headers are not compressed.
     * @type {Integer (Int32)}
     */
    static MBN_COMPRESSION_NONE => 0

    /**
     * Data headers are compressed.
     * @type {Integer (Int32)}
     */
    static MBN_COMPRESSION_ENABLE => 1
}
