#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_COMPRESSION_FORMATS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static REFS_COMPRESSION_FORMAT_UNCOMPRESSED => 0

    /**
     * @type {Integer (Int32)}
     */
    static REFS_COMPRESSION_FORMAT_LZ4 => 1

    /**
     * @type {Integer (Int32)}
     */
    static REFS_COMPRESSION_FORMAT_ZSTD => 2

    /**
     * @type {Integer (Int32)}
     */
    static REFS_COMPRESSION_FORMAT_MAX => 3
}
