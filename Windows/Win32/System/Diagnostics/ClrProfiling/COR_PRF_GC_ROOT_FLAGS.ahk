#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_GC_ROOT_FLAGS {
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
    static COR_PRF_GC_ROOT_PINNING => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_WEAKREF => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_INTERIOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_REFCOUNTED => 8
}
