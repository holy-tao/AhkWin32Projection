#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_SF_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WM_SF_CLEANPOINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WM_SF_DISCONTINUITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WM_SF_DATALOSS => 4
}
