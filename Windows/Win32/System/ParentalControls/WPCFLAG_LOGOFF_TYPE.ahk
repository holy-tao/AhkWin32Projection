#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the type of logoff method used.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpcflag_logoff_type
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPCFLAG_LOGOFF_TYPE extends Win32Enum {

    /**
     * The user logged off by logging off the computer.
     * Native name: WPCFLAG_LOGOFF_TYPE_LOGOUT
     * @type {Integer (Int32)}
     */
    static LOGOUT => 0

    /**
     * The user logged off by restarting the computer.
     * Native name: WPCFLAG_LOGOFF_TYPE_RESTART
     * @type {Integer (Int32)}
     */
    static RESTART => 1

    /**
     * The user logged off by shutting down the computer.
     * Native name: WPCFLAG_LOGOFF_TYPE_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static SHUTDOWN => 2

    /**
     * The user logged off by using fast user switching.
     * Native name: WPCFLAG_LOGOFF_TYPE_FUS
     * @type {Integer (Int32)}
     */
    static FUS => 4

    /**
     * The user was forced to log off by fast user switching.
     * Native name: WPCFLAG_LOGOFF_TYPE_FORCEDFUS
     * @type {Integer (Int32)}
     */
    static FORCEDFUS => 8
}
