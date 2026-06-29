#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_ACTION {
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
    static FILE_ACTION_ADDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_REMOVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_MODIFIED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_RENAMED_OLD_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_RENAMED_NEW_NAME => 5
}
