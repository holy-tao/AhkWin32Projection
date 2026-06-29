#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Compression
 */
export default struct COMPRESS_ALGORITHM {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_MSZIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_XPRESS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_XPRESS_HUFF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_LZMS => 5
}
