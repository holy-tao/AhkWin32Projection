#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_TYPE {
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
    static STYPE_DISKTREE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_PRINTQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_IPC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_SPECIAL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_TEMPORARY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_MASK => 255
}
