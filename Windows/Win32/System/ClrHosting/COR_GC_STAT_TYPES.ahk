#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct COR_GC_STAT_TYPES {
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
    static COR_GC_COUNTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_GC_MEMORYUSAGE => 2
}
