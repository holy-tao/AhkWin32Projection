#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class FORTCMD extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FORTCMD_LOGON => 1

    /**
     * @type {Integer (Int32)}
     */
    static FORTCMD_LOGOFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static FORTCMD_CHG_PERSONALITY => 3
}
