#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_GC_ROOT_KIND {
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
    static COR_PRF_GC_ROOT_STACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_FINALIZER => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_HANDLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_OTHER => 0
}
