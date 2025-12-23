#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_SFEX_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WM_SFEX_NOTASYNCPOINT => 2

    /**
     * @type {Integer (Int32)}
     */
    static WM_SFEX_DATALOSS => 4
}
