#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlTabIndex extends Win32Enum {

    /**
     * Native name: htmlTabIndexNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => -32768

    /**
     * Native name: htmlTabIndex_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
