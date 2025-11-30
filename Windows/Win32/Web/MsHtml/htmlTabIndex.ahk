#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlTabIndex extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlTabIndexNotSet => -32768

    /**
     * @type {Integer (Int32)}
     */
    static htmlTabIndex_Max => 2147483647
}
