#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_PERMISSIONS {
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
    static ACCESS_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_CREATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_EXEC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_DELETE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ATRIB => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_PERM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ALL => 32768
}
