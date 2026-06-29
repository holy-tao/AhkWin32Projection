#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MEMORY_CACHING_TYPE {
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
    static MmNonCached => 0

    /**
     * @type {Integer (Int32)}
     */
    static MmCached => 1

    /**
     * @type {Integer (Int32)}
     */
    static MmWriteCombined => 2

    /**
     * @type {Integer (Int32)}
     */
    static MmHardwareCoherentCached => 3

    /**
     * @type {Integer (Int32)}
     */
    static MmNonCachedUnordered => 4

    /**
     * @type {Integer (Int32)}
     */
    static MmUSWCCached => 5

    /**
     * @type {Integer (Int32)}
     */
    static MmMaximumCacheType => 6

    /**
     * @type {Integer (Int32)}
     */
    static MmNotMapped => -1
}
