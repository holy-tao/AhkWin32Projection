#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class FORTCMD extends Win32Enum {

    /**
     * Native name: FORTCMD_LOGON
     * @type {Integer (Int32)}
     */
    static LOGON => 1

    /**
     * Native name: FORTCMD_LOGOFF
     * @type {Integer (Int32)}
     */
    static LOGOFF => 2

    /**
     * Native name: FORTCMD_CHG_PERSONALITY
     * @type {Integer (Int32)}
     */
    static CHG_PERSONALITY => 3
}
