#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct COMPRESSION_FORMAT {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_NONE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_DEFAULT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_LZNT1 => 2

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_XPRESS => 3

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_XPRESS_HUFF => 4

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_XP10 => 5

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_LZ4 => 6

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_DEFLATE => 7

    /**
     * @type {Integer (UInt16)}
     */
    static COMPRESSION_FORMAT_ZLIB => 8
}
