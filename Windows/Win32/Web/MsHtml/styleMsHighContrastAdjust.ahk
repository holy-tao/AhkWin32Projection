#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsHighContrastAdjust extends Win32Enum {

    /**
     * Native name: styleMsHighContrastAdjustNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsHighContrastAdjustAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleMsHighContrastAdjustNone
     * @type {Integer (Int32)}
     */
    static None => 2

    /**
     * Native name: styleMsHighContrastAdjust_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
