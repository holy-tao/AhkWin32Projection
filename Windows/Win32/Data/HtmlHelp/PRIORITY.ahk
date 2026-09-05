#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
class PRIORITY extends Win32Enum {

    /**
     * Native name: PRIORITY_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 0

    /**
     * Native name: PRIORITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 1

    /**
     * Native name: PRIORITY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 2
}
