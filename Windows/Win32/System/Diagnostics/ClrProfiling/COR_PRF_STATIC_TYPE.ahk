#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_STATIC_TYPE {
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
    static COR_PRF_FIELD_NOT_A_STATIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_APP_DOMAIN_STATIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_THREAD_STATIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_CONTEXT_STATIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_RVA_STATIC => 8
}
