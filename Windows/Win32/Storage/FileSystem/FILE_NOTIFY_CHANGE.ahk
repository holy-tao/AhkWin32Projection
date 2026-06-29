#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_NOTIFY_CHANGE {
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
    static FILE_NOTIFY_CHANGE_FILE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_DIR_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_ATTRIBUTES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_LAST_WRITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_LAST_ACCESS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_CREATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_SECURITY => 256
}
