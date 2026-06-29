#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPEMARK_TYPE {
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
    static TAPE_FILEMARKS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_LONG_FILEMARKS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SETMARKS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SHORT_FILEMARKS => 2
}
