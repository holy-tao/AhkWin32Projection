#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_PMC_COUNTER_OWNER_TYPE {
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
    static EtwPmcOwnerFree => 0

    /**
     * @type {Integer (Int32)}
     */
    static EtwPmcOwnerUntagged => 1

    /**
     * @type {Integer (Int32)}
     */
    static EtwPmcOwnerTagged => 2

    /**
     * @type {Integer (Int32)}
     */
    static EtwPmcOwnerTaggedWithSource => 3
}
