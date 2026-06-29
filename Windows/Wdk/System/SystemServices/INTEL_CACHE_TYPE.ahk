#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct INTEL_CACHE_TYPE {
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
    static IntelCacheNull => 0

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheData => 1

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheInstruction => 2

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheUnified => 3

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheRam => 4

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheTrace => 5
}
