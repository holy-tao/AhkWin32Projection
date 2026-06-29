#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TXFS_MINIVERSION {
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
    static TXFS_MINIVERSION_COMMITTED_VIEW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_MINIVERSION_DIRTY_VIEW => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_MINIVERSION_DEFAULT_VIEW => 65534
}
