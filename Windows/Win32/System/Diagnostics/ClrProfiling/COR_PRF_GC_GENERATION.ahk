#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_GC_GENERATION {
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
    static COR_PRF_GC_GEN_0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_GEN_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_GEN_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_LARGE_OBJECT_HEAP => 3

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_PINNED_OBJECT_HEAP => 4
}
