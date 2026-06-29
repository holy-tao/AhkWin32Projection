#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MD_FLAGS {
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
    static mMD_MemoryType => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_MemoryType => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_ROM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_RAM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static mMD_32_24 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_32_24 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_24 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_32 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static mMD_Prefetchable => 4

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_Prefetchable => 4

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_Pref => 4

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_PrefetchDisallowed => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_PrefetchAllowed => 4

    /**
     * @type {Integer (UInt32)}
     */
    static mMD_Readable => 8

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_Readable => 8

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_ReadAllowed => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_ReadDisallowed => 8

    /**
     * @type {Integer (UInt32)}
     */
    static mMD_CombinedWrite => 16

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_CombinedWrite => 16

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_CombinedWriteDisallowed => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_CombinedWriteAllowed => 16

    /**
     * @type {Integer (UInt32)}
     */
    static mMD_Cacheable => 32

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_NonCacheable => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_Cacheable => 32

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_WINDOW_DECODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static fMD_MEMORY_BAR => 128
}
