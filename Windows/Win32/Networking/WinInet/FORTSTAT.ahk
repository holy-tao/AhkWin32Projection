#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class FORTSTAT extends Win32Enum {

    /**
     * Native name: FORTSTAT_INSTALLED
     * @type {Integer (Int32)}
     */
    static INSTALLED => 1

    /**
     * Native name: FORTSTAT_LOGGEDON
     * @type {Integer (Int32)}
     */
    static LOGGEDON => 2
}
