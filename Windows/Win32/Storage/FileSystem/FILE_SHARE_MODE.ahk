#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_SHARE_MODE {
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
    static FILE_SHARE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_DELETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_WRITE => 2
}
