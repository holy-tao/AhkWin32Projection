#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleFlexWrap extends Win32Enum {

    /**
     * Native name: styleFlexWrapNowrap
     * @type {Integer (Int32)}
     */
    static Nowrap => 0

    /**
     * Native name: styleFlexWrapWrap
     * @type {Integer (Int32)}
     */
    static Wrap => 1

    /**
     * Native name: styleFlexWrapWrapReverse
     * @type {Integer (Int32)}
     */
    static WrapReverse => 2

    /**
     * Native name: styleFlexWrapNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 3

    /**
     * Native name: styleFlexWrap_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
