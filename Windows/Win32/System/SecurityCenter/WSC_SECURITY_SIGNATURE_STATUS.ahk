#Requires AutoHotkey v2.0.0 64-bit

/**
 * Reports the current version status of the security product to Windows Security Center.
 * @see https://docs.microsoft.com/windows/win32/api//iwscapi/ne-iwscapi-wsc_security_signature_status
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class WSC_SECURITY_SIGNATURE_STATUS{

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
