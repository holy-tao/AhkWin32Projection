#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleImeMode extends Win32Enum {

    /**
     * Native name: styleImeModeAuto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: styleImeModeActive
     * @type {Integer (Int32)}
     */
    static Active => 1

    /**
     * Native name: styleImeModeInactive
     * @type {Integer (Int32)}
     */
    static Inactive => 2

    /**
     * Native name: styleImeModeDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => 3

    /**
     * Native name: styleImeModeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleImeMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
