#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_MODULE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_DISK => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_NGEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_DYNAMIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_COLLECTIBLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_RESOURCE => 16

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_FLAT_LAYOUT => 32

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_WINDOWS_RUNTIME => 64
}
