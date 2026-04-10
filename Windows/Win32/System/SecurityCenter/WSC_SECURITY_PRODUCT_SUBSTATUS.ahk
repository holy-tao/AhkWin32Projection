#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
class WSC_SECURITY_PRODUCT_SUBSTATUS extends Win32Enum {

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
