#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_PROVIDER_REQUIREMENTS_TYPE {
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
    static WBEM_REQUIREMENTS_START_POSTFILTER => 0

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_REQUIREMENTS_STOP_POSTFILTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_REQUIREMENTS_RECHECK_SUBSCRIPTIONS => 2
}
