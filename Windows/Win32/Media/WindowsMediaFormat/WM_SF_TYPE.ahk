#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WM_SF_TYPE extends Win32Enum {

    /**
     * Native name: WM_SF_CLEANPOINT
     * @type {Integer (Int32)}
     */
    static CLEANPOINT => 1

    /**
     * Native name: WM_SF_DISCONTINUITY
     * @type {Integer (Int32)}
     */
    static DISCONTINUITY => 2

    /**
     * Native name: WM_SF_DATALOSS
     * @type {Integer (Int32)}
     */
    static DATALOSS => 4
}
