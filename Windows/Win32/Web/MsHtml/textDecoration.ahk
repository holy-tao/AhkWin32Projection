#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class textDecoration extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static textDecorationNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static textDecorationUnderline => 1

    /**
     * @type {Integer (Int32)}
     */
    static textDecorationOverline => 2

    /**
     * @type {Integer (Int32)}
     */
    static textDecorationLineThrough => 3

    /**
     * @type {Integer (Int32)}
     */
    static textDecorationBlink => 4

    /**
     * @type {Integer (Int32)}
     */
    static textDecoration_Max => 2147483647
}
