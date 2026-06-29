#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Reports the current version status of the security product to Windows Security Center.
 * @see https://learn.microsoft.com/windows/win32/api/iwscapi/ne-iwscapi-wsc_security_signature_status
 * @namespace Windows.Win32.System.SecurityCenter
 */
export default struct WSC_SECURITY_SIGNATURE_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The security software reports that it is not the most recent version.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_OUT_OF_DATE => 0

    /**
     * The security software reports that it is the most recent version.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PRODUCT_UP_TO_DATE => 1
}
