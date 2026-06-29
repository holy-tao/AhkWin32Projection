#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct NVCACHE_STATUS {
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
    static NvCacheStatusUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvCacheStatusDisabling => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvCacheStatusDisabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvCacheStatusEnabled => 3
}
