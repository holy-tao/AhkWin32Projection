#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlSelectType extends Win32Enum {

    /**
     * Native name: htmlSelectTypeSelectOne
     * @type {Integer (Int32)}
     */
    static SelectOne => 1

    /**
     * Native name: htmlSelectTypeSelectMultiple
     * @type {Integer (Int32)}
     */
    static SelectMultiple => 2

    /**
     * Native name: htmlSelectType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
