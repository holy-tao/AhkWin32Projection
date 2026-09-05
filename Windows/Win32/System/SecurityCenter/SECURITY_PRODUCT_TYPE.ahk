#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
class SECURITY_PRODUCT_TYPE extends Win32Enum {

    /**
     * Native name: SECURITY_PRODUCT_TYPE_ANTIVIRUS
     * @type {Integer (Int32)}
     */
    static ANTIVIRUS => 0

    /**
     * Native name: SECURITY_PRODUCT_TYPE_FIREWALL
     * @type {Integer (Int32)}
     */
    static FIREWALL => 1

    /**
     * Native name: SECURITY_PRODUCT_TYPE_ANTISPYWARE
     * @type {Integer (Int32)}
     */
    static ANTISPYWARE => 2
}
