#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBackfaceVisibility extends Win32Enum {

    /**
     * Native name: styleBackfaceVisibilityVisible
     * @type {Integer (Int32)}
     */
    static Visible => 0

    /**
     * Native name: styleBackfaceVisibilityHidden
     * @type {Integer (Int32)}
     */
    static Hidden => 1

    /**
     * Native name: styleBackfaceVisibilityNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleBackfaceVisibility_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
