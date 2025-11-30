#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlDirection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlDirectionForward => 99999

    /**
     * @type {Integer (Int32)}
     */
    static htmlDirectionBackward => -99999

    /**
     * @type {Integer (Int32)}
     */
    static htmlDirection_Max => 2147483647
}
