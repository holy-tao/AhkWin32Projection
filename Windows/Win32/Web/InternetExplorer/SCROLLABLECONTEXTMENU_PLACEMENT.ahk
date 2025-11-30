#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class SCROLLABLECONTEXTMENU_PLACEMENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_TOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_BOTTOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_LEFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_RIGHT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_FULL => 4
}
