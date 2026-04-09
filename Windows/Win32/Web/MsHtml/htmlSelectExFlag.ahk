#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlSelectExFlag extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectExFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectExFlagHideSelectionInDesign => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectExFlag_Max => 2147483647
}
