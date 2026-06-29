#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_FLAG {
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
    static CLFS_FLAG_FORCE_APPEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLFS_FLAG_FORCE_FLUSH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLFS_FLAG_NO_FLAGS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLFS_FLAG_USE_RESERVATION => 4
}
