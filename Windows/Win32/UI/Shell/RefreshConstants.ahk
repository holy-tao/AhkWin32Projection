#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class RefreshConstants extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static REFRESH_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static REFRESH_IFEXPIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static REFRESH_COMPLETELY => 3
}
