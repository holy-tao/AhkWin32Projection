#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPLICATION_VIEW_MIN_WIDTH extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AVMW_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static AVMW_320 => 1

    /**
     * @type {Integer (Int32)}
     */
    static AVMW_500 => 2
}
