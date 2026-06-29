#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_INFO_FLAGS_PERMISSIONS {
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
    static PERM_FILE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERM_FILE_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERM_FILE_CREATE => 4
}
