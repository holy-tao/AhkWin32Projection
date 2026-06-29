#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct GET_FILE_VERSION_INFO_FLAGS {
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
    static FILE_VER_GET_LOCALISED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VER_GET_NEUTRAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VER_GET_PREFETCHED => 4
}
