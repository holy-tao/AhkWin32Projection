#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlDirection extends Win32Enum {

    /**
     * Native name: htmlDirectionForward
     * @type {Integer (Int32)}
     */
    static Forward => 99999

    /**
     * Native name: htmlDirectionBackward
     * @type {Integer (Int32)}
     */
    static Backward => -99999

    /**
     * Native name: htmlDirection_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
