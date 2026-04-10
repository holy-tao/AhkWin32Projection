#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
class SECURITY_PRODUCT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PRODUCT_TYPE_ANTIVIRUS => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PRODUCT_TYPE_FIREWALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PRODUCT_TYPE_ANTISPYWARE => 2
}
