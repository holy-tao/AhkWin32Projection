#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
export default struct WSC_SECURITY_PRODUCT_SUBSTATUS {
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
    static WSC_SECURITY_PRODUCT_SUBSTATUS_NOT_SET => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_SUBSTATUS_NO_ACTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_RECOMMENDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_NEEDED => 3
}
