#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_TYPE {
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
    static FILE_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_DISK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_CHAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_PIPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_REMOTE => 32768
}
