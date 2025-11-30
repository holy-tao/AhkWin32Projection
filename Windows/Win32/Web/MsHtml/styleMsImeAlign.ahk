#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleMsImeAlign extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleMsImeAlignAuto => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsImeAlignAfter => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsImeAlignNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsImeAlign_Max => 2147483647
}
