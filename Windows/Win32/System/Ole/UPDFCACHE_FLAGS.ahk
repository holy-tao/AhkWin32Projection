#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct UPDFCACHE_FLAGS {
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
    static UPDFCACHE_ALL => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ALLBUTNODATACACHE => 2147483646

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_NORMALCACHE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_IFBLANK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ONLYIFBLANK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_NODATACACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ONSAVECACHE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ONSTOPCACHE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_IFBLANKORONSAVECACHE => 18
}
