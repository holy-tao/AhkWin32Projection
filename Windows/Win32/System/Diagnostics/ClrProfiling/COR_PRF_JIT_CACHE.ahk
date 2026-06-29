#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_JIT_CACHE {
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
    static COR_PRF_CACHED_FUNCTION_FOUND => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_CACHED_FUNCTION_NOT_FOUND => 1
}
