#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlSelectExFlag extends Win32Enum {

    /**
     * Native name: htmlSelectExFlagNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: htmlSelectExFlagHideSelectionInDesign
     * @type {Integer (Int32)}
     */
    static HideSelectionInDesign => 1

    /**
     * Native name: htmlSelectExFlag_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
