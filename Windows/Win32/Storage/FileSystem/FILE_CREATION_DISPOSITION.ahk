#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_CREATION_DISPOSITION {
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
    static CREATE_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_EXISTING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_ALWAYS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRUNCATE_EXISTING => 5
}
