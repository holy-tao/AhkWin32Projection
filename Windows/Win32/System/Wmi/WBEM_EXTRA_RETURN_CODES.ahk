#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_EXTRA_RETURN_CODES {
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
    static WBEM_S_INITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_S_LIMITED_SERVICE => 274433

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_S_INDIRECTLY_UPDATED => 274434

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_S_SUBJECT_TO_SDS => 274435

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_E_RETRY_LATER => -2147209215

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_E_RESOURCE_CONTENTION => -2147209214
}
