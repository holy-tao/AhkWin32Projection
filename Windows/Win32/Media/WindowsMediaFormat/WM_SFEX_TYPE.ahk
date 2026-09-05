#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WM_SFEX_TYPE extends Win32Enum {

    /**
     * Native name: WM_SFEX_NOTASYNCPOINT
     * @type {Integer (Int32)}
     */
    static NOTASYNCPOINT => 2

    /**
     * Native name: WM_SFEX_DATALOSS
     * @type {Integer (Int32)}
     */
    static DATALOSS => 4
}
