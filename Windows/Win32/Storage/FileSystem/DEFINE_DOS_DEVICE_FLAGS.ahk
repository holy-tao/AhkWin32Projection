#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct DEFINE_DOS_DEVICE_FLAGS {
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
    static DDD_RAW_TARGET_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_REMOVE_DEFINITION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_EXACT_MATCH_ON_REMOVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_NO_BROADCAST_SYSTEM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_LUID_BROADCAST_DRIVE => 16
}
