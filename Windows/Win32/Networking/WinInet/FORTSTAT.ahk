#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class FORTSTAT extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FORTSTAT_INSTALLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FORTSTAT_LOGGEDON => 2
}
