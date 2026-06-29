#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct _REFS_STREAM_EXTENT_PROPERTIES {
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
    static REFS_STREAM_EXTENT_PROPERTY_VALID => 16

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_STREAM_RESERVED => 32

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_CRC32 => 128

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_CRC64 => 256

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_GHOSTED => 512

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_READONLY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_SPARSE => 8
}
