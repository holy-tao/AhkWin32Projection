#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct OpenServiceErrors {
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
    static OS_E_NOTFOUND => -2147287038

    /**
     * @type {Integer (Int32)}
     */
    static OS_E_NOTSUPPORTED => -2147467231

    /**
     * @type {Integer (Int32)}
     */
    static OS_E_CANCELLED => -2147471631

    /**
     * @type {Integer (Int32)}
     */
    static OS_E_GPDISABLED => -1072886820
}
