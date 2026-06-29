#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_FLUSH_MODE {
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
    static FILE_FLUSH_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static FILE_FLUSH_DATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static FILE_FLUSH_MIN_METADATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static FILE_FLUSH_NO_SYNC => 3
}
