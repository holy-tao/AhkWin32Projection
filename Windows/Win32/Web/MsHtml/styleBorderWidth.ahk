#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleBorderWidth extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderWidthThin => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderWidthMedium => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderWidthThick => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderWidth_Max => 2147483647
}
