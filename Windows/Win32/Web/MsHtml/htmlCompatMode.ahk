#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlCompatMode extends Win32Enum {

    /**
     * Native name: htmlCompatModeBackCompat
     * @type {Integer (Int32)}
     */
    static BackCompat => 0

    /**
     * Native name: htmlCompatModeCSS1Compat
     * @type {Integer (Int32)}
     */
    static ModeCSS1Compat => 1

    /**
     * Native name: htmlCompatMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
