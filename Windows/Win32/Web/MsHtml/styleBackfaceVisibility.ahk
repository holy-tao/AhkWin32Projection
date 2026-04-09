#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBackfaceVisibility extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleBackfaceVisibilityVisible => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBackfaceVisibilityHidden => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBackfaceVisibilityNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBackfaceVisibility_Max => 2147483647
}
