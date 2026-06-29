#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct DISKQUOTA_USERNAME_RESOLVE {
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
    static DISKQUOTA_USERNAME_RESOLVE_ASYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISKQUOTA_USERNAME_RESOLVE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISKQUOTA_USERNAME_RESOLVE_SYNC => 1
}
