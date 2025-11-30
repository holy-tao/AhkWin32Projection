#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlDir extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlDirNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlDirLeftToRight => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlDirRightToLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlDir_Max => 2147483647
}
