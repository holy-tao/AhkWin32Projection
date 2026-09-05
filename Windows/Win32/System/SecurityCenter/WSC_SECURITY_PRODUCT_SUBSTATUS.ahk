#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
class WSC_SECURITY_PRODUCT_SUBSTATUS extends Win32Enum {

    /**
     * Native name: WSC_SECURITY_PRODUCT_SUBSTATUS_NOT_SET
     * @type {Integer (Int32)}
     */
    static NOT_SET => 0

    /**
     * Native name: WSC_SECURITY_PRODUCT_SUBSTATUS_NO_ACTION
     * @type {Integer (Int32)}
     */
    static NO_ACTION => 1

    /**
     * Native name: WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_RECOMMENDED
     * @type {Integer (Int32)}
     */
    static ACTION_RECOMMENDED => 2

    /**
     * Native name: WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_NEEDED
     * @type {Integer (Int32)}
     */
    static ACTION_NEEDED => 3
}
