#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsScrollTranslation extends Win32Enum {

    /**
     * Native name: styleMsScrollTranslationNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsScrollTranslationNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleMsScrollTranslationVtoH
     * @type {Integer (Int32)}
     */
    static VtoH => 2

    /**
     * Native name: styleMsScrollTranslation_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
