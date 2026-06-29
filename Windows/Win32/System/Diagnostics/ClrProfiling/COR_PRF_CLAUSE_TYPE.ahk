#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_CLAUSE_TYPE {
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
    static COR_PRF_CLAUSE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_CLAUSE_FILTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_CLAUSE_CATCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_CLAUSE_FINALLY => 3
}
