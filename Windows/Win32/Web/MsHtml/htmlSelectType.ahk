#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlSelectType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectTypeSelectOne => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectTypeSelectMultiple => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectType_Max => 2147483647
}
