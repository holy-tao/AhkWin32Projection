#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SET_FILE_POINTER_MOVE_METHOD {
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
    static FILE_BEGIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CURRENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_END => 2
}
