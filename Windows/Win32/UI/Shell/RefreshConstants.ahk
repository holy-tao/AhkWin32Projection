#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class RefreshConstants extends Win32Enum {

    /**
     * Native name: REFRESH_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: REFRESH_IFEXPIRED
     * @type {Integer (Int32)}
     */
    static IFEXPIRED => 1

    /**
     * Native name: REFRESH_COMPLETELY
     * @type {Integer (Int32)}
     */
    static COMPLETELY => 3
}
