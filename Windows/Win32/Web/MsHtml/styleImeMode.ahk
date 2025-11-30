#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleImeMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleImeModeAuto => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleImeModeActive => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleImeModeInactive => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleImeModeDisabled => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleImeModeNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleImeMode_Max => 2147483647
}
