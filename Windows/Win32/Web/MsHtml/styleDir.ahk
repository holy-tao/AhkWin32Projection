#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleDir extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleDirNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleDirLeftToRight => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleDirRightToLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleDirInherit => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleDir_Max => 2147483647
}
