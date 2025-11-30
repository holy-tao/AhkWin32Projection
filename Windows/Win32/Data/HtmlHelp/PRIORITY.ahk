#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PRIORITY_LOW => 0

    /**
     * @type {Integer (Int32)}
     */
    static PRIORITY_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static PRIORITY_HIGH => 2
}
