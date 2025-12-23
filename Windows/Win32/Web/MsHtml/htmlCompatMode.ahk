#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlCompatMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlCompatModeBackCompat => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlCompatModeCSS1Compat => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlCompatMode_Max => 2147483647
}
