#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_POOL_REGION {
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
    static DbgPoolRegionUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionSpecial => 1

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionPaged => 2

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionNonPaged => 3

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionNonPagedExpansion => 4

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionSessionPaged => 5

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionMax => 6
}
